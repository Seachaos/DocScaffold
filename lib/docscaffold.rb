#!/usr/bin/env ruby
# coding: UTF-8
Encoding.default_internal = 'UTF-8'

require 'redcarpet/compat'

module DocScaffold
	VERSION = '0.1.0'

	def self.require_all(path)
	  glob = File.join(File.dirname(__FILE__), path, '*.rb')
	  Dir[glob].each do |f|
	  	puts f.to_s
	    require f
	  end
	end

	class Scaffold

		def self.load_sub_files
			DocScaffold::require_all('helper')
		end

		def template_path_html(name)
			return File.join(@pwd, 'template', name)
		end

		def main
			Scaffold.load_sub_files
			@pwd = Dir.pwd

			# load template
			thtml = TemplateHTML.new
			thtml.load(template_path_html('index.html'))

			# TODO : read content, and compile
			thtml.compile
		end
	end
end




