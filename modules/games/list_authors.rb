module ListAuthors
  def list_all_authors
    if @authors_list.empty?
      puts 'No Authors have been stored yet!'
    else
      @authors_list.each_with_index do |author, i|
        puts "#{i}) first_name: #{author.first_name}, last_name:#{author.last_name}"
      end
    end
    print 'press enter to continue..'
    gets.chomp
  end

  def list_all_authors_not_smooth
    if @authors_list.empty?
      puts 'No Authors have been stored yet!'
    else
      @authors_list.each_with_index do |author, i|
        puts "#{i}) first_name: #{author.first_name}, last_name:#{author.last_name}"
      end
    end
  end
end
