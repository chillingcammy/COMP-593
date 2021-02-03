from pyfiglet import Figlet

#Instantiate a Figlet Object
f = Figlet()

#Prompt the user to select a font
selectedFont = input("Select a font: \n 1. Banner \n 2. 3-d \n 3. Contrast \
\n 4. Broadway \n 5. Roman \n")

#Prompt the user to type a message
# ... ... ...
user_message= input("What would you like to say?\n")


if selectedFont== '1':
  f = Figlet(font='banner')


if selectedFont=='2':
  f= Figlet(font='3-d')


if selectedFont=='3':
  f= Figlet(font='contrast')


if selectedFont=='4':
  f= Figlet(font='broadway')

if selectedFont=='5':
  f= Figlet(font='roman')


print (f.renderText(user_message))