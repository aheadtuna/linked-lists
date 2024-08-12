# frozen_string_literal: true

require_relative 'linked_list'

l = LinkedList.new
l.append('a')
l.append('b')
puts l
puts l.at(-4)
