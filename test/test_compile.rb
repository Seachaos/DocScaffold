#!/usr/bin/env ruby
# coding: UTF-8
Encoding.default_internal = 'UTF-8'

require './inc_test.rb'

class CompileTest < DocScaffold::TestCase
	def test_found_token
		DocScaffold::Scaffold.load_sub_files
		thtml = DocScaffold::TemplateHTML.new
		thtml.setContent "test\naabb{{first}}qssds ads{second}ds adsa\n{{third}}dsadsa"
		thtml.compile
		tokens = ['{{first}}', '{{third}}']

		assert_true thtml.tokens.length == 2
		tokens.each do |token|
			assert_true thtml.tokens.include? token
		end
	end

	def test_compile_html
		DocScaffold::Scaffold.load_sub_files
		thtml = DocScaffold::TemplateHTML.new
		assert_true thtml.load('./file_for_test/template/index.html')
		content = thtml.compile
		assert_equal thtml.getContent, content
		path = './file_for_test/expect/expect_test_compile.test_compile_html.txt'
		assert_equal content, File.read(path)
	end

	def test_compile_with_post
		DocScaffold::Scaffold.load_sub_files
		thtml = DocScaffold::TemplateHTML.new

		assert_true thtml.load('./file_for_test/template/test_post_index.html')
		content = thtml.compile

	end
end