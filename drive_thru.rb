
# def message_generator(type)
#   p type

#   if type == "message"
#     puts "This is a message."
#   end
  
#   puts("What is going on?")

# end

# message_generator("message")

def message_generator(message_type)
  welcome_message = ["welcome message 1", "welcome message 2", "welcome message 3", "welcome_message 4"]
  go_to_window_message = ["go to window message 1", "go to window message 2", "go to window message 3"]
  lower_case_response_message = ["lower case response message 1", "lower case response message 2", "lower case response message 3", "lower case response message 4", "lower case response message 5"]

  if message_type == "welcome" 
    puts welcome_message[rand(welcome_message.length)]
  elsif message_type == "go_to_window" 
    puts go_to_window_message[rand(go_to_window_message.length)]
  elsif message_type == "lower_case_response" 
    puts lower_case_response_message[rand(lower_case_response_message.length)]
  end
end

message_generator("welcome")
message_generator("go_to_window")
message_generator("lower_case_response")

def drive_thru
  order_complete = false
  thats_it_count = 0

  message_g

  until order_complete
    order = gets.chomp

    if order == "THATS IT"
      puts "misunderstand and ask again"
      thats_it_count += 1
      if thats_it_count == 3
        puts "go to window message 1"
        order_complete = true
      end
    elsif order == order.upcase
      puts "response to shouting message 1"
    else
      puts "response to lower case message 1"
    end
  end

end

drive_thru

