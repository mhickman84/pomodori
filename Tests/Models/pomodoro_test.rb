require File.dirname(__FILE__) + '/../test_helper'
require 'pomodoro'

class PomodoroTest < Test::Unit::TestCase
  def setup
    @pomodoro = Pomodoro.new
  end
  it 'initializes with timestamps' do
    now = NSDate.dateWithString("2009-05-11 18:06:43 -0500")
    pomodoro = Pomodoro.new({:text => "hola", :timestamp => now})
    pomodoro.text.should =~ /hola/
    now.description.should == pomodoro.timestamp.description
  end
  it 'has default timestamp' do
    @pomodoro.timestamp.description.should_not == nil
  end
  it 'should extract tags from the description' do
    pomodoro = Pomodoro.new(:text => "@at @cips urban @nop")
    pomodoro.tags.size.should == 3
    pomodoro.tags.should include("@nop") 
  end
end
