// PRUSA iteration3
// Configuration file
// GNU GPL v3
// Josef Pr?sa <josefprusa@me.com>
// Václav 'ax' H?la <axtheb@gmail.com>
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// functions
include <inc/functions.scad>;
include <inc/nuts_screws.scad>;
include <inc/conf_bushing.scad>;
include <inc/conf_bearing.scad>;
include <inc/belts_pulleys.scad>;
include <printer_conf.scad>;

stepper_motor_height=42;
stepper_motor_width=42;
stepper_motor_padded=stepper_motor_width+2;

use_fillets=true;
// Custom settings here, tailor to your supplies and print settings

// *********************************************
// General settings
// *********************************************
rod_allowance=0.2;
max_bushing_outside_diameter = 22;
max_bushing_length = 30;
bushing_retainer_add=(9*layer_height);
bushing_clamp_outer_radius_add1=((4*single_wall_width) < 2) ? floor(2/single_wall_width)*single_wall_width : (4*single_wall_width);
bushing_clamp_outer_radius_add=((4*single_wall_width) > 2.7) ? floor(2.6/single_wall_width)*single_wall_width : bushing_clamp_outer_radius_add1;

// Select your belt type ***********************
//T2.5 conf_belt_T2_5
//T5 (strongly discouraged) conf_belt_T5
//HTD3 conf_belt_HTD3
//MXL conf_belt_MXL
//GT2 conf_belt_GT2
//GT2-3mm conf_belt_GT2_3mm
belt = conf_belt_GT2_3mm;
belt_width = 7;

// Select your pulley type *********************
// GT2-3mm 17 groove pulley conf_pulley_17_GT2_3mm
// GT2 36 groove pulley conf_pulley_36_GT2
// GT2 40 groove pulley conf_pulley_40_GT2
pulley = conf_pulley_17_GT2_3mm;

// Select your fan type *********************
// hole seperation = 0
// outer dimensions = 1
// thickness = 2
//30mm
conf_fan_30mm = [ 24, 40, 10];
//40mm
conf_fan_40mm = [ 32, 40, 10];


// *********************************************
// Z Axis configuration
// *********************************************
lead_screw = screw_M6;
lead_screw_nut = nut_M6;
lead_screw_nut_support_outer_dia = (nut_outer_dia(v_nut_hole(lead_screw_nut))+6);

lead_screw_to_smooth_rod_separation = 30;

y_offset=3;

z_bushing_mounting_screw = screw_M4_socket_head;
z_bushing_mounting_nut = nut_M4;

bushing_z = conf_b_lm8uu;
z_axis_smooth_rod_diameter = (bushing_z[0]*2);

bushing_rod_to_wall = 16;

z_bushing_foot_height= (max_bushing_length+bushing_retainer_add);
z_bushing_mount_thickness = 5;

// *********************************************
// X Axis configuration
// *********************************************
x_axis_smooth_rod_separation = 50;
bushing_x = conf_b_lm8uu;
x_axis_smooth_rod_diameter = (bushing_x[0]*2);;

// X-Carriage Configuration
x_carriage_base_length = 80;
x_carriage_base_width = (bushing_x[1] + bushing_clamp_outer_radius_add)*2+x_axis_smooth_rod_separation;
x_carriage_base_height = 5;
x_carriage_base_size= [x_carriage_base_width, x_carriage_base_length, x_carriage_base_height];
x_carriage_base_support_thickness = 5;

x_carriage_belt_clamp_thickness = 5;
x_carriage_belt_clamp_screw=screw_M3_socket_head;
x_carriage_belt_clamp_nut=nut_M3;
x_carriage_belt_support_width=10;
x_carriage_belt_clamp_width=12;
// set this to the same as x_end_idler_washer
x_carriage_belt_clamp_offset=washer_thickness(washer_M8);
x_carriage_belt_clamp_nut_support_outer_dia = (nut_outer_dia(v_nut_hole(x_carriage_belt_clamp_nut))+1)/2;
x_carriage_belt_clamp_screw_offset= screw_dia(v_screw_hole(x_carriage_belt_clamp_screw))/2+0.3;

x_carriage_tensioner_screw= screw_M4_socket_head;
x_carriage_tensioner_nut= nut_M4;
x_carriage_tensioner_nut_support_outer_dia = (nut_outer_dia(v_nut_hole(x_carriage_tensioner_nut))+5);
x_carriage_tensioner_nut_support_thickness = ((nut_thickness(v_nut_hole(x_carriage_tensioner_nut))+3)> x_carriage_base_size[2]) ? (nut_thickness(v_nut_hole(x_carriage_tensioner_nut))+3) : x_carriage_base_size[2];
x_carriage_tensioner_offset=3;

x_carriage_fan= conf_fan_40mm;
x_carriage_fan_screw= screw_M3_socket_head;
x_carriage_fan_nut= nut_M3;
x_carriage_fan_nut_wall=2;
x_carriage_fan_nut_height = (nut_outer_dia(v_nut_hole(x_carriage_fan_nut))/2+1);
x_carriage_fan_nut_wall_height= x_carriage_fan_nut_height+ (nut_outer_dia(v_nut_hole(x_carriage_fan_nut))/2+1);
x_carriage_fan_nut_wall_thickness = x_carriage_fan_nut_wall*2+nut_thickness(v_nut_hole(x_carriage_fan_nut));

x_extruder_mount_nut = nut_M4;
x_extruder_mount_screw = screw_M4_socket_head;
x_extruder_mount_screw_spacing = 50;
x_extruder_mount_hole_diameter = 39;

// X-end Configuration
x_end_base_size = [x_carriage_base_width, 40, 10]; //[68.2, 40, 9];
x_end_base_clamp_gap=0.5;
x_end_motor_support_height=3;
x_end_motor_wall_thickness=6;
x_end_bushing_mount_hole_spacing = (max_bushing_outside_diameter + bushing_clamp_outer_radius_add*2 + 2 + screw_head_top_dia(v_screw_hole(screw_M4_socket_head))/2);
x_end_bushing_mount_wall_width = (x_end_bushing_mount_hole_spacing +16);

x_end_idler_screw = screw_M8_socket_head;
x_end_idler_nut = nut_M8;
x_end_idler_washer = washer_M8;
x_end_idler_height = 27; // 25
x_end_idler_bearing = bearing_608;
x_end_idler_wall_height=z_bushing_foot_height+x_end_base_size[2]+1; //(idler_height+ bearing_out_dia(idler_bearing)/2);
x_end_idler_wall_thickness=6;

smooth_rod_clamp_screw_hole_spacing_x = 32;
smooth_rod_clamp_screw_hole_spacing_y = 27;
smooth_rod_clamp_screw = screw_M4_socket_head;
smooth_rod_clamp_nut = nut_M4;