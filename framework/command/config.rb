module PACKMAN
  class Commands
    def self.config
      if not PACKMAN.does_command_exist? 'vim'
        CLI.report_error "Editor #{CLI.red 'vim'} does not exist!"
      end
      editor = 'vim'
      system "#{editor} -c 'set filetype=ruby' #{CommandLine.config_file}"
    end
  end
end
