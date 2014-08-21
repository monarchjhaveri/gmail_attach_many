# GmailAttachMany

Easily attach many files to Gmail messages. If the files total more than 25 MB, they will be sorted alphabetically and distributed amongst multiple new messages, which you can then send.

## Installation

Add this line to your application's Gemfile:

    gem 'gmail_attach_many'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gmail_attach_many

## Usage

To use:

```
gmail = Gmail.connect('username', 'password')
emailArray = gmail.attach_many('./images/*.jpg') #attach all .jpgs in the ./images/ folder. Results return in an array containing 1+ messages with attachments of up to 25MB in total size
emailArray.messages_to 'recipient@domain.com' # set the recipient of all messages in the array
emailArray.messages_subject 'The Subject Line Goes Here' #set the subject line for all messages in the array
emailArray.messages_number #number the messages, i.e. "Email 1/3", "Email 2/3", "Email 3/3"
# or, you can do emailArray.messages_subject_and_number 'The Subject Line Goes Here'
messages.
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/gmail_attach_many/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
