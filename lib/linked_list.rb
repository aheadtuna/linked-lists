# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_reader :tail, :size, :head

  def initialize
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if size.zero?
      @size += 1 # rubocop:disable Style/IdenticalConditionalBranches
      @head = node
    else
      @size += 1 # rubocop:disable Style/IdenticalConditionalBranches
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    if size.zero?
      node = Node.new(value)
      @size += 1
      @head = node
      @tail = node
    else
      node = Node.new(value, @head)
      @size += 1
      @head = node
    end
  end

  def at(index)
    return if index > size - 1

    if index.negative?
      steps = size + index + 1
      return nil if steps.negative?
    else
      steps = index
    end
    current_node = head

    until steps.zero?
      break if current_node.nil?

      next_node = current_node.next_node
      current_node = next_node
      steps -= 1
    end

    current_node
  end

  def to_s
    string = ''
    current_node = head
    next_node = head
    until next_node.nil?
      string += "(#{current_node.data}) -> "
      next_node = current_node.next_node
      current_node = next_node
    end
    string += 'nil' # rubocop:disable Lint/UselessAssignment
  end

  private

  attr_writer :tail, :size, :head
end
