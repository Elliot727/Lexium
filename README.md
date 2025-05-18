# Lexium

A word-guessing game inspired by Wordle, built with Swift and SwiftUI.

## About

Lexium is a fun and engaging word-guessing game where players have to guess a hidden word within a limited number of attempts. The game provides feedback on each guess, indicating which letters are correct, which are in the wrong position, and which are incorrect. This project is built using Swift and SwiftUI, leveraging modern iOS development practices.

## Features

- **Word Guessing**: Players guess a hidden word within a limited number of attempts.
- **Feedback System**: Provides feedback on each guess, indicating correct letters, wrong positions, and incorrect letters.
- **Reset Game**: Resets the game to a new word and starts a new session.
- **Error Handling**: Displays error messages for invalid guesses or when the game is over.
- **Win/Lose Alerts**: Displays alerts when the player wins or loses the game.
- **Customizable Word List**: Loads words from a JSON file, allowing for easy customization of the word list.

## Getting Started

### Prerequisites

- Xcode 12 or later
- macOS 10.15 or later
- iOS 14 or later

### Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/Elliot727/Lexium.git
    ```

2. Open the project in Xcode:

    ```sh
    open Lexium.xcodeproj
    ```

3. Build and run the project on a simulator or a physical device.

## Usage

### Running the Game

1. Launch the app.
2. Start guessing the hidden word by typing letters on the on-screen keyboard.
3. Submit your guess by tapping the "Enter" button.
4. The game will provide feedback on each guess.
5. Reset the game by tapping the "Reset" button.

### Customizing the Word List

1. Update the `words.json` file with your custom list of words.
2. Ensure the JSON file is correctly formatted and placed in the project's main bundle.

### Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push to your fork.
4. Submit a pull request detailing your changes.
