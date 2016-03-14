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
end