require 'test/unit'
require 'test_helper'

require 'obj'

class TestMeshInitialization < Test::Unit::TestCase

  def setup
    @good_file = File.expand_path(File.dirname(__FILE__) + '/good.obj')
    @invalid_file = File.expand_path(File.dirname(__FILE__) + '/invalid.obj')
    @non_existent_file = File.expand_path(File.dirname(__FILE__) + '/non_existent.obj')
  end

  def teardown
  end

  def test_good_file
    assert_nothing_raised do
      OBJ::Mesh.new(@good_file)
    end
  end

  def test_invalid_file
    assert_raise_with_message ArgumentError, 'invalid file (mtllib not supported)' do
      OBJ::Mesh.new(@invalid_file)
    end
  end

  def test_non_existent_file
    assert_raise Errno::ENOENT do
      OBJ::Mesh.new(@non_existent_file)
    end
  end
end
