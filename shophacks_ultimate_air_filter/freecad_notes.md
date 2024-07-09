# FreeCAD Notes

1. Ensure the drawing in OpenSCAD meets the following:
    1. All dimensions are multiplied by 24.5; FreeCAD will unfortunately import the OpenSCAD drawing as if it were dimensioned in mm, even when you tell FreeCAD to use inches. Left alone, this will result in a part that is 25x too small.
    2. Ensure that all cuts/subtractions go fully through the part and do not have any co-incident surfaces. For example, if you cut a slot in a part and the top of the slot is exactly even with the top of the part (instead of above it), FreeCAD will not properly "see" the slot. Ensure that all subtractions extend past surfaces. An easy way to confirm this other than looking for artifacts in the preview render, is to use the `#` [debug modifier](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Modifier_Characters#Debug_Modifier).
    3. Don't use the `hull()` function, it messes up FreeCAD. Similarly that means you have to be very judicious about what libraries you use, especially for things like rounded corners, chamfers and fillets.
    4. Ensure that your model is set up with the _top_ of your _stock material_ at Z=0. The touch block homing process that we use on the DM CNC sets the origin (0,0,0) to the left, front, top corner of your stock. Everything hereafter will go a lot easier if your model also matches that origin.
2. Save the part from OpenSCAD. Since FreeCAD _can_ mutate the part, you should really back this up somewhere - or even better, commit it to a git repo.
3. 