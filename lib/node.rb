# frozen_string_literal: true

class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def to_s
    data.to_s
  end
end
