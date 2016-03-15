module DocScaffold
	class TemplateHTML

		attr_accessor :tokens

		def load(path)
			@file_path = path
			begin
				content = File.read(path)
				return false if content.empty?
			rescue  => e
				return false
			end
			@content = content
			@content = '' unless @content
			return true
		end

		def compile
			token = /\{\{.*?\}\}/.match(@content)
			return @content unless token
			token = token.to_s
			self.tokens = [] unless self.tokens
			self.tokens.push token
			@content = _compile_content(@content, token)
			compile
		end

		def setContent(str)
			@content = str
		end

		def getContent
			return @content
		end

		def debug()
			puts @content
		end

		protected

		# call by _compile_content
		def _compile_load_files(file)
			return '' unless @file_path
			path = File.join(File.dirname(@file_path),  file)
			thtml = TemplateHTML.new
			thtml.load(path)
			thtml.compile
		end

		def _compile_content(content, token)
			token = token
			coin = token[2..token.length-3]
			coins = coin.split(' ')
			if coins.length == 1 then
				case coins[0]
					when 'menu'
						return content.gsub(token, '[[_menu_]]')
					when 'post'
						return content.gsub(token, '[[_post_]]')
				end
				return content.gsub(token, _compile_load_files(coins[0]))
			end

			# else TODO
			return content
		end

	end
end