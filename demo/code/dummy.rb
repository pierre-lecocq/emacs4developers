#!/usr/bin/env ruby

# A dummy class
class Dummy
  # Constructor
  def initialize(action_name = nil)
    puts 'Bonjour'

    dispatch action_name

    # puts 'Au revoir'
  end

  # Dispatcher
  def dispatch(action)
    case action
    when :create
      puts 'Create ...'
    when :update
      puts 'Update ...'
    when :delete
      puts 'Delete ...'
    else
      fail 'Unknown action'
    end
  end
end
