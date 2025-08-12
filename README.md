# NBA Lineups

A SwiftUI iOS application that displays NBA game lineups and team information in real-time.

## Overview

NBA Lineups is a mobile application built with SwiftUI that provides users with up-to-date information about NBA games, including team lineups, player positions, game schedules, and team records. The app fetches data from a backend API and presents it in an intuitive, card-based interface.

## Features

- **Real-time Game Data**: Fetches current NBA game information including tip-off times and dates
- **Team Lineups**: Displays starting lineups for both home and away teams
- **Player Information**: Shows player names and positions for each team
- **Team Records**: Displays current season records for each team
- **Responsive UI**: Clean, modern interface with card-based design
- **Auto-refresh**: Automatically fetches updated data when the app appears

## Screenshots
<img width="400" alt="image" src="https://github.com/user-attachments/assets/d97237a4-6496-4c2d-ad3c-39caa177e366" />

## Architecture

### Models
- **Game**: Represents an NBA game with game info and team data
- **Team**: Contains team information including name, record, and players
- **Player**: Individual player data with name and position
- **GameInfo**: Game-specific details like tip-off time and date

### Views
- **MainView**: Primary view displaying all games in a scrollable list
- **GameCardView**: Individual game card showing matchup and lineup information
- **TeamLineupView**: Team-specific lineup display component

### Network Layer
- **NetworkManager**: Handles API communication with the NBA lineups backend
- **Auto-wakeup**: Includes server wake-up functionality for the backend service
- **JSON Decoding**: Processes API responses into Swift models

## Technical Details

- **Platform**: iOS (SwiftUI)
- **Minimum iOS Version**: iOS 14.0+
- **Architecture**: MVVM with ObservableObject pattern
- **Networking**: URLSession with async/await support
- **Data Format**: JSON API integration
- **Backend**: Integrates with `nba-lineups-backend.onrender.com`

## Project Structure

```
NBA Lineups/
├── NBA_LineupsApp.swift          # Main app entry point
├── Models/                       # Data models
│   ├── Game.swift               # Game structure
│   ├── Team.swift               # Team structure
│   ├── Player.swift             # Player structure
│   └── LineupDetails.swift      # Lineup details
├── Views/                        # SwiftUI views
│   ├── MainView.swift           # Primary view
│   └── FormationView.swift      # Formation display
├── NetworkManager.swift          # API communication
└── Assets.xcassets/             # App icons and images
```

## Setup Instructions

### Prerequisites
- Xcode 14.0 or later
- iOS 14.0+ deployment target
- macOS (for development)

### Installation
1. Clone the repository
2. Open `NBA Lineups.xcodeproj` in Xcode
3. Select your target device or simulator
4. Build and run the project (⌘+R)

### Dependencies
This project uses only native iOS frameworks:
- SwiftUI
- Foundation
- Combine (for reactive programming)

## API Integration

The app connects to a custom backend API that provides:
- Current NBA games
- Team lineup information
- Player details and positions
- Game scheduling data

## Development

### Adding New Features
- Create new models in the `Models/` directory
- Add corresponding views in the `Views/` directory
- Update `NetworkManager` for new API endpoints
- Follow SwiftUI best practices for state management

### Code Style
- Use SwiftUI declarative syntax
- Follow MVVM architecture patterns
- Implement proper error handling
- Use Swift naming conventions

## Testing

The project includes:
- **Unit Tests**: `NBA LineupsTests/` directory
- **UI Tests**: `NBA LineupsUITests/` directory

Run tests using ⌘+U in Xcode.

## License

This project is created by Leiss Amini. All rights reserved.

---

**Platform**: iOS  
**Language**: Swift  
**Framework**: SwiftUI 
