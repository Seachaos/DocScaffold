module DocScaffold
	class TemplateHTML

		attr_accessor :tokens

		def load(path)
			begin
				content = File.read(path)
				return false if content.empty?
			rescue  => e
				return false
			end
			@content = content
			return true
		end

		def compile
			token = /\{\{.*?\}\}/.match(@content)
			return unless token
			token = token.to_s
			self.tokens = [] unless self.tokens
			self.tokens.push token
			@content = _compile_content(@content, token)
			compile
		end

		def setContent(str)
			@content = str
		end

		def debug()
			puts @content
		end

		protected

		def _compile_load_files
			return '__TODO__FILE'
		end

		def _compile_content(content, token)
			token = token
			coin = token[2..token.length-3]
			coins = coin.split(' ')
			if coins.length == 1 then
				return content.gsub(token, _compile_load_files)
			end

			# else TODO
			return content
		end

	end
end