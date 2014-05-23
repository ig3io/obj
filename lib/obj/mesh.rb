module OBJ
  class Mesh
    def self.read(file_path)
      Mesh.new(file_path)
    end

    attr_accessor :vertices, :normals, :text_coords, :faces

    def initialize(file_path = nil)
      @vertices = []
      @normals = []
      @text_coords = []
      @faces = []

      unless file_path.nil?
        initialize_from_file(file_path)
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

    def write(file_path)
      File.open(file_path, 'w') do |f|
        @faces.each do |face_info|
          face_info.each do |vertex_info|
            vertex_index = vertex_info[0] - 1
            vertex = @vertices[vertex_index]
            f.puts "v #{vertex[0]} #{vertex[1]} #{vertex[2]}"
          end
        end

        if text_coords?
          @faces.each do |face_info|
            face_info.each do |vertex_info|
              text_coord_index = vertex_info[1] - 1
              text_coord = @text_coords[text_coord_index]
              f.puts "vt #{text_coord[0]} #{text_coord[1]}"
            end
          end
        end

        if normals?
          @faces.each do |face_info|
            face_info.each do |vertex_info|
              normal_index = vertex_info[2] - 1
              normal = @normals[normal_index]
              f.puts "vn #{normal[0]} #{normal[1]} #{normal[2]}"
            end
          end
        end
      end
    end


    private

    def initialize_from_file file_path
      File.open(file_path, 'r') do |f|
        f.each_line do |line|
          type, *data = line.split
          case type
          when 'v'
            @vertices << data.map {|d| d.to_f}
          when 'vt'
            @text_coords << data.map {|d| d.to_f}
          when 'vn'
            @normals << data.map {|d| d.to_f}
          when 'f'
            @faces << data.map {|v| v.split('/').map {|attr| attr.to_i}}
          when 'mtllib'
            # TODO: not implemented
          end
        end
      end
    end
  end
end
