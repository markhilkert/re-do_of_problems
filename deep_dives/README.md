# Exercise - Drive Thru Window

![drive thru window](resources/drive-thru-box.jpg)

You are going to make a program based on a series of instructions or user stories. In this exercise, you will model the conversation at a drive-thru speaker box. Your program should cover the following requirements.

### Requirements

1. When you run the program, it starts the ordering process at the drive-thru, talking to what I can only assume is a giant fiberglass clown. You hear the voice of the employee prompt you with "Welcome to Ruby Burger. We have specials on Hamburgers, Fish Filet and Cookies for a dollar. Can I take your order?"
2. The speaker box is in poor repair and the only way to be heard is by shouting, by typing in all caps. (EX: "I WANT A HAMBURGER")
3. If you do not shout, the drive-thru attendant asks for you to speak up. (EX: "I'm sorry, you'll have to speak up Ma'am")
4. If you shout, the apathetic attendant will ignore your request and simply respond with a random message from a list of prewritten phrases. (EX: "That comes with hash browns or fries.", "do you want cheese on that?", "Do you want to supersize that?", etc.)
5. If you say, "THATS IT", the attendant asks you to "Pull up to the first window." and the program ends.

# Commit 1 - Research

In this exercise, you should focus on holding the information using variables.

This is practice to better understand built-in Ruby methods, conditionals and loops. Review any of these concepts that feel unfamiliar. You can also decide on your pseudocode before you research to decide what knowledge is needed for this exercise.

- input/output - using `gets.chomp` and `puts` for an attractive printed message to the user.
- variables
- if/else statements with conditionals
- loops 
  - while/until
  - [each](https://ruby-doc.org/core-2.4.0/Array.html#method-i-each) or other [enumerable methods](https://ruby-doc.org/core-2.4.0/Enumerable.html)
  - nested loops
- Data Stuctures and built-in methods
  - [String](https://ruby-doc.org/core-2.4.0/String.html)
  - [Array](https://ruby-doc.org/core-2.4.0/Array.html)
  - [Integer](https://ruby-doc.org/core-2.4.0/Integer.html)

#### Submit answers to these questions

1. What is a method that returns the first character in a string?

For every section labeled as a Commit, you need to push your code to Github before moving to the next section.

<div class="highlight highlight-source-gfm"><pre>
git add --all
git commit -m "research drive thru"
git push origin <code style="color: red;">&lt;your-github-branch-name></code>
</pre></div>

# Commit 2 - Initial Solution

Write a `drive_thru` method that models the conversation according to the requirements stated above. Build in small pieces, don't attempt to write the entire solution at once. Write a little, then check that it does what you expect before adding more code. When you've completed your initial solution you can submit Commit 2 with the code below.

<div class="highlight highlight-source-gfm"><pre>
git add --all
git commit -m "initial solution drive thru"
git push origin <code style="color: red;">&lt;your-github-branch-name></code>
</pre></div>

# Commit 3 - Go Further

### Additional Requirements

1. Make it so you have to yell "THATS IT" 3 times before the attendant asks you to pull forward.
2. Instead of having a single option for the welcome message ("Welcome to Ruby Burger, etc."), have the employee say a random message from a list of possible welcome messages. Do the same for the messages to speak up and to notify the customer when the order is complete.

<div class="highlight highlight-source-gfm"><pre>
git add --all
git commit -m "go further drive thru"
git push origin <code style="color: red;">&lt;your-github-branch-name></code>
</pre></div>

# Commit 4 - Refactor

Review your Refactoring Guidelines. 

One thing you can try is to take your one method if it's too complex and break it in to smaller methods. Rubyists prefer writing clean single purpose methods. If you find yourself writing a complex, mutipurposed method, breaking it into smaller methods accomplishes the same goals but with more organization.

Submit a refactored solution under `Commit 4 - Refactored Solution`

<div class="highlight highlight-source-gfm"><pre>
git add --all
git commit -m "refactor drive thru"
git push origin <code style="color: red;">&lt;your-github-branch-name></code>
</pre></div>

# Bonus 1 - Adding flavor

Choose one or two options to implement:

1. Model the option to drive away if the attendant is too annoying.
2. Could there be different messages based on the attendant's mood? Could that change based on the time of day?
3. Can you request to talk to a manager?
4. If you repeat yourself, do they get angry?
5. Are there different attendants, with different scripts and personalities?

<div class="highlight highlight-source-gfm"><pre>
git add --all
git commit -m "bonus 1 drive thru"
git push origin <code style="color: red;">&lt;your-github-branch-name></code>
</pre></div>

# Bonus 2 - Take your order

Implement more features based off the following questions.

What if this resturant actually had a menu and options for those menu items?

1. How would you model that menu? 
2. How would you diplay the information to give your user the option to pick from the menu? Does the attendant list off the items at different times or could you display a printed out menu in the terminal?
3. Can you track the items ordered if the attendant wasn't apathetic and you could actually get what you ordered?
4. Can you print a display so the attendant can confirm what you ordered before pulling up?
5. Can you make changes to your order?

Tip: If you want to standardize the statements to the attendant such as "I want ...", "change ... to ...", "add ..." then look up [Regular Expressions](https://ruby-doc.org/core-2.4.1/Regexp.html) and look at [Rubular](http://rubular.com/)

<div class="highlight highlight-source-gfm"><pre>
git add --all
git commit -m "bonus 2 drive thru"
git push origin <code style="color: red;">&lt;your-github-branch-name></code>
</pre></div>

