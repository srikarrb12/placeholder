from flask import Flask, request, jsonify
from receiptconversion import convert

app = Flask(__name__)

@app.route('/get-pantry', methods=['POST'])
def new_groceries():
    if 'image' not in request.files:
        return jsonify({"error": "No image file provided"}), 400
    image_file = request.files['image']
    if image_file.filename.endswith('.jpg') or image_file.filename.endswith('.jpeg'):
        image_bytes = image_file.read()
        return convert(image_bytes), 200
    else:
        return jsonify({"error": "File is not a JPG image"}), 400


@app.route('/getsample', methods=['GET'])
def getsample():
    return jsonify({"message": "hello"}), 200

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True, port=5001)
