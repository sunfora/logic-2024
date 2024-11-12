from selenium.webdriver.common.print_page_options import PrintOptions

import os
from selenium import webdriver
import base64

driver = webdriver.Firefox()
driver.get("localhost:8080")

preferences = PrintOptions()
preferences.scale = 1.5
preferences.page_width = 29.7
preferences.page_height = 35 
preferences.shrink_to_fit = True

page = base64.b64decode(driver.print_page(preferences))
with open("result.pdf", "wb") as file:
    file.write(page)
