Először ebben a mappában:
   build maven-el: "mvn package",
    
   docker image létrehozása: "docker build -t chorchain .",

Majd visszább egy mappával: "cd ..",

És itt kell elindítani a dockert: "docker compose up -d", 

Majd a localhost:8080-on érhető el a chorchain
