module PaperclipMimetypeFu

  EXTENSIONS = YAML.load_file(File.dirname(__FILE__) + '/mime_types.yml')
  
  def self.included(base)
    base.class_eval do

      def valid?
        check_content_type
        validate
        errors.empty?
      end
  
      def check_content_type
        extname = self.original_filename.split(".").last.to_s
        content_type = EXTENSIONS[extname] || "unknown/unknown"
        instance_write(:content_type, content_type)
        true
      end

    end
  end

end
