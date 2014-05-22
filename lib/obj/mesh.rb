module OBJ
  class Mesh
    def self.load(file_path)
      Mesh.new(file_path)
    end

    attr_accessor :vertices, :normals, :text_coords, :faces

    def initialize(file_path)
      @vertices = []
      @normals = []
      @text_coords = []
      @faces = []

      initialize_from_file(file_path)
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
