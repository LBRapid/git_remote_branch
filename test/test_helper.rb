require 'rubygems'
require 'test/unit'

test_dir = File.dirname(__FILE__)

begin
  require 'try_require'
rescue LoadError
  require File.join( [test_dir] + %w{ .. vendor try_require try_require } )
end

try_require 'redgreen'
try_require 'ruby-debug'

require File.join(test_dir, 'git_helper')
require File.join( [test_dir] + %w{ .. lib git_remote_branch} )

class Test::Unit::TestCase
  include GitRemoteBranch

  # Passes assertion if condition is false  
  def assert_false(condition, message = nil)
    message = "assert_false failed" unless message
    assert condition == false, message
  end

end