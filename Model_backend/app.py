from flask import Flask, request, jsonify, send_file
import json
import base64
import cv2
import onnxruntime
import numpy as np
import time
from pathlib import Path
import request

app = Flask(__name__)




def LoadImageAsNDArray(path) :
    image_mat = cv2.imread(path)
    image, width_and_height = PreprocessImage(image_mat)
    image = np.asarray(np.expand_dims(image, 0))
    return (image, tuple(width_and_height))

def PreprocessImage(image, x32=True) :
    height, width = image.shape[:2]
    if x32:
        def to_32s(x):
            if x < 256:
                return 256
            return x - x % 32
        image = cv2.resize(image, (to_32s(width), to_32s(height)))
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB).astype(np.float32) / 127.5 - 1.0
    return (image, [width, height])

def SaveImage(transform_image_ndarray, width_and_height, output_image_path):
    transform_image_ndarray = (transform_image_ndarray.squeeze() + 1.0) / 2 * 255
    transform_image_ndarray = transform_image_ndarray.astype(np.uint8)
    transform_image_ndarray = cv2.resize(transform_image_ndarray, (width_and_height[0], width_and_height[1]))
    cv2.imwrite(output_image_path, cv2.cvtColor(transform_image_ndarray, cv2.COLOR_RGB2BGR))

def TransformImage(input_image_path):

    # load onnx runtime model
    print('Loading ONNX runtime model...')
    onnx_path = 'onnx/animeganv3_H64_model.onnx'
    with open(onnx_path, mode='rb') as fp:
        onnx = fp.read()
    session = onnxruntime.InferenceSession(onnx, providers=['CPUExecutionProvider'])
    x = session.get_inputs()[0].name
    y = session.get_outputs()[0].name
    print('Loaded ONNX runtime model.')

    # start inference
    print('Processing...')

    image_ndarray, width_and_height = LoadImageAsNDArray('uploads/'+input_image_path)

    # run inference
    transform_data = session.run(None, {x: image_ndarray})

    # save image
    SaveImage(transform_data[0], width_and_height, 'images/'+input_image_path)
    print(f'Processed image: "{input_image_path}" ({width_and_height[0]}×{width_and_height[1]})')


@app.route("/")
def home():
    print('enter endpoint')
    file = request.file
    file.save('uploads/' + file.filename)
    TransformImage(file.filename)
    with open('images/'+file.filename, 'rb') as f:
        image_data = f.read()
    encoded_image = base64.b64encode(image_data)
    return encoded_image

if __name__ == "__main__":
    app.run(debug=True)
