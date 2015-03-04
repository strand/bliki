require_relative "./app/models/base60.rb"

desc "create a new post"
task :new_post do |task|
  filepath = "posts/#{short_id}.yaml"

  File.open(filepath,  "w+") do |file|
    front_matter = "---\nuid: #{short_id}\n---\n"
    file << front_matter
  end

  puts "You created a post at #{filepath}"
end

def short_id
  @short_id ||= begin
    File.open(".counter",  "w+") { |f| f << "0" } unless File.exists? "./.counter"

    count = File.open('.counter', &:readline)
    count = Base60.encode(Base60.decode(count) + 1)

    File.open(".counter",  "w+") { |file| file << count }
    count
  end
end
