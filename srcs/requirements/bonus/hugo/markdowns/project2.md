---
title: "Cub3D"
date: 2023-09-09T16:21:02Z
draft: false
cover:
  image: "https://camo.githubusercontent.com/b84f24faf103caf150629c4376769de01ba243976fdb59bf93264b03595253ee/68747470733a2f2f692e696d6775722e636f6d2f6d5254615567762e706e67"
  alt: "Cub3D preview"
ShowToc: true
ShowPostNavLinks: true

editPost:
    URL: "https://github.com/SpicyI/Cub-3D"
    Text: "See project github page" # edit text
    # appendFilePath: true # to append file path to Edit link
---

## Cub3D
**Cub3D** is an exciting and innovative project that combines gaming and programming. This project takes inspiration from the classic 3D maze games and challenges you to build your own maze engine using C and raycasting techniques.

## Game Preview
<div id="header" align="center">
  <img src="https://github.com/SpicyI/Cub-3D/blob/main/cub3D.gif" width="500"/>
</div>

## Objective

The primary objective of the **Cub3D** project is to create a simple 3D maze game where the player navigates through a labyrinth using raycasting to render the environment.

## Key Features

- **Raycasting Engine**: Implement a raycasting engine to render the 3D maze environment in a 2D window.
- **Maze Generation**: Generate random mazes or create custom-designed levels for the player to explore.
- **Player Controls**: Implement intuitive player controls for movement and interaction within the maze.
- **Textures**: Add textures and colors to the walls and floor to enhance the visual experience.
- **Sprites**: Incorporate sprite rendering for interactive objects or enemies within the maze.
- **Minimap**: Create a minimap to provide an overview of the entire maze layout.
- **HUD**: Design a heads-up display (HUD) to display important game information.
- **Interactive Elements**: Add doors, keys, and other interactive elements to increase gameplay complexity.
- **Winning Condition**: Define a winning condition for the player to complete the maze or achieve a specific goal.

## Technologies Used

- **Programming Language**: C
- **Graphics Library**: [MiniLibX](https://harm-smits.github.io/42docs/libs/minilibx/introduction.html)
- **Development Environment**: Unix/Linux

- ## Getting Started

To get started with **Cub3D**, follow these steps:

clone the repository:
```git clone https://github.com/SpicyI/Cub-3D.git```

Build the game:
````make````

run the game:
```./cub3d /path/to/map.cub ```