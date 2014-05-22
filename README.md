# OBJ

Simple OBJ (wavefront model format) file utils.

It currently supports only OBJ files with triangulated faces and only one submesh.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'obj'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install obj

## Usage

### Command line

    obj-parse <file_path>

### Ruby gem

```ruby
require 'obj'

obj = OBJ::Mesh.new('my_obj_file.obj')

obj.vertices  # => [[-1.1, 1.1, 0.0], ...]
obj.normals  # => [[1.0, 0.0, 0.0], ...]
obj.text_coords # => [[0.0, 0.1], ...]
obj.faces  # => [[[1, 1, 1], [2, 2, 1], [3, 3, 2]], [...], ...]

obj.normals?  # => true
obj.text_coords?  # => true
```

## Contributing

1. Fork it ( https://github.com/iconpin/obj/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
