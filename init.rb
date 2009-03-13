require 'paperclip'
require 'paperclip_mimetype_fu'
Paperclip::Attachment.send(:include, PaperclipMimetypeFu)
