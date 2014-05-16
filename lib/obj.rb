require 'obj/version'

module OBJ
  class Mesh
    attr_accessor :vertices, :normals, :text_coords, :faces

    def initialize(file_path)
      @vertices = []
      @normals = []
      @text_coords = []
      @faces = []

      File.open(file_path, 'r') do |f|
        f.each_line do |line|
          case line.split.first
          when 'v'
            @vertices << 0.0
          when 'vt'
            @text_coords << 0.0
          when 'vn'
            @normals << 0.0
          when 'f'
            @faces << 0.0
          when 'mtllib'
            # fail ArgumentError, 'invalid file (mtllib not supported)'
          end
        end
      end
    end

    def normals?
      !@normals.empty?
    end

    def text_coords?
      !@text_coords.empty?
    end

    def to_s
      "<#{self.class} vertices: #{@vertices.size} normals: #{@normals.size}" \
      " text_coords: #{@text_coords.size} faces: #{@faces.size}>"
    end
  end
end
