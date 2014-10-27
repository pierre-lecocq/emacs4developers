#!/usr/bin/env ruby

require_relative 'functions'

# A dummy class
class Dummy
  # Accessor - author
  attr_accessor :author

  # Accessor - version
  attr_accessor :version

  # Constructor
  #
  # @param action_name [String]
  def initialize(action_name)
    # Because we are polite
    puts 'Bonjour'

    # Get a few informations
    @author = ENV['user']
    @version = [1, 5, 2].join '.'

    # And then do something ...
    dispatch action_name
  end

  # Dispatcher
  #
  # @param action [Symbol]
  def dispatch(action)
    case action
    when :create
      do_create
    when :update
      do_update
    when :delete
      do_delete
    else
      fail 'Unknown action'
    end
  end

  # Create something
  def do_create
    puts "Let's create something !"
  end

  # Update something
  def do_update
    puts "Let's update something !"
  end

  # Delete something
  def do_delete
    puts "Let's delete something !"
  end

  # The most silly thing, ever
  def compute_version
    result = 0
    @version.split('.').map! { |n| result += n.to_i }
    result
  end
end
