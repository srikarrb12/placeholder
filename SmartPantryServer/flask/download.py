from flask import Flask, request, redirect, url_for
import os

app = Flask(__name__)

# Define the path where you want to save the file
# Update the path below to the location of your desktop
desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")

@app.route('/', methods=['GET'])
def index():
    return '''
    <!doctype html>
    <title>Upload new File</title>
    <h1>Upload new Log File</h1>
    <form method=post enctype=multipart/form-data action="/upload">
      <input type=file name=file>
      <input type=submit value=Upload>
    </form>
    '''

@app.route('/upload1', methods=['POST'])
def upload_file1():
    if 'file' not in request.files:
        return redirect(request.url)
    file = request.files['file']
    if file.filename == '':
        return redirect(request.url)
    if file and file.filename == 'logs.log':
        file.save(os.path.join(desktop_path, file.filename))
        return 'File successfully saved to your desktop.'
    return 'Please upload a file named logs.log.'

desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")

@app.route('/upload2', methods=['POST'])
def upload_file2():
    print("Accessed API")
    data = request.data  # Retrieve the binary data from the request
    if data:  # Check if there is any data
        print(f"Received data of size: {len(data)} bytes")
        try:
            file_path = os.path.join(desktop_path, 'logs.log')
            with open(file_path, 'wb') as f:
                f.write(data)
            print('File successfully saved to your desktop.')
            return 'File successfully saved to your desktop.'
        except Exception as e:
            print(f"Error occurred: {e}")
            return "An error occurred while saving the file.", 500
    else:
        print("No data received.")
        return "No data received.", 400

if __name__ == '__main__':
    app.run(debug=True)