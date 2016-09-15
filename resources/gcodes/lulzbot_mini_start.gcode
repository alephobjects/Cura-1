;This Gcode has been generated specifically for the LulzBot Mini\nG26                          ; clear potential 'probe fail' condition\nG21                          ; metric values\nG90                          ; absolute positioning\nM82                          ; set extruder to absolute mode\nM107                         ; start with the fan off\nG92 E0                       ; set extruder position to 0\nM140 S{material_bed_temperature}; get bed heating up\nG28                          ; home all\nM109 R{material_wipe_temperature}; set to cleaning temp and wait\nG1 Z150 E-30 F75             ; suck up XXmm of filament\nM109 R140                    ; heat up rest of way\nG1 X45 Y174 F11520           ; move behind scraper\nG1 Z0  F1200                 ; CRITICAL: set Z to height of top of scraper\nG1 X45 Y174 Z-.5 F4000       ; plunge into wipe pad\nG1 X55 Y172 Z-.5 F4000       ; wiping\nG1 X45 Y174 Z0 F4000         ; wiping\nG1 X55 Y172 F4000            ; wiping\nG1 X45 Y174 F4000            ; wiping\nG1 X55 Y172 F4000            ; wiping\nG1 X45 Y174 F4000            ; wiping\nG1 X55 Y172 F4000            ; wiping\nG1 X60 Y174 F4000            ; wiping\nG1 X80 Y172 F4000            ; wiping\nG1 X60 Y174 F4000            ; wiping\nG1 X80 Y172 F4000            ; wiping\nG1 X60 Y174 F4000            ; wiping\nG1 X90 Y172 F4000            ; wiping\nG1 X80 Y174 F4000            ; wiping\nG1 X100 Y172 F4000           ; wiping\nG1 X80 Y174 F4000            ; wiping\nG1 X100 Y172 F4000           ; wiping\nG1 X80 Y174 F4000            ; wiping\nG1 X100 Y172 F4000           ; wiping\nG1 X110 Y174 F4000           ; wiping\nG1 X100 Y172 F4000           ; wiping\nG1 X110 Y174 F4000           ; wiping\nG1 X100 Y172 F4000           ; wiping\nG1 X110 Y174 F4000           ; wiping\nG1 X115 Y172 Z-0.5 F1000     ; wipe slower and bury noz in cleanish area\nG1 Z10                       ; raise z\nG28 X0 Y0                    ; home x and y\nM109 R{material_probe_temperature}; set to probing temp\nM204 S300                    ; Set probing acceleration\nG29                          ; Probe\nM204 S2000                   ; Restore standard acceleration\nG1 X5 Y15 Z10 F5000          ; get out the way\nG4 S1                        ; pause\nM400                         ; clear buffer\nM109 R{material_print_temperature}; set extruder temp and wait\nG4 S15                       ; wait for bed to temp up\nG1 Z2 E0 F75                 ; extrude filament back into nozzle\nM140 S{material_bed_temperature}; get bed temping up during first layer\n