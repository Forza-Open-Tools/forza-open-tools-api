CREATE TABLE IF NOT EXISTS car_classes (
  id int UNSIGNED NOT NULL,
  display_name varchar(10) NOT NULL,
  description varchar(210) NOT NULL,
  class_color int NOT NULL,
  secondary_color int NULL,
  max_performance_index decimal(20,6) NOT NULL,
  max_display_performance_index smallint(6) NOT NULL,
  badge_texture_path_prefix varchar(10) NOT NULL,
  career_min_eligible_pi varchar(10) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS makes (
  id int UNSIGNED NOT NULL,
  display_name varchar(30) NOT NULL,
  manufacturer_code varchar(10) NOT NULL,
  country_id int UNSIGNED NOT NULL,
  icon_path varchar(50) NOT NULL,
  icon_path_large varchar(50) NOT NULL,
  icon_path_base varchar(20) NOT NULL,
  profile varchar(30) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists cars;
CREATE TABLE IF NOT EXISTS cars (
  id int UNSIGNED NOT NULL,
  year smallint(6) NOT NULL,
  make_id int UNSIGNED NOT NULL,
  display_name varchar(100) NOT NULL,
  model_short varchar(100) NOT NULL,
  media_name varchar(40) NOT NULL,
  class_id int UNSIGNED NOT NULL,
  car_type_id int UNSIGNED NOT NULL,
  car_class_modifier tinyint(4) NOT NULL,
  family_model_id int UNSIGNED NOT NULL,
  family_body_id int UNSIGNED NOT NULL,
  engine_placement_id int UNSIGNED NOT NULL,
  material_type_id int UNSIGNED NOT NULL,
  powertrain_id int UNSIGNED NOT NULL,
  curb_weight decimal(20,6) NOT NULL,
  weight_distribution decimal(20,6) NOT NULL,
  num_gears tinyint(4) NOT NULL,
  tire_brand_id int UNSIGNED NOT NULL,
  base_rarity tinyint(4) NOT NULL,
  front_tire_width_mm smallint(6) NOT NULL,
  front_tire_aspect tinyint(4) NOT NULL,
  front_wheel_diameter_in tinyint(4) NOT NULL,
  rear_tire_width_mm smallint(6) NOT NULL,
  rear_tire_aspect tinyint(4) NOT NULL,
  rear_wheel_diameter_in tinyint(4) NOT NULL,
  zero_to_sixty_sec decimal(20,6) NOT NULL,
  zero_to_hundred_sec decimal(20,6) NOT NULL,
  quarter_mile_sec decimal(20,6) NOT NULL,
  quarter_mile_mph smallint(6) NOT NULL,
  top_speed_mph smallint(6) NOT NULL,
  speed_limiter_id int UNSIGNED NOT NULL,
  base_cost int NOT NULL,
  performance_index decimal(20,6) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (make_id) REFERENCES makes (id),
  FOREIGN KEY (class_id) REFERENCES car_classes (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS engines (
  id int UNSIGNED NOT NULL,
  engine_mass_kg decimal(20,6) NOT NULL,
  media_name varchar(40) NOT NULL,
  config_id int UNSIGNED NOT NULL,
  cylinder_id int UNSIGNED NOT NULL,
  compression decimal(20,6) NOT NULL,
  variable_timing_id int UNSIGNED NOT NULL,
  aspiration_id_stock int UNSIGNED NOT NULL,
  stockboost_bar decimal(20,6) NOT NULL,
  moment_inertia decimal(20,6) NOT NULL,
  gas_tank_size decimal(20,6) NOT NULL,
  fuel_burn_per_horsepower_hour decimal(20,6) NOT NULL,
  torque_steer_left_speed_scale decimal(20,6) NOT NULL,
  torque_steer_right_speed_scale decimal(20,6) NOT NULL,
  engine_graphing_max_torque decimal(20,6) NOT NULL,
  engine_graphing_max_power decimal(20,6) NOT NULL,
  engine_graphing_aspiration_id int UNSIGNED NOT NULL,
  engine_name varchar(30) NOT NULL,
  engine_rotation boolean NOT NULL,
  carbureted boolean NOT NULL,
  diesel boolean NOT NULL,
  rotary boolean NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (aspiration_id_stock) REFERENCES aspiration (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS aspiration (
  id int UNSIGNED NOT NULL,
  aspiration varchar(20) NOT NULL,
  display_name varchar(40) NOT NULL,
  short_display_name varchar(10) NOT NULL,
  key_part_enum varchar(10) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS brake_upgrades (
  id int UNSIGNED NOT NULL,
  ordinal smallint(6) NOT NULL,
  level tinyint(4) NOT NULL,
  is_stock boolean NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  price smallint(6) NOT NULL,
  front_brake_size tinyint(4) NOT NULL,
  front_brake_size_mm decimal(20,6) NOT NULL,
  front_brake_rotor_thickness_mm tinyint(4) NOT NULL,
  front_brake_drum_depth_mm tinyint(4) NOT NULL,
  front_brake_non_spinning_mass tinyint(4) NOT NULL,
  front_brake_type_id int UNSIGNED NOT NULL,
  front_caliper_pistons tinyint(4) NOT NULL,
  rear_brake_size tinyint(4) NOT NULL,
  rear_brake_size_mm decimal(20,6) NOT NULL,
  rear_brake_rotor_thickness_mm tinyint(4) NOT NULL,
  rear_brake_drum_depth_mm tinyint(4) NOT NULL,
  rear_brake_non_spinning_mass tinyint(4) NOT NULL,
  rear_brake_type_id int UNSIGNED NOT NULL,
  rear_caliper_pistons tinyint(4) NOT NULL,
  game_friction_scale_braking decimal(20,6) NOT NULL,
  brake_torque_slider decimal(20,6) NOT NULL,
  brake_bias_slider decimal(20,6) NOT NULL,
  bias_handbrake decimal(20,6) NOT NULL,
  release_point_abs decimal(20,6) NOT NULL,
  front_brake_torque_clamp decimal(20,6) NOT NULL,
  rear_brake_torque_clamp decimal(20,6) NOT NULL,
  damage_mod_def_id int UNSIGNED NOT NULL,
  brakes_profile_id int UNSIGNED NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS car_body_upgrades (
  id int UNSIGNED NOT NULL,
  ordinal smallint(6) NOT NULL,
  level tinyint(4) NOT NULL,
  car_body_id int UNSIGNED NOT NULL,
  is_stock boolean NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  price smallint(6) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS car_body_front_bumper_upgrades (
  id int UNSIGNED NOT NULL,
  car_body_id int UNSIGNED NOT NULL,
  level tinyint(4) NOT NULL,
  is_stock boolean NOT NULL,
  sequence tinyint(4) NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  parts_string_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  drag_scale decimal(20,6) NOT NULL,
  wind_instability_scale decimal(20,6) NOT NULL,
  price smallint(6) NOT NULL,
  aero_physics_id int UNSIGNED NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS drivetrain_upgrades (
  id int UNSIGNED NOT NULL,
  ordinal smallint(6) NOT NULL,
  drivetrain_id int UNSIGNED NOT NULL,
  powertrain_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  weight_dist_diff decimal(20,6) NOT NULL,
  level tinyint(4) NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  price smallint(6) NOT NULL,
  is_stock varchar(10) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS differential_upgrades (
  id int UNSIGNED NOT NULL,
  drivetrain_id int UNSIGNED NOT NULL,
  level tinyint(4) NOT NULL,
  is_stock boolean NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  price smallint(6) NOT NULL,
  front_limited_slip_torque_accel decimal(20,6) NOT NULL,
  front_limited_slip_torque_decel decimal(20,6) NOT NULL,
  front_limited_slip_rel_vel_clamp decimal(20,6) NOT NULL,
  front_limited_slip_accel_def_input_torque decimal(20,6) NOT NULL,
  rear_limited_slip_torque_accel decimal(20,6) NOT NULL,
  rear_limited_slip_torque_decel decimal(20,6) NOT NULL,
  rear_limited_slip_rel_vel_clamp decimal(20,6) NOT NULL,
  rear_limited_slip_accel_def_input_torque decimal(20,6) NOT NULL,
  center_limited_slip_torque_accel decimal(20,6) NOT NULL,
  center_limited_slip_torque_decel decimal(20,6) NOT NULL,
  center_limited_slip_rel_vel_clamp decimal(20,6) NOT NULL,
  center_limited_slip_accel_def_input_torque decimal(20,6) NOT NULL,
  rear_toque_split decimal(20,6) NOT NULL,
  tc_profile_id int UNSIGNED NOT NULL,
  differential_profile_id int UNSIGNED NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS transmission_upgrades (
  id int UNSIGNED NOT NULL,
  drivetrain_id int UNSIGNED NOT NULL,
  level tinyint(4) NOT NULL,
  is_stock boolean NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  price smallint(6) NOT NULL,
  moment_inertia decimal(5,4) NOT NULL,
  gear_shift_time decimal(3,2) NOT NULL,
  final_drive_ratio decimal(6,4) NOT NULL,
  num_gears tinyint(4) NOT NULL,
  cvt_shift_time decimal(20,6) NOT NULL,
  gear_ratio0 decimal(4,3) NOT NULL,
  gear_ratio1 decimal(4,3) NOT NULL,
  gear_ratio2 decimal(4,3) NOT NULL,
  gear_ratio3 decimal(4,3) NOT NULL,
  gear_ratio4 decimal(4,3) NOT NULL,
  gear_ratio5 decimal(4,3) NOT NULL,
  gear_ratio6 decimal(4,3) NOT NULL,
  gear_ratio7 decimal(4,3) NOT NULL,
  gear_ratio8 decimal(4,3) NOT NULL,
  gear_ratio9 decimal(4,3) NOT NULL,
  gear_ratio10 decimal(4,3) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS engine_upgrades (
  id int UNSIGNED NOT NULL,
  ordinal smallint(6) NOT NULL,
  level tinyint(4) NOT NULL,
  engine_id int UNSIGNED NOT NULL,
  is_stock boolean NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  price mediumint(9) NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  weight_dist_diff decimal(20,6) NOT NULL,
  drag_scale decimal(20,6) NOT NULL,
  wind_instability_scale varchar(10) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS rear_wing_upgrades (
  id int UNSIGNED NOT NULL,
  ordinal smallint(6) NOT NULL,
  level tinyint(4) NOT NULL,
  is_stock boolean NOT NULL,
  sequence tinyint(4) NOT NULL,
  manufacturer_id int UNSIGNED NOT NULL,
  parts_string_id int UNSIGNED NOT NULL,
  mass_diff decimal(20,6) NOT NULL,
  drag_scale decimal(20,6) NOT NULL,
  wind_instability_scale decimal(20,6) NOT NULL,
  price smallint(6) NOT NULL,
  aero_physics_id int UNSIGNED NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
