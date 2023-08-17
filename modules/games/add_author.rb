module AddAuthor
  def add_new_author
    first_name = input_first_name
    last_name = input_last_name
    Author.new(first_name, last_name)
  end

  def input_first_name
    print "please enter the author's first name: "
    gets.chomp.to_s
  end

  def input_last_name
    print "please enter the author's last name: "
    gets.chomp.to_s
  end
end
