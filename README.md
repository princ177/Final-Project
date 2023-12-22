# 5619 Final Project Matthew Princev (Princ177)

## Project
A point-and-aim bowling game that takes traditional bowling and evolves it into a new game you can only experience in VR by launching bowling balls of different sizes and weights at pins

## Functionality
### Grabbing:
You're able to pick the ball up and it will simulate real-life grabbing of a bowling ball without the weight. Pressing the grip button will grab the object and releasing it will make the ball fly in the way the controller is facing (-z direction) by applying linear velocity to it.

### Scaling: 
You're able to scale the ball's size and weight up and down by a fixed amount by clicking the ax button to scale it up and the by button to scale it down. If you click the right trigger you will be able to toggle between scaling the weight and scaling the size. The current weight and size of the ball will be displayed on the screen above the pins.

### Spatial Menu:
If you click the left trigger it will open up a spatial menu where you can choose to reset the pins, balls, or all. It also allows you to toggle bumpers.

### Bowling Ball Physics:
Depending on the weight of the ball, the linear velocity of the ball will scale accordingly and make it launch faster or slower. There is also friction applied to the ball so that it appears as though the ball is spinning according to the launch

## Scripts
### globals.gd:
Only used as a list that objects currently being held are added to, so it can be tracked

### grabber.gd:
This is where scaling up, scaling down, grabbing, releasing, and opening the spatial menu is taken care of.

### laser_pointer.gd:
This script calculates the collision between the ray cast laser coming from the controller and the spatial menu so that is interactable and you're able to click the buttons

### spatial_menu.gd:
This is where all the logic of the buttons is handled. It resets the position of the ball and the pins, as well as toggling the bumpers

### info_menu.gd:
This gets the current weight of the ball, the current size of the ball, the number of pins knocked down, and the number of strikes you've gotten throughout the session and displays them to the "monitor above the pins"

## Assets
### Floor texture:
https://sketchfab.com/3d-models/bowling-alley-floor-texture-0c9eef0c662e4d2a8d0ab7329c245891

### Bowling ball texture:
https://sketchfab.com/3d-models/bowling-ball-01-da3a78d46abc4abfb699461b3421ff48

### Bowling pin texture:
https://sketchfab.com/3d-models/bowling-pin-39fded55822b4b289e87c56210f9f5ee
