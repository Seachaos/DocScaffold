#!/usr/bin/env ruby
# coding: UTF-8
Encoding.default_internal = 'UTF-8'

require './inc_test.rb'

class MarkdownTest < DocScaffold::TestCase

  def test_markdown_to_html
    html = Markdown.new("This is *bongos*, indeed.").to_html
    assert_equal html.to_s , "<p>This is <em>bongos</em>, indeed.</p>\n".to_s
  end

  def test_PostLoader_getInfo_basic
  	DocScaffold::Scaffold.load_sub_files
  	target_file_name = 'basic.md'
  	loader = DocScaffold::PostLoader.new
  	loader.load_md(basePath + target_file_name)
  	assert_equal true, loader.posts.length>0

  	puts 'Loader--------'
  	puts loader.posts.to_json

  	loader.posts.each do |post|
  		info = post[:info]
  		assert_equal info[:file_name], target_file_name
  	end
  end

  def test_PostLoader_getInfo_headers
  	DocScaffold::Scaffold.load_sub_files
  	target_file_name = 'headers.md'
  	loader = DocScaffold::PostLoader.new
  	loader.load_md(basePath + target_file_name)
  	assert_equal true, loader.posts.length>0
  	loader.posts.each do |post|
  		info = post[:info]
  		assert_equal info[:file_name], target_file_name
  	end

  end

protected
  def basePath
  	'./file_for_test/PostLoader/'
  end

end