# -*- coding: utf-8 -*-

Termtter::Client.register_hook(
  :name => :tinyurl,
  :points => [:modify_arg_for_update],
  :exec_proc => lambda {|cmd, arg|
    arg = arg.gsub(URI.regexp) do |url|
      Termtter::API.connection.start('tinyurl.com', 80) do |http|
        http.get('/api-create.php?url=' + URI.escape(url)).body
      end
    end
  }
)
