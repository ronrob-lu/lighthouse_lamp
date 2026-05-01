# Lighthouse Lamp Mod

A Luanti (Minetest) mod that adds a rotating lighthouse lamp with a dynamic particle beam effect that only activates at night.

## Features

- **Night-Only Activation**: The rotating beam effect only activates during nighttime (between sunset and sunrise), saving performance during the day.
- **Rotating Particle Beam**: Spawns glowing yellow particles that rotate continuously, creating a realistic lighthouse beam effect.
- **High Light Source**: Emits light level 14 for excellent illumination.
- **Simple Crafting**: Easy-to-craft recipe using common materials.

## Requirements

- Luanti/Minetest version 5.0.0 or higher
- Default game (for `default:mese_block`, `default:torch`, `default:glass`, `default:stone`)

## Installation

1. Download or clone this mod into your mods directory:
   ```
   <your_minetest_dir>/mods/lighthouse_lamp/
   ```

2. Enable the mod in your world's `world.mt` file or through the mod configuration menu:
   ```
   load_mod_lighthouse_lamp = true
   ```

3. Start or restart your world.

## Usage

### Crafting Recipe

The lighthouse lamp is crafted with the following recipe (yields 2 lamps):

```
┌─────────────────────────────────┐
│ Mese Block   │ Torch │ Mese Block │
│ Glass        │ Torch │ Glass      │
│ Stone        │ Stone │ Stone      │
└─────────────────────────────────┘
```

**Materials needed:**
- 2× Mese Block
- 2× Torch
- 2× Glass
- 3× Stone

### Placing the Lamp

1. Place the lamp block in your desired location.
2. The lamp will automatically start its timer upon placement.
3. During nighttime, the lamp will emit a rotating beam of light particles.
4. The beam rotates continuously, completing a full 360° sweep.

## Technical Details

- **Node Name**: `lighthouse_lamp:lamp`
- **Light Level**: 14
- **Rotation Speed**: 5 degrees per timer tick (adjustable in code)
- **Particle Properties**:
  - Amount: 50 particles per spawn
  - Lifetime: 3-5 seconds
  - Size: 15-20 units
  - Velocity: 80-120 units/second in the direction of rotation
  - Texture: Glowing yellow mese block texture

## Configuration

To modify the behavior of the lamp, edit the `init.lua` file:

- **Rotation Speed**: Change the value `angle = angle + 5` to increase or decrease rotation speed.
- **Particle Amount**: Adjust `amount = 50` to change particle density.
- **Beam Length**: Modify the velocity values (`minvel` and `maxvel`) to extend or shorten the beam.
- **Night Time Range**: Edit the `is_night` condition to customize when the beam activates.

## License

This mod is provided as-is. Feel free to modify and distribute as needed.

## Version History

- **v0.1.0** (Initial Release)
  - Added lighthouse lamp node
  - Implemented night-only particle beam effect
  - Added crafting recipe

## Author

ronrob-lu
