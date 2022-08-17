require 'mini_magick'

image = MiniMagick::Image.open(ARGV[0])

# Block to get the commandss from the terminal
ARGV.each do |argument|
  case 
  # Filters the given image to black and white
  when argument == 'to_black_and_white'
    image.colorspace 'gray'
    image.write('output.jpg')
  # Resizes the given image
  when argument.include?("resize")
    image.resize argument.split("=")[1]
    image.write('output.jpg')
  # Shows the dimensions of the given image 
  when argument == 'dimensions'
    print "Dimensions in pixels: #{image.dimensions}"
  end
end


