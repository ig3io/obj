require 'test/unit'
require 'test_helper'

require 'obj'

class TestMeshParsing < Test::Unit::TestCase

  def setup
    @file = File.expand_path(File.dirname(__FILE__) + '/good.obj')
    @mesh = OBJ::Mesh.new(@file)
    @vertices_size = 362
    @normals_size = 362
    @text_coords_size = 387
    @faces_size = 720

    @simple_file = File.expand_path(File.dirname(__FILE__) + '/good.simple.obj')
    @simple_mesh = OBJ::Mesh.new(@simple_file)
    @simple_vertices_size = 362
    @simple_normals_size = 0
    @simple_text_coords_size = 0
    @simple_faces_size = 720
  end

  def teardown
  end

  def test_vertices_size
    assert_equal @vertices_size, @mesh.vertices.size
    assert_equal @simple_vertices_size, @simple_mesh.vertices.size
  end

  def test_normals_size
    assert_equal @normals_size, @mesh.normals.size
    assert_equal @simple_normals_size, @simple_mesh.normals.size
  end

  def test_text_coords_size
    assert_equal @text_coords_size, @mesh.text_coords.size
    assert_equal @simple_text_coords_size, @simple_mesh.text_coords.size
  end

  def test_faces_size
    assert_equal @faces_size, @mesh.faces.size
    assert_equal @simple_faces_size, @simple_mesh.faces.size
  end

  def test_normals?
    assert_equal true, @mesh.normals?
    assert_equal false, @simple_mesh.normals?
  end

  def test_text_coords?
    assert_equal true, @mesh.text_coords?
    assert_equal false, @simple_mesh.text_coords?
  end
end
