G26                          ; clear potential 'probe fail' condition
G21                          ; metric values
G90                          ; absolute positioning
M82                          ; set extruder to absolute mode
M107                         ; start with the fan off
G92 E0                       ; set extruder position to 0
M140 S{print_bed_temperature}; get bed heating up
M109 R{material_soften_temperature} ; soften filament before homing Z
G28                          ; home all
G0 X0 Y187 Z156 F200         ; move away from endstops
M907 X675                    ; reduce extruder torque for safety
M109 R{material_wipe_temperature}                    ; set to cleaning temp and wait
G1 E-30 F45                  ; suck up XXmm of filament
G1 X45 Y173 F11520           ; move behind scraper
G1 Z0  F1200                 ; CRITICAL: set Z to height of top of scraper
G1 X42 Y173 Z-.5 F4000       ; wiping
G1 X52 Y171 Z-.5 F4000       ; wiping
G1 X42 Y173 Z0 F4000         ; wiping
G1 X52 Y171 F4000            ; wiping
G1 X42 Y173 F4000            ; wiping
G1 X52 Y171 F4000            ; wiping
G1 X42 Y173 F4000            ; wiping
G1 X52 Y171 F4000            ; wiping
G1 X57 Y173 F4000            ; wiping
G1 X77 Y171 F4000            ; wiping
G1 X57 Y173 F4000            ; wiping
G1 X77 Y171 F4000            ; wiping
G1 X57 Y173 F4000            ; wiping
G1 X87 Y171 F4000            ; wiping
G1 X77 Y173 F4000            ; wiping
G1 X97 Y171 F4000            ; wiping
G1 X77 Y173 F4000            ; wiping
G1 X97 Y171 F4000            ; wiping
G1 X77 Y173 F4000            ; wiping
G1 X97 Y171 F4000            ; wiping
G1 X107 Y173 F4000           ; wiping
G1 X97 Y171 F4000            ; wiping
G1 X107 Y173 F4000           ; wiping
G1 X97 Y171 F4000            ; wiping
G1 X107 Y173 F4000           ; wiping
G1 X112 Y171 Z-0.5 F1000     ; wiping
G1 Z10                       ; raise z
G28 X0 Y0                    ; home x and y
G0 X0 Y187 F200 ; move away from endstops
M109 R{material_probe_temperature}                    ; set to probing temp
M204 S300                    ; Set probing acceleration
G29                          ; Probe
M204 S2000                   ; Restore standard acceleration
G28 X0 Y0                    ; re-home to account for build variance of earlier mini builds
G0 X0 Y187 F200              ; move away from endstops
G0 Y152 F4000                ; move in front of wiper pad
G4 S1                        ; pause
M400                         ; clear buffer
M109 R{print_temperature}    ; set extruder temp and wait
G4 S15                       ; wait for bed to temp up
G1 Z2 E0 F45                 ; extrude filament back into nozzle
M140 S{material_bed_temperature_layer_0}; get bed temping up during first layer