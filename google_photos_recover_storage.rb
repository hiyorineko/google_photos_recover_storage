require 'selenium-webdriver'

@wait_time = 3 
@timeout = 4

Selenium::WebDriver.logger.output = File.join("./", "selenium.log")
Selenium::WebDriver.logger.level = :warn
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--disable-gpu')
options.add_argument('--window-size=1000,2200')
driver = Selenium::WebDriver.for :chrome, options: options
driver.manage.timeouts.implicit_wait = @timeout
wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)

# URLを設定
driver.get('https://photos.google.com/settings')

#element = driver.find_element(:id, 'identifierId')
element = driver.find_element(:id, 'Email') #headless
element.send_keys('INPUT_YOUR_EMAIL_ADDRESS')

#element = driver.find_element(:id, 'identifierNext') 
element = driver.find_element(:id, 'next') #headless
element.click()

# 画面遷移sleep
sleep 3

#element = driver.find_element(:name, 'password') 
element = driver.find_element(:name, 'Passwd') #headless
element.send_keys('INPUT_YOUR_PASSWORD')

#element = driver.find_element(:id, 'passwordNext') 
element = driver.find_element(:id, 'signIn') #headless
element.click()

# 画面遷移sleep
sleep 5

# 容量を圧縮ボタン
element = driver.find_element(:css, 'div.hjVFKe')
button = element.find_element(:css, 'button.VfPpkd-LgbsSe.VfPpkd-LgbsSe-OWXEXe-INsAgc.Rj2Mlf')
button.click()

sleep 2

# ポップアップ圧縮ボタン
# 写真や動画を元の解像度から高画質に圧縮することで、1.6 GB の保存容量を開放します
element = driver.find_element(:css, 'div.g3VIld.V639qd.OFqiSb.Up8vH.J9Nfi.iWO5td')
button = driver.find_element(:css, 'button.VfPpkd-ksKsZd-mWPk3d-OWXEXe-AHe6Kc-XpnDCe')
driver.action.key_down(button, :enter).perform

# ポップアップ圧縮ボタン
# 写真や動画の圧縮には 1 時間以上かかる場合があり、操作は元に戻せません
element = driver.find_element(:css, 'div.g3VIld.V639qd.OFqiSb.Up8vH.Whe8ub.J9Nfi.iWO5td')
button = element.find_element(:css, 'button.VfPpkd-LgbsSe.VfPpkd-LgbsSe-OWXEXe-k8QpJ.nCP5yc')
button.click()

# 画面遷移sleep
sleep 5

# ドライバーを閉じる
driver.quit