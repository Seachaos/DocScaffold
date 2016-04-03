#!/usr/bin/env ruby
# coding: UTF-8
Encoding.default_internal = 'UTF-8'

require 'redcarpet/compat'
require 'json'

module DocScaffold
	VERSION = '0.1.0'

	def self.require_all(path)
	  glob = File.join(File.dirname(__FILE__), path, '*.rb')
	  Dir[glob].each do |f|
	    require f
	  end
	end

	class Scaffold

		def self.load_sub_files
			DocScaffold::require_all('helper')
		end
	

		def load_template
			# load template
			thtml = TemplateHTML.new
			thtml.load(path_template_html('index.html'))
			# get template
			@template = thtml.compile
			thtml.copyResource
		end

		def load_post
			@post_loader = PostLoader.new
			post_loader = @post_loader
			post_loader.load_md(path_post_md)
			post_loader.load_html(path_post_html)
		end

		def generate_post
			ghtml = GenerateHTML.new
			ghtml.output=path_output
			ghtml.template=@template
			ghtml.posts=@post_loader.posts
			ghtml.run
		end

		def main
			Scaffold.load_sub_files
			@pwd = Dir.pwd

			load_template
			load_post
			generate_post
		end

		protected

		def path_template_html(name)
			return File.join(@pwd, 'template', name)
		end

		def path_output()
			return File.join(@pwd, 'output/')
		end

		def path_post_md()
			return File.join(@pwd, 'post/' ,'*.md')
		end

		def path_post_html()
			return File.join(@pwd, 'post/' ,'*.html')
		end
	end

	module BaseIO
		def putsWhite(arg)
		    color_code = 37
		    puts "\e[#{color_code}m#{arg}\e[0m"
		end

		def putsGreen(arg)
		    color_code = 32
		    puts "\e[#{color_code}m#{arg}\e[0m"
		end

		def putsYellow(arg)
		    color_code = 33
		    puts "\e[#{color_code}m#{arg}\e[0m"
		end

		def putsRed(arg)
		    color_code = 31
		    puts "\e[#{color_code}m#{arg}\e[0m"
		end

		def putsBlue(arg)
		    color_code = 34
		    puts "\e[#{color_code}m#{arg}\e[0m"
		end
	end
end




