module DocScaffold
	class TemplateHTML
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

		def debug()
			puts @content
		end
	end
end