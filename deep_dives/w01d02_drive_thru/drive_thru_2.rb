def message_generator(type)
  welcome_messages = ["Louise: Welcome to Bob's Burger. We have specials on Hamburgers, Fish Filet and Cookies for a dollar. Can I take your order?", "Louise: Hurry up and order something, I DON'T HAVE ALL DAY HERE!", "Gene: Welcome to Gene's burgers, let me take your order!"]
  misheard_messages = ["Great,One Cauliflower's Cumin From Inside the House Burger, coming up!", "Fantastic! One Gourdon-Hamsey Burger, coming up!", "Wonderful, one Poutine on the Ritz Burger, coming up!", "Great! One The Human Polenta-pede Burger, coming up!"]
  pull_forward_messages = ["Bob: I'm so sorry. Just please pull up and we'll figure out your order.", "Gene: Come and GET EM!", "Louise: If you want em, you're going to have to pull forward and take your burgers from MY COLD DEAD HANDS!"]
  speak_up_messages = ["Louise: GENE BE QUIET! ... I'm sorry but you're going to have to speak up.", "Gene: SPEAK UP!", "Bob: I'm so sorry. My kids have had entirely too much sugar today, and are very loud. You're going to have to yell for me to hear you."]

  if type == "welcome"
    puts welcome_messages[rand(welcome_messages.length)]
  elsif type == "misheard"
    puts misheard_messages[rand(misheard_messages.length)]
  elsif type == "speak_up"
    puts speak_up_messages[rand(speak_up_messages.length)]
  elsif type == "pull_forward"
    puts pull_forward_messages[rand(pull_forward_messages.length)]
  end
end

def drive_thru
  message_generator("welcome")
  order_finished = false
  thats_it = 0

  until order_finished
    order = gets.chomp
    if order == "THAT'S IT" || order == "THATS IT"
      thats_it += 1
      if thats_it == 3
        message_generator("pull_forward")
        order_finished = true
      else
        puts "What???"
      end
    elsif order == order.upcase
      message_generator("misheard")
      puts "Anything else?"
    else
      message_generator("speak_up")
    end
  end
end

drive_thru


