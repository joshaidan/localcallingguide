$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'localcallingguide'

require 'minitest/autorun'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
