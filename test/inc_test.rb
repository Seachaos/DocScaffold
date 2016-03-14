#!/usr/bin/env ruby
# coding: UTF-8
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), *%w( .. lib ))

Encoding.default_internal = 'UTF-8'

require 'docscaffold'

require 'test/unit'

class DocScaffold::TestCase < Test::Unit::TestCase

end
