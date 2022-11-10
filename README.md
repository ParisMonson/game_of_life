# Game of Life

The aim of this project was to right code capable of calculating each new generation in Conways [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).



# Design:
Two Class Approach

I decided to use a two-dimensional grid as this allowed me two accuratley represent the grid structure that the game itself is based on. I created a 'Grid' class that could be initialised to a specific grid size with an arrangement of 'alive' cells. I used this class's methods to find the live cells and check which cells needed to be changed among other grid related tasks. 

The 'Game' class was simply used to run the actual program. It is initialised with a 'Grid' object and only has two methods. 'run' which changes the grids cells based on the "Game of Life" rules, and 'display_board' which simply prints an array of live cells after the changes.

# Dependancies:

- Rubocop(Linter)
- Simplecov(Test coverage)
- Rspec(Testing)

If I wanted to make this challenge easier I could have used a 2D Ruby gem to generate the game board and calculate each new generation, however this felt like 'cheating' at the time.

# Setup:

If you want to test out my solution for yourself you can fork and clone this repo to your local machine.
You will need to install and use Ruby 3.1.2 which you can do easily by using [RVM](https://github.com/rvm/rvm) it manages Ruby application environments and enables switching between them.

Then from within the project home directory do:
```bash
bundle install
```
To see the results of the tests:
```bash
rspec
```
To test out the code for yourself you will have to do the following:

```bash
irb
```
Copy the contents of both files in the lib folder into this REPL.

Create a grid and input which cells you want to be live. Each cell is represented like this [0, 0] with this example being the top left cell of a grid. A list of cells would look like this [[0, 0], [0, 2], [3, 3]]
```ruby
grid = Grid.new([number of cells for X axis], [number of cells for Y axis])
grid.change_values([list of cells])
```

Initialise a game with this grid and run it. The new live cells will be printed each game tick until there is nothing to print.
```ruby
game = Game.new(grid)
game.run
```



