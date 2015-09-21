def write_template_file(path, permalink, title, options={})
    unless File.exists?(path)
        File.open(path, 'w') do |f|
            f.puts "---"
            f.puts "layout: archive"
            f.puts "permalink: '#{permalink}'"
            f.puts "redirect_from: 'archive/#{permalink}'"
            f.puts "title: '#{title}'"
            options.each do |k, v|
                f.puts "#{k}: '#{v}'"
            end
            f.puts "---"
        end
        puts "created archive page for #{title}"
    end
end

# Create containing folders
tags_folder_path = File.expand_path("../tags/", __FILE__)
Dir.mkdir(tags_folder_path) unless File.exists?(tags_folder_path)

# Read Tags into array
tags = []
taglist_path = File.expand_path("../../_site/archive/taglist.txt", __FILE__)
File.open(taglist_path, 'r') do |f|
    while tag = f.gets
        tag = tag.strip
        tags += [tag] unless tag == "" || tag == "\n"
    end
end

# Create template files for each tag
for tag in tags
    tagpath = tag.include?(' ') ? tag.downcase.gsub!(' ','-') : tag.downcase
    tagpage_path = tags_folder_path + "/#{tagpath}.md"
    write_template_file(tagpage_path, "tags/#{tagpath}/", tag, {tag: tag})
end
