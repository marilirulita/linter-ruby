![](https://img.shields.io/badge/Microverse-blueviolet)

# linter-ruby

> In this project, I built my own linter tool, for check errors in ruby grammar. 

## Linter Instructions
* This code gives information about errors in ruby typing
* Each time you run the code, it will review the ./lib/tester.rb file, which store an example of a bad code.
* You can modify the ./lib/tester.rb file to see how it changes the different recommendations about correct typing of your code, given in your console.

### Examples Good VS Bad code

#### Unexpected or missed end

>**It checks if there is necessary to add or remove an end to close a block code.**

**Example of Bad code**

    class Test
      def test_method(arg)
        x = arg + arg
            <---- Missed end
    end 

**Example of Good code**

    class Test
      def test_method(arg)
        x = arg + arg
      end   <---- Unmissed end
    end 



## Built With

- Ruby
 
- Rubocop linters

- Rspec test

## Getting Started

- Make sure Ruby is installed on your computer

- To get your own copy of our project simply clone the repository to your local machine.

- Open CMD

- Type the following command into a git shell

  git clone https://github.com/marilirulita/linter-ruby.git

- Run the program from command line, then open it in a text editor

## How to run this project

**Run the following command in the terminal**

- Navigagte into the linter-ruby folder
  ```
  cd linter-ruby
  ```
- Execute the "main.rb" file typing:
  ```
  ruby ./bin/main.rb
  ```
- You will see error messages in your console to help you fix your code typing
  ```
  Line 17, there is an empty space at the end
  Line 27, there is a doble space between words
  ```

## Authors

👤 **Mar y Sol Bautista**

- GitHub: [@marilirulita](https://github.com/marilirulita)
- Linkedin: [Mar y Sol Bautista](https://www.linkedin.com/in/mar-y-sol-bautista-alvarez-5a6894151/)
- Twiter: [@marylirulita](https://twitter.com/marylirulita)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/marilirulita/linter-ruby/issues).

## Show your support

Give a ⭐️ if you like this project!