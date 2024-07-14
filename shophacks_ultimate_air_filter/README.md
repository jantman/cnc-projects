# Shop Hacks Ultimate Air Filter CAD Files

These are CAD files for the [Shop Hacks Ultimate DIY Air Filtration System](https://www.shophacks.com/airfiltration.html) flat parts (back, front, sides).

To use these files you **MUST** purchase the plans from [the ShopHacks website](https://www.shophacks.com/airfiltration.html) as I did. They're only $9.95 (as of June 2024) and that is more than a reasonable price for the amount of detail in the plans (31 page PDF) and the design, research, and testing (including airborne particulate testing of this unit vs commercial units).

BUY THE PLANS if you have any desire to build this. They're worth it, and it's the right thing to do. I'm only providing these drawings as Tony doesn't offer digital files and I went through the time of buying the plans and then recreating the drawings in FreeCAD.

I also highly recommend buying the Hardware Kit ($24.95 at this time).

As such, I will not answer any questions. Sorry.

## What's Here

I have drawings for:

* Part 3, the front panel, intended to be made out of 3/4" melamine (or 3/4" MDF if you're like me)
* Part 4, the horizontal panel (2 ea), intended to be made out of 1/4" Baltic birch plywood
* Part 5, the vertical panel (2 ea), intended to be made out of 1/4" Baltic birch plywood
* Part 6, the back panel, intended to be made out of 1/4" Baltic birch plywood

Raw material should be cut as oversize as you need in order to make this work on your CNC.

Note that there are some details, like corner radii, that are not present in the original drawings. I've approximated those to what looked correct to me.

## Warnings and Notes

1. These drawings assume a 21-5/8" diameter for the fan. Check that that's correct for yours.
2. Fan clip holes aren't pre-drilled, as that would require flipping the setup for features with completely non-critical locations.

## Workflow

I'm making these on the CNC at the local makerspace that runs Mach3. Most folks use Vectric VCarve Pro 11 (makerspace license) for CAM, some use Fusion360. My original design is in OpenSCAD and I used FreeCAD for the CAM portion. You can see some notes on the CAM work in [freecad_notes.md](freecad_notes.md).

## Hardware

I cut these on the 48x52" [Joe's CNC Evolution](https://www.joescnc.com/the-machines/evolution-page) at [Decatur Makers](https://decaturmakers.org/), controlled by Mach 3. Tools used:

* 1/4" (0.25") carbide end mill, 0.125" pass depth, 0.1" 40% stepover, 12,000 RPM spindle, 100 in/min feed, 30 in/min plunge.
* 3/16" (0.1875") carbide end mill, 0.09375" pass depth, 0.085" 50% stepover, 12,000 RPM spindle, 100 in/min feed, 20 in/min plunge.

### Cut List

* [front_panel.gcode](front_panel.gcode) 1 part on a 29x48" piece of 3/4" particle board. Cycle time 19 minutes 25 seconds.
* [vertical_panel.gcode](vertical_panel.gcode) 2 parts on a 30x60" piece of 1/4" baltic birch plywood, as separate setups. Cycle time 2 minutes 32 seconds each.
* [horizontal_panel.gcode](horizontal_panel.gcode) 2 parts on a 30x60" piece of 1/4" baltic birch plywood, as separate setups. Cycle time 1 minute 49 seconds each.
* [rear_panel.gcode](rear_panel.gcode) 1 part on a 30x60" piece of 1/4" baltic birch plywood. Cycle time 1 minute 49 seconds each.
