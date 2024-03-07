import cohere
from ocr import ocr

api_key = 'QYlfXcdxXQECRIFMPQOSG2ZRUhYX1qVifk2RbaHR'
co = cohere.Client(api_key)

def convert(image_bytes):
    prompt = 'Below is text from a scan of a grocery store receipt. Please take the item names and convert it into a list of non-abbreviated groceries (fully expand each name) and omit all of the prices and subtotals and use title case. Format your response as JSON with two fields per grocery item, the "Name" and the "Quantity":\n'
    prompt += ocr(image_bytes, api_key='K89997980488957')

    response = co.generate(
        model='command-nightly',  # Choose the model size
        prompt=prompt,  # Your prompt for the LLM
        max_tokens=8192,  # Maximum number of tokens to generate
        temperature=0.5,  # Controls the randomness of the output
        k=0,  # Controls diversity via top-k sampling
        p=1,  # Controls diversity via nucleus sampling
        frequency_penalty=0,  # Decreases the likelihood of repetition
        presence_penalty=0)  # Penalizes new tokens based on their existing presence

    return response.generations[0].text

# image_path = 'be8acd61cd438a619ca2e40390657ba0.jpg'
# with open(image_path, 'rb') as image_file:
#     image_bytes = image_file.read()
# result = convert(image_bytes)
# print(result)