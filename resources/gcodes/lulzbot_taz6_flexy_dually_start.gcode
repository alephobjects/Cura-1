;This profile is designed specifically for LulzBot TAZ6 3D Printer
;{material_print_temperature}
G26                          ; clear potential 'probe fail' condition
G21                          ; set units to Millimetres
M107                         ; disable fans
G90                          ; absolute positioning
T0                           ; select this extruder first
M82                          ; set extruder to absolute mode
G92 E0                       ; set extruder position to 0
M140 S{material_bed_temperature}; get bed heating up
M109 R{material_soften_temperature_0} T0                 ; soften filament
M109 R{material_soften_temperature_1} T1                 ; soften filament
G28 X Y                      ; home X and Y
G1 X-19 Y258                 ; move over the Z_MIN switch
M109 R{material_wipe_temperature_0} T0                 ; wait for T0 to reach temp
M109 R{material_wipe_temperature_1} T1                 ; wait for T1 to reach temp
G28 Z                        ; home Z
G1 E-30 F100                 ; suck up XXmm of filament
T1                           ; switch extruders
G92 E0                       ; set E to 0
G1 E-15 F100                 ; suck up filament
T0                           ; switch extruders
G92 E-60                     ; adjust E value
G1 X-17 Y100 F3000           ; move above wiper pad
G1 Z1                        ; push nozzle into wiper
G1 X-19 Y95 F1000            ; slow wipe
G1 X-17 Y90 F1000            ; slow wipe
G1 X-19 Y85 F1000            ; slow wipe
G1 X-17 Y90 F1000            ; slow wipe
G1 X-19 Y80 F1000            ; slow wipe
G1 X-17 Y95 F1000            ; slow wipe
G1 X-19 Y75 F2000            ; fast wipe
G1 X-17 Y85 F2000            ; fast wipe
G1 X-19 Y80 F2000            ; fast wipe
G1 X-17 Y70 F2000            ; fast wipe
G1 X-19 Y75 F2000            ; fast wipe
G1 X-17 Y95 F1000            ; slow wipe
G1 X-19 Y90 F1000            ; slow wipe
G1 X-17 Y85 F1000            ; slow wipe
G1 X-19 Y90 F1000            ; slow wipe
G1 X-17 Y80 F1000            ; slow wipe
G1 X-19 Y95 F1000            ; slow wipe
G1 X-17 Y75 F2000            ; fast wipe
G1 X-19 Y85 F2000            ; fast wipe
G1 X-17 Y80 F2000            ; fast wipe
G1 X-19 Y90 F2000            ; fast wipe
G1 X-17 Y85 F2000            ; fast wipe
G1 Z10                       ; raise extruder
M109 R{material_probe_temperature_0}                   ; heat to probe temp
G1 X-9 Y-9                   ; move above first probe point
M204 S100                    ; set accel for probing
G29                          ; probe sequence (for auto-leveling)
M204 S500                    ; set accel back to normal
G1 X0 Y0 Z15 F5000           ; get out the way
M400                         ; clear buffer
M140 S{material_bed_temperature}; get bed heating up
M104 S{material_print_temperature_0} T0 ; set extruder temp
M104 S{material_print_temperature_1} T1; set extruder temp
M109 R{material_print_temperature_0} T0 ; set extruder temp and wait
M109 R{material_print_temperature_1} T1; set extruder temp and wait
T1                           ; switch to second extruder
G1 E0 F100                   ; prime nozzle from previous print
G1 F100 E-{retraction_amount} ;retract second nozzle before print
G92 E-30                     ; adjust to 1st nozzle e value
T0                           ; switch back to back
M190 R{material_bed_temperature_layer_0}; get bed temping up during first layer
G1 Z2 E0 F75                 ; extrude filament back into nozzle
M117 TAZ Printing...         ; LCD status message