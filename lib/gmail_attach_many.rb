require "gmail"
require "gmail_attach_many/version"

module GmailAttachMany
  class MessageArray < Array
    def messages_to (recipientString)
      self.each do |m|
        m.to recipientString
      end
    end
    def messages_subject (subjectString)
      self.each do |m|
        m.subject subjectString
      end
    end
    def messages_number
      self.each_index do |m|
        m.subject = m.subject + "#{m+1}/#{self.length+1}"
      end
    end
    def messages_subject_and_number (subjectString)
      self.messages_subject (subjectString)
      self.messages_number
    end
  end
end

class Gmail::Client::Plain
  def attach_many (pathPattern)

    total_limit = 25*1024*1024
    messageArray = GmailAttachMany::MessageArray.new
    attachments = []

    files = Dir.glob(pathPattern).find_all {|f| File.file? f}
    files.sort_by!{ |m| m.downcase }
    
    files.inject(0) do |sum, f|
      if !(File.size(f) > total_limit)
        total = sum + File.size(f)
        if total > total_limit
          message = self.compose
          attachments.each  do |a|
            message.add_file a
          end
          messageArray.push message
          attachments = [f]
          total = File.size(f)
        else
          attachments.push f
          if (files.find_index f) == (files.length - 1)
            message = self.compose
            attachments.each  do |a|
              message.add_file a
            end
            messageArray.push message
          end
          total
        end
      else
        raise "One of the files selected is too big to attach to an email. File name: #{f}. File size: #{File.size(f)} Limit is #{total_limit} bytes."
      end
    end
    return messageArray
  end
end
