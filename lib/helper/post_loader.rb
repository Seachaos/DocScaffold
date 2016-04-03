module DocScaffold
	class PostLoader
		include BaseIO

		attr_accessor :posts

		def initialize
			self.posts = []
		end

		def save_post(html, info)
			self.posts.push({
				:html => html,
				:info => info
			})
		end

		def splitContentWithHashTag
			index = 0
			contents = @content.split('#/')
			contents.select! {
				index = index + 1
				index > 1
			}

			texts = []
			contents.each do |content|
				text = content.split('/#')
				text = text[0]
				texts.push(text)
			end
			return texts
		end

		def get_info_from_content(f)
			basename = File.basename(f, '.*')
			info = {
				:content => @content,
				:info => {
					:order => 0,
					:category => '',
					:dir => '',
					:file_name => basename,
					:name => basename,
					:escape_html => false
				}
			}

			# scan file header with hash tag
			file_headers = @content.scan(/\/\#([^\#\/]+)/)

			# if no file_headers, retunr it
			return [info] if file_headers.length<1

			infos = []
			# split contents
			texts = self.splitContentWithHashTag
			
			# create infos
			index = 0
			file_headers.each do |file_header|
				begin
					json = JSON.parse(file_header[0])
					text = texts[index]
					index = index + 1

					# fill info datas

					# name
					name = info[:info][:file_name]
					name = json['name'] unless json['name'].nil?

					# dir
					dir = info[:info][:dir]
					unless json['category'].nil?
						dir = convertFileName(json['category']) + '_'
						info[:info][:dir] = dir
						info[:info][:category] = json['category']
					end

					info[:info][:file_name] = convertFileName(name)
					info[:info][:file_name] = convertFileName(json['file_name']) unless json['file_name'].nil?
					info[:info][:name] = name
					info[:info][:escape_html] = json['escape_html'] unless json['escape_html'].nil?

					# putsYellow json
					# putsWhite info[:info]

					newInfo = info[:info].clone
					newInfo[:order] = json['order'] unless json['order'].nil?
					infos.push({
						:content => text,
						:info => newInfo
					})
				rescue  => e
					putsRed e
				end
			end
			return infos
			
		end

		def convertFileName(name)
			name = File.basename(name, '.*')
			name = name.downcase
			name = name.gsub(/\W/,'_')
			return name
		end

		def load_md(path)
			@file_path = path
			Dir[path].each do |f|
				@content = File.read(f)
				infos = get_info_from_content(f)

				infos.each do |info|
					opt = {}
					opt[:escape_html] = true if info[:info][:escape_html]
					renderer = Redcarpet::Render::HTML.new(opt)
					markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
					html = markdown.render(info[:content])
					save_post(html, info[:info])
				end
			end
		end

		def load_html(path)
			@file_path = path
			Dir[path].each do |f|
				@content = File.read(f)
				infos = get_info_from_content(f)

				infos.each do |info|
					html = info[:content]
					save_post(html, info[:info])
				end
			end
		end
	end
end