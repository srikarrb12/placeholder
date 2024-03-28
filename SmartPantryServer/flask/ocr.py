import requests

def ocr(image_bytes, overlay=False, api_key="your_api_key_here", language='eng'):
    """ OCR.space API request with local file.
        Python3.5 - not tested on 2.7
    :param filename: Your file path & name.
    :param overlay: Is OCR.space overlay required in your response.
                    Defaults to False.
    :param api_key: OCR.space API key.
    :param language: Language code to be used in OCR.
                     Must be supported by OCR.space API.
    :return: Result in JSON format.
    """
    payload = {
        'isOverlayRequired': overlay,
        'apikey': api_key,
        'language': language,
    }

    files = {
        'image': ('image.png', image_bytes)
    }

    r = requests.post('https://api.ocr.space/parse/image',
                             files=files,
                             data=payload)
    return r.json()['ParsedResults'][0]['ParsedText']

# image_path = 'be8acd61cd438a619ca2e40390657ba0.jpg'
# with open(image_path, 'rb') as image_file:
#     image_bytes = image_file.read()
# result = ocr(image_bytes=image_bytes, api_key='K89997980488957')
# print(result)