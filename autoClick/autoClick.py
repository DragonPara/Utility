import threading
import sys 
import pyautogui as p
from pynput.keyboard import Key,Listener
global i,end
i=False
end=False
# 对按下按键的监听
def on_press(key):
    global i,end
    if type(key)==Key:
        if key == Key.space :
            print("Pressed key.space")
            i=(i==False)
        elif key ==Key.esc: 
            end=True
            return False
    pass
# 对抬起按键的监听

def on_release(key):
    pass

def check():
# 开启按键监听
    with Listener(on_press=on_press,on_release=on_release) as listener:
        listener.join()

def crazyClick():
    global i,end
    # s=p.size()
    p.moveTo(1136,632) 
    while(1):
        if (i):     
            # p.moveTo(1136,632) 
            p.click()
            print(p.position())
        if (end):
            sys.exit()
            
t2 = threading.Thread(target=crazyClick,args=(""))
t1 = threading.Thread(target=check,args=(""))
t1.start()
t2.start()