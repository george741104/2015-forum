namespace :fake do

  task :fake_posts => :environment do
    puts"deleting all posts"

    posts_num = Post.all.length
    Post.delete_all

    puts"#{posts_num} posts deleted"
    puts"===================="



    sleeping = 3
    i = sleeping

    while i > 0 do
      puts "creating fake posts in #{i} seconds"
      i-=1
      sleep 1
    end

    puts"creating fake posts NOW ======================="
    50.times do |i|
      p = Post.create(:title => Faker::App.name, :content=>Faker::Lorem.paragraph(10))
      p.save
      puts "#{p.title} created"
      puts "sample => #{p.content.first(100)}"
    end
    puts "fake_post task completed"
  end


end
