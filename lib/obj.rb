require "obj/version"

module OBJ
  class Mesh
    attr_accessor :vertices, :normals, :text_coords, :faces

    def initialize(vertices: 0, normals: 0, text_coords: 0, faces: 0)
      @vertices = 0
      @normals = 0
      @text_coords = 0
      @faces = 0
    end

    def to_s
      "<#{self.class} vertices: #{@vertices} normals: #{@normals}" \
      " text_coords: #{@text_coords} faces: #{@faces}>"
    end
  end

  def self.parse(file_path)
    info = Mesh.new

    File.open(file_path, 'r') do |f|
      f.each_line do |line|
        case line[0,2]
        when 'v '
          info.vertices += 1
        when 'vt'
          info.text_coords += 1
        when 'vn'
          info.normals += 1
        when 'f '
          info.faces += 1
        end
      end
    end

    puts info
  end
end
