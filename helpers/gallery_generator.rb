###
# Helper per rapida generazione gallerie
# bundle exec ruby helpers/gallery_generator.rb assets/images/posts/bottega_alta_2015
require 'yaml'
path = ARGV[0]
directory = File.join(Dir.pwd, path)

gallery = (Dir.glob("#{directory}/*.jp*g") + Dir.glob("#{directory}/*.png")).collect do |img|
  {
    "url"=> File.join("/",path,File.basename(img)),
    "image_path"=> File.join("/",path,File.basename(img))
  }
end

puts ({ "gallery"=> gallery }.to_yaml)
