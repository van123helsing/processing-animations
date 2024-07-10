"""Kaleidoscope More Squares Moving Centers by KenesuEXE"""  
  
# Import the necessary library  
  
# Global variables for properties  
rad, rad_chg = 10, 0.5  
hue_a, hue_b, hue_c, hue_d, hue_e = random(255), random(255), random(255), random(255), random(255)  
hue_a_chg, hue_b_chg, hue_c_chg, hue_d_chg, hue_e_chg = random(0.1, 0.2), random(0.1, 1), random(0.1, 1), random(0.1, 1), random(0.1, 1)  
sat_a, sat_b, sat_c, sat_d, sat_e = random(100, 200), random(100, 200), random(100, 200), random(100, 200), random(100, 200)  
sat_a_chg, sat_b_chg, sat_c_chg, sat_d_chg, sat_e_chg = random(0.1, 1), random(0.1, 1), random(0.1, 1), random(0.1, 1), random(0.1, 1)  
  
def setup():  
    size(750, 750)  
    background(0)  
    colorMode(HSB)  
    noStroke()  
    global angle  
    angle = 0  

  
def draw():  
    global rad, rad_chg, hue_a, hue_b, hue_c, hue_d, hue_e, hue_a_chg, hue_b_chg, hue_c_chg, hue_d_chg, hue_e_chg  
    global sat_a, sat_b, sat_c, sat_d, sat_e, sat_a_chg, sat_b_chg, sat_c_chg, sat_d_chg, sat_e_chg, angle
      
    background(0)  
    noFill()  
    strokeWeight(3)  
      
    # Calculate moving center positions  
    center_x = width / 2 + cos(angle) * 100  
    center_y = height / 2 + sin(angle) * 100  
      
    # Square Set A  
    stroke(hue_a, sat_a, 255, 200)  
    square(center_x - rad / 2, center_y - rad / 2, rad)  
    square(center_x + width / 2 - rad, center_y - rad / 2, rad)  
    square(center_x - width / 2, center_y - rad / 2, rad)  
    square(center_x - rad / 2, center_y - height / 2, rad)  
    square(center_x - rad / 2, center_y + height / 2 - rad, rad)  
      
    # Calculate moving center positions for the second set  
    center_x_b = width / 4 + cos(angle + PI) * 100  
    center_y_b = height / 4 + sin(angle + PI) * 100  
      
    # Square Set B  
    stroke(hue_b, sat_b, 255, 200)  
    square(center_x_b + width / 4 - rad / 2, center_y_b + height / 4 - rad / 2, rad)  
    square(center_x_b + width / 4 - rad / 2, center_y_b - height / 4 - rad / 2, rad)  
    square(center_x_b - width / 4 - rad / 2, center_y_b + height / 4 - rad / 2, rad)  
    square(center_x_b - width / 4 - rad / 2, center_y_b - height / 4 - rad / 2, rad)  
      
    # Calculate moving center positions for the third set  
    center_x_c = width / 2 + cos(angle + HALF_PI) * 100  
    center_y_c = height / 2 + sin(angle + HALF_PI) * 100  
      
    # Square Set C  
    stroke(hue_c, sat_c, 255, 200)  
    square(center_x_c - width / 2, center_y_c - height / 2, rad)  
    square(center_x_c - width / 2, center_y_c + height / 2 - rad, rad)  
    square(center_x_c + width / 2 - rad, center_y_c - height / 2, rad)  
    square(center_x_c + width / 2 - rad, center_y_c + height / 2 - rad, rad)  
      
    # Calculate moving center positions for the fourth set  
    center_x_d = width / 4 + cos(angle + QUARTER_PI) * 100  
    center_y_d = height / 4 + sin(angle + QUARTER_PI) * 100  
      
    # Square Set D  
    stroke(hue_d, sat_d, 255, 200)  
    square(center_x_d + width / 8 - rad / 2, center_y_d + height / 8 - rad / 2, rad)  
    square(center_x_d + width / 8 - rad / 2, center_y_d - height / 8 - rad / 2, rad)  
    square(center_x_d - width / 8 - rad / 2, center_y_d + height / 8 - rad / 2, rad)  
    square(center_x_d - width / 8 - rad / 2, center_y_d - height / 8 - rad / 2, rad)  
      
    # Calculate moving center positions for the fifth set  
    center_x_e = width / 2 + cos(angle + TWO_PI) * 100  
    center_y_e = height / 2 + sin(angle + TWO_PI) * 100  
      
    # Square Set E  
    stroke(hue_e, sat_e, 255, 200)  
    square(center_x_e - width / 2, center_y_e - height / 2, rad)  
    square(center_x_e - width / 2, center_y_e + height / 2 - rad, rad)  
    square(center_x_e + width / 2 - rad, center_y_e - height / 2, rad)  
    square(center_x_e + width / 2 - rad, center_y_e + height / 2 - rad, rad)  
      
    # Radius fluctuates up and down  
    rad += rad_chg  
    if rad < 5 or rad > width / 2:  
        rad_chg = -rad_chg  
      
    # Hue loops from 1 to 255, then back to 1  
    hue_a += hue_a_chg  
    hue_a %= 255  
    hue_b += hue_b_chg  
    hue_b %= 255  
    hue_c += hue_c_chg  
    hue_c %= 255  
    hue_d += hue_d_chg  
    hue_d %= 255  
    hue_e += hue_e_chg  
    hue_e %= 255  
      
    # Saturation fluctuates up and down  
    sat_a += sat_a_chg  
    if sat_a < 100 or sat_a > 200:  
        sat_a_chg = -sat_a_chg  
    sat_b += sat_b_chg  
    if sat_b < 100 or sat_b > 200:  
        sat_b_chg = -sat_b_chg  
    sat_c += sat_c_chg  
    if sat_c < 100 or sat_c > 200:  
        sat_c_chg = -sat_c_chg  
    sat_d += sat_d_chg  
    if sat_d < 100 or sat_d > 200:  
        sat_d_chg = -sat_d_chg  
    sat_e += sat_e_chg  
    if sat_e < 100 or sat_e > 200:  
        sat_e_chg = -sat_e_chg  
      
    # Update angle for moving center  
    angle += 0.02  

    # Save sketch into image
    # number_str = str(frame)  
    # while len(number_str) < 4:  
    #     number_str = '0' + number_str  
    # im = "/images/image" + number_str + ".jpg"  
    # save(im)  
