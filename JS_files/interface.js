//const prompt = require("prompt-sync")();
import chalk from "chalk";
import PromptSync from "prompt-sync";
import { TwemtyMostActivMembers, TwemtyMostBorrowedBooks, TwemtyMostWishedBooks, availableBookLists, booksAndAuthor, borrowerList, insertBookToWishList, nonBorrowable, numberOfAvailableBooks, numberOfmembers, searchingBookByASpecificGenre, searchingBookByGenre, searchingBookByLanguage, searchingBookByTitle } from './requests.js'
const prompt = PromptSync()
function biblio() {
    let ask = menu()
    if (ask == "1") {
        printMembersArt();
        membresOption();
    } else if (ask == "2") {
        displayStaffAsciiArt();
        personnel();
    } else if (ask == 'shutdown') {

    } else {
        biblio();
    }
}
function displayBookAsciiArt() {
    const bookAsciiArt = `
                                        ::::::::::::::::::--.                              
                   ...:::..        :-:.                    .--.                           
            :::::::..    ..:::::.--                           .--:                        
       .---:                    :=:                              .--:                     
     =-:                          .--                                :-:                  
    :==                              --                                 :-:               
    =. =.                              :-.                                 :--            
  .+%.  --                               .-:                                  :--.        
   =%*.  .=                                .--                   ..::::::::::::::=+       
    :##-   -:                                 --.          ::::::.                =       
     .*%+   :=                                  :-:    :--:                       +-      
       =%#.   =                           ..::::::=+==:            .::--====++++++*%%*-   
        :#%=   =:                 .:::::::.       .*%%*:     :-+*#*++=---:::.......       
          +%*.  :=           ::::.                *%%%%%=:=++-:.                          
           -##:   =:     :-:.            .:-==+++*%%%%%%#=.                               
            .*%+   :-.--:          :-+**+=-:...   .--=-:                                  
              +%*.  --        :-+#*=-.                                                    
               -#%- =     :=*#*=:                                                         
                :#%++ :=*%*=:                                                             
                  +%%#+-:                                                                 
                   :.  
    `;
    console.log(chalk.green(bookAsciiArt));
}
function displayStaffAsciiArt() {
    const staffAsciiArt = `
                                        :-==++==-:                                       
                                     :+%@@@@@@@@@@@@%+:                                   
                                   =@@@@@#+=----=+#@@@@%=                                 
                                 -@@@@*:            :*@@@%-                               
                                +@@@#.                .#@@@+                              
                               =@@@+                    +@@@=                             
                               @@@#                      #@@@.                            
                              =@@@:                      -@@@=                            
                              =@@@.                      -@@@=                            
                              .@@@+                      +@@@:                            
                               #@@@:                    .@@@#                             
                               .@@@@-                  -@@@%                              
                                 #@@@#:              :#@@@#.                              
                                  -%@@@%*-.      .-+%@@@%-                                
                                    -*@@@@@@@@@@@@@@@@*:                                  
                                       :=*#%%@@%%#*=:                                     
                                       .::--------::.                                     
                                 :=*#@@@@@@@@@@@@@@@@@@#*=:                               
                             .=#@@@@@@%#*%@@@+=%@@@*#%@@@@@@#=.                           
                           =%@@@@%+-.    #@@@  *@@@.   .-+%@@@@%=                         
                        .*@@@@#-         @@@*  -@@@=        -#@@@@*.                      
                      .*@@@%=.          =@@@:  .@@@*          .+@@@@*.                    
                     =@@@@=             %@@%    %@@%             =@@@@=                   
                   .#@@@*              .@@@*    +@@@.              *@@@*                  
                  .%@@@-               =@@@-    .@@@+               -@@@%.                
                 .@@@@.                *@@@.     %@@%                :@@@%                
                 #@@@:                 @@@#      *@@@.                .@@@%               
                +@@@-                 :@@@#      *@@@-                 =@@@+              
               .@@@*                   +@@@@+  =@@@@+   -@@@@@@@@@@-    #@@@              
               +@@@:                     *@@@@@@@@+.    .*########*.    :@@@=             
               #@@@                       .*@@@@*.                       %@@%             
               @@@#                         .=+.                         *@@@             
               @@@*                                                      +@@@             
               :=-                                                        ==.
    `;
    console.log(chalk.green(staffAsciiArt));
}
function printMembersArt() {
    console.log(chalk.redBright(`
                                        .:-====--:.                                       
                                    .=*#####*****##*=:                                    
                                  -*#*##**###**********=                                  
                                .+*##*****###*******#*#**:                                
                               .*#************************=                               
                               *******************#*******#:                              
                              -#****************#*****#****+                              
                              +*****************************                              
                              +***#************#************                              
                              :#***************#**********#+                              
                               +#***##******************#*#.                              
                                +###*##*******************.                               
                                 -*#********************=                                 
                                   -***#**************=.                                  
                             :-      .-+*#######**+=:      ::                             
                          .=**#*-         ..:::.         :+#**+:                          
                        .+#*****#*+-.                 :=*#*##**#+:                        
                       -##******#####*+=-::.....:-=+*#*###******##=                       
                      +##*******###*###****##*****#####************+                      
                     =*****#*****####*******#***************#***#****                     
                    :#***#*********##********************#***********-                    
                    ****#*******#********#**************##***#********                    
                    #*#**#************#**********************#*****#*#.                   
                   .##**##*****************************************#*#.                   
                   .##**#**#****************#********************###*#.                   
 .:                .##**##*********************#****************####*#.                   
 .:                 ==================================================.
    `));
}




/**
 * menu
*/
function menu() {
    console.log(chalk.bgRed("\n------------------- BIENVENUE --------------------\n"));
    console.log("====================   MENU  ======================\n");
    console.log("\t1-   Membres");
    console.log("\t2-   Responsables\n");
    console.log("===================================================");
    const ask = prompt("#Choisisser entre ses deux options : ");
    return ask
}

/**Pour les membres */

function membresOption() {
    console.log(chalk.bgRed(" ++++++++++++++++ Bienvenu cher membres. ++++++++++++++++\n"));
    console.log("\t1-   Chercher un livre");
    console.log("\t2-   Afficher la liste des livres écrits par tel Auteur");
    console.log("\t3-   Afficher la liste des livres par genre");
    console.log("\t4-   Chercher des livres par genre");
    console.log("\t5-   Suggerer un livre non disponible")
    console.log("\t6-   Liste les top 20 des livres les plus empruntés par les membres");
    console.log("\t7-   Chercher des livres par language")
    console.log("\t8-   Quitter\n")

    const member_ask = prompt("Veillez saisir votre reponse : ");
    console.log("\n");
    if (member_ask == "1") {
        const request = prompt('Enter le titre du livre : ');
        searchingBookByTitle(request);
    }
    if (member_ask == "2") {
        const request = prompt('Enter le nom de l\'Auteur : ')
        booksAndAuthor(request);
    }
    if (member_ask == "3") {
        searchingBookByGenre();
    }
    if (member_ask == "4") {
        const request = prompt('Entrer le genre : ')
        searchingBookByASpecificGenre(request)
    }
    if (member_ask == "5") {
        const title = prompt("Veuillez saisir le titre du livre au quel vous souhaitez que la bibliothèque possède : \n\t---→ ")
        const author = prompt("Veuillez saisir le nom de l'auteur du livre : \n\t---→ ");
        const descriptions = prompt("Veuillez saisir une petite description du livre : \n\t---→ ");
        const id = prompt("Veuillez saisir votre identifiant : \n\t---→ ");
        insertBookToWishList(title, author, descriptions, id);
    }
    if (member_ask == "6") {
        TwemtyMostBorrowedBooks();
    }
    if(member_ask == '7'){
        const request = prompt('Quelle langue voulez vous? ')
        searchingBookByLanguage(request)
    }
    if (member_ask == "8") {
        console.log("A bientot!\n")
        biblio();
    }
}



/**Pour le personnels */
function personnel() {
    let auth = personnelAuth()
    if (auth) {
        personnelOption()
    } else {
        biblio()
    }
}

function personnelAuth() {
    let password = prompt('Enter your password: ')
    if (password == 'books') {
        return true;
    } else {
        return false;
    }
}

function personnelOption() {
    console.log(" ++++++++++++++++ Bienvenue à vous cher personnel de la Bibliothèque  ++++++++++++++++");
    console.log("\t1-Liste des empreinteurs");
    console.log("\t2-Liste des livres encore disponnibles");
    console.log("\t3-Liste des livres non empruntable");
    console.log("\t4-Voir le nombre total des livres");
    console.log("\t5-Voir le nombre total des members de la bibliothèque");
    console.log("\t6-Liste les top 20 des livres les plus empruntés par les membres");
    console.log("\t7-Liste les top 20 des membres les plus actifs");
    console.log("\t8-Liste des top 20 des livres les plus demandés");
    console.log("\t9-Quitter\n");

    const personnel_ask = prompt("Veillez choisir votre réponse: ");
    if (personnel_ask == "1") {
        borrowerList()
    }
    if (personnel_ask == "2") {
        availableBookLists()
    }
    if (personnel_ask == "3") {
        nonBorrowable();
    }
    if (personnel_ask == "4") {
        numberOfAvailableBooks();
    }
    if (personnel_ask == "5") {
        numberOfmembers();
    }
    if (personnel_ask == "6") {
        TwemtyMostBorrowedBooks();
    }
    if (personnel_ask == "7") {
        TwemtyMostActivMembers();
    }
    if (personnel_ask == "8") {
        TwemtyMostWishedBooks();
    }
    if (personnel_ask == "9") {
        biblio();
    }
}
displayBookAsciiArt();
biblio();