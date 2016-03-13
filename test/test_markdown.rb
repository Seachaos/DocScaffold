#!/usr/bin/env ruby
# coding: UTF-8
Encoding.default_internal = 'UTF-8'

require './inc_test.rb'

class MarkdownTest < DocScaffold::TestCase

  def test_markdown_to_html
    html = Markdown.new("This is *bongos*, indeed.").to_html
    assert_equal html.to_s , "<p>This is <em>bongos</em>, indeed.</p>\n".to_s
  end

end