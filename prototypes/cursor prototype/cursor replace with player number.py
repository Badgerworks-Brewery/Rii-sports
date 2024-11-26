#Run "pip install pygame-ce" to run this script
#Created on 4/11/2024 by OPAAT
#This is a mouse cursor replacement test using pygame-ce.

#Try out clicking the mouse and pressing 1, 2, 3, and 4

import pygame
import sys

# Initialize Pygame
pygame.init()

# Player number
player_number = 1  # Set this to 1, 2, 3, or 4 for different players

# Define colors for each player
colors = {
    1: (135, 206, 235),  # Sky blue
    2: (255, 0, 0),      # Red
    3: (0, 128, 0),      # Green
    4: (128, 0, 128)     # Purple
}

# Get the player color
player_color = colors[player_number]

# Set up the display
screen_width, screen_height = 800, 600
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Dynamic Image Cursor with Glow")

# Load the full cursor image
full_cursor_image = pygame.image.load('mouse.png')  # The full image with cursor states and overlays

# Define cursor states based on the image sections
normal_cursor = full_cursor_image.subsurface((0, 0, 64, 64))  # Top-left part for normal state
clicked_cursor = full_cursor_image.subsurface((64, 0, 64, 64))  # Top-right part for clicked state

# Define overlays from the second row
normal_overlay = full_cursor_image.subsurface((0, 64, 64, 64))  # Bottom-left part for normal overlay
clicked_overlay = full_cursor_image.subsurface((64, 64, 64, 64))  # Bottom-right part for clicked overlay

# Create tinted overlays using the player color
def create_tinted_overlay(original):
    # Create a surface with the same size but includes an alpha channel for transparency
    """Creates a tinted overlay for a given surface.
    
    Args:
        original (pygame.Surface): The original surface to be tinted.
    
    Returns:
        pygame.Surface: A new surface with the original image tinted using the player color.
    
    Note:
        This function assumes that 'player_color' is a global or accessible variable
        containing an RGB tuple representing the tint color.
    """
    tinted = pygame.Surface((64, 64), pygame.SRCALPHA)
    tinted.fill(player_color + (40,))  # Player color with specified transparency
    tinted.blit(original, (0, 0), special_flags=pygame.BLEND_RGBA_MULT)
    return tinted

normal_overlay = create_tinted_overlay(normal_overlay)
clicked_overlay = create_tinted_overlay(clicked_overlay)

cursor_rect = normal_cursor.get_rect()

# Define the player-specific overlay based on player number
player_overlay = full_cursor_image.subsurface(((player_number - 1) * 64, 128, 64, 64))  # Adjust according to your image layout

# Hide the default cursor
pygame.mouse.set_visible(False)

# Main game loop
running = True
while running:
    # Event handling loop
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        elif event.type == pygame.KEYDOWN:
            # Dictionary to map keys to specific cursor positions in the image
            key_to_subsurface = {
                pygame.K_1: (0, 128, 64, 64),  # 3rd row left
                pygame.K_2: (0, 192, 64, 64),  # 4th row left
                pygame.K_3: (64, 128, 64, 64),  # 3rd row right
                pygame.K_4: (64, 192, 64, 64)   # 4th row right
            }
            if event.key in key_to_subsurface:
                # Update the player overlay to reflect the selected key
                coords = key_to_subsurface[event.key]
                player_overlay = full_cursor_image.subsurface(coords)
                # Update the tinted overlay based on the player number
                # Assuming the color index should match the key number for simplicity
                player_number = list(key_to_subsurface.keys()).index(event.key) + 1
                player_color = colors[player_number]
                normal_overlay = create_tinted_overlay(full_cursor_image.subsurface((0, 64, 64, 64)))
                clicked_overlay = create_tinted_overlay(full_cursor_image.subsurface((64, 64, 64, 64)))

    # Get the current mouse position
    cursor_rect.topleft = pygame.mouse.get_pos()

    # Check mouse button press
    pressed = pygame.mouse.get_pressed()
    if pressed[0] or pressed[2]:  # Left or right button pressed
        cursor_image = clicked_cursor
        overlay_image = clicked_overlay
    else:
        cursor_image = normal_cursor
        overlay_image = normal_overlay

    # Clear the screen
    screen.fill((0, 0, 0))

    # Draw the cursor image and overlay
    screen.blit(cursor_image, cursor_rect)
    screen.blit(overlay_image, cursor_rect)  # Draw the tinted overlay on top of the cursor

    # Draw the player overlay last to be on top of everything
    screen.blit(player_overlay, cursor_rect)

    # Update the display
    pygame.display.flip()

# Quit Pygame
pygame.quit()
sys.exit()
