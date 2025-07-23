# Anki Assistant - Windows Version

This is a Windows-compatible version of the [original Anki Assistant](https://github.com/superMDguy/anki-assistant) that enables voice-based flashcard review using AI.

## Features

- Voice-based flashcard interaction
- AI-powered answer evaluation using OpenAI GPT
- Text-to-speech feedback with Windows TTS
- Low-latency speech recognition with Whisper
- Visual feedback with color-coded scoring

## Requirements

- Windows 10/11
- Python 3.8 or later
- Microphone
- Speakers/headphones
- OpenAI API key
- Anki installed with flashcards

## Installation

### Option 1: Automated Setup (Recommended)

1. **Download or clone this repository**
2. **Run the setup script:**
   ```cmd
   setup_windows.bat
   ```

### Option 2: Manual Setup

1. **Create a virtual environment:**
   ```cmd
   python -m venv anki_assistant_env
   anki_assistant_env\Scripts\activate.bat
   ```

2. **Install dependencies:**
   ```cmd
   pip install -r requirements_windows.txt
   ```

3. **If PyAudio installation fails:**
   ```cmd
   pip install pipwin
   pipwin install pyaudio
   ```

## Configuration

1. **Edit `config.py`:**
   - Add your OpenAI API key
   - Update the Anki database path

   ```python
   OPENAI_KEY = "sk-your-openai-api-key-here"
   ANKI_PATH = r"C:\Users\YourUsername\AppData\Roaming\Anki2\User 1\collection.anki2"
   ```

2. **Find your Anki database path:**
   - Open Anki
   - Go to Tools → Preferences → Advanced
   - Look for the data folder path
   - The collection file is usually at: `[AnkiDataFolder]\User 1\collection.anki2`

## Usage

1. **Make sure Anki is closed** (the script needs exclusive access to the database)

2. **Activate the virtual environment:**
   ```cmd
   anki_assistant_env\Scripts\activate.bat
   ```

3. **Run the application:**
   ```cmd
   python anki_ai_windows.py
   ```

4. **Interact with flashcards:**
   - Listen to the question being read
   - Speak your answer
   - Get immediate AI feedback
   - Screen flashes green (correct) or red (needs improvement)

## Windows-Specific Changes

This version includes several adaptations for Windows:

- **Audio Playback**: Uses `pygame` and `pyttsx3` instead of macOS `afplay` and `say`
- **File Paths**: Handles Windows path format
- **TTS Engine**: Integrated Windows Speech Platform
- **Dependencies**: Added Windows-compatible audio libraries

## Troubleshooting

### PyAudio Installation Issues
If you get errors installing PyAudio:
1. Install Visual C++ Build Tools
2. Use the pipwin approach: `pip install pipwin && pipwin install pyaudio`
3. Or download a pre-compiled wheel from [https://www.lfd.uci.edu/~gohlke/pythonlibs/](https://www.lfd.uci.edu/~gohlke/pythonlibs/)

### Microphone Not Working
- Check Windows privacy settings for microphone access
- Ensure your microphone is set as the default recording device
- Test with `python anki_ai_windows.py noaudio` for text-only mode

### Anki Database Access
- Make sure Anki is completely closed
- Verify the path in `config.py` points to your actual collection file
- Try running Anki once to ensure the database is properly created

## Commands

While the app is running, you can say:
- **"Skip card"** - Skip the current flashcard
- **"I don't know"** - Mark as incorrect and see the answer

## Tech Stack

- **Speech-to-Text**: Faster-Whisper (tiny.en model)
- **Text-to-Speech**: Windows TTS (pyttsx3) + OpenAI TTS (cached)
- **Language Model**: OpenAI GPT-3.5-turbo
- **Audio**: PyAudio + pygame
- **GUI**: PyWebView
- **Voice Activity Detection**: Silero VAD

## License

Same as original project - check LICENSE file.