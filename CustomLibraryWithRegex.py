import re 

def extract_clean_text(text):
  """Extracts and cleans text using regular expression."""
  print("Link Received:", text, "\n" )


  match = re.search(r'((\w+-\s*)+\w+)', text)

  print("Match:", match, "\n" )


  if match:
    text = match.group(1)
    text = re.sub("-", " ", text)

  return text
