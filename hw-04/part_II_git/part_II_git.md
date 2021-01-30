# hw-04-git

## Ejercicio

1. Crea un nuevo proyecto e inicializa git
~~~
mkdir test-project && cd test-project
git init
~~~

2. Añade una regla para ignorar los ficheros de tipo .sh
~~~
nano .gitignore
# *.html
[save and exit]
~~~

3. Crea dos ficheros vacíos: demo1.txt y demo2.txt. Añade estos ficheros al stage area
~~~
touch demo1.txt demo2.txt
git add demo1.txt demo2.txt
~~~

4. Añade contenido al fichero demo1.txt. A continuación, realiza un commit con el mensaje “Modified demo1.txt”
~~~
nano demo1.txt
# some text to see changes
[save and exit]

git commit -m “Modified demo1.txt”
~~~

5. Añade contenido al fichero demo2. A continuación, realiza un commit con el mensaje “Modified demo3.txt”
~~~
nano demo1.txt
# some text to see changes
[save and exit]

git commit -m “Modified demo3.txt”
~~~

6. Rectifica el commit anterior con el mensaje “Modified demo2.txt”
~~~
git commit --amend -m “Modified demo2.txt”
~~~

7. Crea una nueva rama “develop” y añade un fichero script.sh que imprima por pantalla “Git 101”
~~~
git checkout -b develop

touch script.sh

echo “Git 101” >> script.sh
~~~

8. Da permisos de ejecución al script
~~~
chmod +x script.sh
~~~

9. Realiza un merge (develop -> master) para integrar los cambios
~~~
git status
git commit -m "Added script.sh"

git checkout master
git merge develop
~~~

10. Sube todos los cambios a tu repositorio remoto
~~~
git set remote-url https://github.com/czhoulin/test-project
git push -u origin master
~~~

11. Ejecutamos el siguiente comando y lo incluimos en el repositorio para ver que todos los cambios solicitados se han realizado:
~~~
git log --oneline > verification.log

git add verification.log
git commit -m "Added verification.log"
git push
~~~

![image](./images/1.png)
![image](./images/2.png)
![image](./images/3.png)
![image](./images/4.png)
![image](./images/5.png)