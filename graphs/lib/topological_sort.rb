require_relative 'graph'
require "byebug"
# Implementing topological sort using both Khan's and Tarian's algorithms


#khans
def topological_sort(vertices)
  sorted = []
  queue = []
  vertices.each do |vertex| 
    if vertex.in_edges.empty?
      queue << vertex
    end
  end
  until queue.empty? 
    cur_vertex = queue.shift
    edges = cur_vertex.out_edges
    edges.map(&:to_vertex).each do |vertex|
      if vertex.in_edges.length == 1
        queue << vertex
      end
    end
    sorted << cur_vertex
    cur_vertex.destroy!
    vertices.delete(cur_vertex)
  end
  vertices.empty? ? sorted : []
end

# tarians
# class LoopError < StandardError 
# end

# def topological_sort(vertices)
#   marked_vertices = {}
#   sorted = []
#   counter = 0 
#   until vertices.empty?
#     begin
#       visit(vertices.pop, marked_vertices, counter, sorted)
#     rescue LoopError
#       return []
#     end
#     counter += 1
#   end
#   sorted
# end

# def visit(vertex, marked_vertices, counter, sorted)
#   return if marked_vertices[vertex] == :P
#   if marked_vertices[vertex] == counter
#     p vertex.value
#     raise LoopError
#   end
#   marked_vertices[vertex] = counter
#   vertex.out_edges
#     .map(&:to_vertex).each do |adj_vert|
#       visit(adj_vert, marked_vertices, counter, sorted)
#     end
#   marked_vertices[vertex] = :P
#   sorted.unshift(vertex)
# end