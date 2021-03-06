module DocScaffold
	class GenerateHTML
		include BaseIO
		
		def output=(value)
			@output_dst = value
		end
		def template=(value)
			@template = value
		end
		def posts=(value)
			@posts = value
		end

		def run
			menu = genMenuHTML
			@posts.each do |post|
				html = post[:html]

				# merge template
				html = @template.gsub('[[_post_]]', html)
				html = html.gsub('[[_menu_]]', menu)

				# create dir first
				# FileUtils::mkdir_p  @output_dst + post[:info][:dir]

				# write file...
				file_name = File.basename(post[:info][:file_name], '.*')
				# file_path = File.join(@output_dst, post[:info][:dir], file_name + '.html')
				file_path = File.join(@output_dst, post[:info][:dir] + file_name + '.html')
				putsWhite 'write file:'
				puts file_path
				File.open(file_path, 'w'){ |file|
					file.write(html)
				}
			end
		end

		def genMenuHTML
			html = ''

			# prepare for order
			posts = @posts.map { |post|
				post = post.clone
				if post[:info][:category].empty? then
					post[:info][:category_order] = '0'
				else
					post[:info][:category_order] = post[:info][:category]
				end
				post
			}

			# order
			posts = posts.sort { |a, b|
				resp = a[:info][:category_order] <=> b[:info][:category_order]
				if resp == 0
					resp = a[:info][:order] <=> b[:info][:order]
				end
				if resp == 0
					resp = a[:info][:name] <=> b[:info][:name]
				end
				resp
			}

			
			category_in = false
			posts.each do |post|
				info = post[:info]
				path = info[:dir] + info[:file_name] + '.html'
				if category_in != info[:category] then
					html = html + "</ul>\n" unless category_in === false
					html = html + "<b>" + info[:category] + "</b>"
					html = html + "<ul>\n"
					category_in = info[:category]
				end
				html = html + '<li><a href="' + path +'">' + info[:name] + "</a></li>\n"
			end

			unless html.empty?
				html += "</ul>\n"
			end

			html
		end
	end
end