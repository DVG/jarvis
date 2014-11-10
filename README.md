# Jarvis [![Build Status](https://travis-ci.org/DVG/jarvis.svg?branch=master)](https://travis-ci.org/DVG/jarvis)

##A General Purpose Slackbox

Jarvis is an sinatra based app that responds to post requests to /jarvis with various services, located at /jarvis/services.

To add a service, simply make a new subclass of Jarvis::Services::BaseService that responds to (optionally) run and say, and add a line to Jarvis::Interpreter to direct messages to the new service.

## MemeGenerator

Jarvis can produce a number of memes. How you invoke each one is slightly different because of the dynamic nature of memes. Some you have to invoke the name of the meme, others are identified by a specific phrase

### Supported Memes

#### Success Kid

```
Jarvis Success Kid Jarvis generates memes, it works
```

#### Y U NO

```
Jarvis Y U NO SQL
```

### One Does Not Simply

```
Jarvis One does not simply test before production
```

### What if I told you

```
Jarvis What if I told you these memes can be viewed on MemeGenerator as well?
```

### Willy Wonka

```
Jarvis Willy Wonka blah blah, I can't think of something funny
```

### Overly Attached Girlfriend

```
Jarvis overly attached girlfriend I looked at your phone, who is this "Jarvis" you keep talking to?
```

### Adding New Memes

Adding additional memes is fairly straightforward. You need to make a new class under `meme_generator` that inherits from MemeGenerator::BaseMeme, and require it in meme_generator.rb. This class should implement #generator_id, #image_id that correspond to those fields in the meme generator API. It should implement a #tokenize method that extracts the meme text from the request message.

Tokenize basically takes two forms. One where two sentences are extracted to the text0 and text1 attributes, or one where one of them are constant and everything is extracted to the other one.

#### Two Token Example

```
def tokenize
  captures = request_text.match(/jarvis.+overly attached girlfriend(.[^,]+),?(.[^,]+)?/i).captures.map {|t| t.strip if t }
  self.text0 = captures[0] || ""
  self.text1 = captures[1] || ""
  true
end
```

This one captures everything after the meme name and splits it after the first comma.

#### One Token Example

```
def text0
  "One Does Not Simply"
end

def tokenize
  captures = request_text.match(/jarvis.+one does not simply(.+)/i).captures.map {|t| t.strip if t }
  self.text1 = captures[0] || ""
  true
end
```

This example has text0 as a constant value, so everything after the trigger word is extracted to text1

After this meme class is defined you simply need to update Jarvis::Services::MemeGenerator service to recognize the new trigger words in the REGEX constant, and provide a when branch in the meme_class method to route to the new meme_class. 
