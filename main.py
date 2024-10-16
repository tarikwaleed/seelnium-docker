import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager

from bs4 import BeautifulSoup


def initialize_driver():
    options = webdriver.ChromeOptions()
    options.add_experimental_option("detach", True)
    options.add_argument("--headless=new")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    driver = webdriver.Chrome(options=options,service=Service())
    driver=webdriver.Chrome(options=options,
                            service=Service(ChromeDriverManager().install()),
    )
    return driver



def main():
    driver = initialize_driver()
    # driver.get('https://www.neuralnine.com/books')
    driver.get('https://elcinema.com/seasonals/')
    soup=BeautifulSoup(driver.page_source,features='lxml')
    # headings=soup.find_all(name='h2',attrs={'class':'elementor-heading-title'})
    # for h in headings:
    #     print(h.getText())
    movie_titles = soup.find_all('a', href=True)
    
    for title in movie_titles:
        print(title.get_text(strip=True))
    time.sleep(10)
    driver.quit()


                           



if __name__ == "__main__":
    main()
