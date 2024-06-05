const prompt = require("prompt-sync")();

function biblio(){
    let ask = menu()
    if(ask == "1"){
        membresOption()
    }else if(ask == "2"){
        personnel();
    }else if(ask=='shutdown'){
       
    }else{
        biblio();
    }
}

/**
 * menu
 */
function menu(){
    
    console.log("--------------------BIENVENUE-------------------- ");
    console.log("***MENU***");
    console.log("1-Membres");
    console.log("2-Responsables");
    const ask = prompt("#Choisisser entre ses deux options:");
    return ask
}

/**Pour les membres */
function membresOption(){
    console.log("Bienvenu cher membres.");
    console.log("1-Chercher un livre");
    console.log("2-Afficher la liste des livres ecritent par tel Auteur");
    console.log("3-Afficher la liste des livres par categorie");
    console.log("4-Chercher des livres par categorie");
    console.log("5-Certains livres ne se trouvent pas dans la bibliotheque, voulez vous que le bibliotheque les possedent?");
    console.log("6-Quitter")

    const member_ask = prompt("Veillez saisir votre reponse: ");
    if (member_ask == "1") {
        const request = prompt('Enter le titre du livre ');
    }
    if (member_ask == "2") {
        const request = prompt('Enter le nom de l\'Auteur ')
    }
    if (member_ask == "3") {
        return 1
    }
    if(member_ask == "4"){

    }
    if(member_ask == "5"){
        const request = prompt("Enter ici le livre que vous souhaitez que le bibliotheque ce le procure ")
        console.log("merci, votre demande a ete enregistre");
    }
    if (member_ask == "6") {
        console.log("A bientot!")
        biblio()
    }
    else {
        biblio();
    }
}
    
    

/**Pour le personnels */
function personnel(){
    let auth = personnelAuth()
    if(auth){
        personnelOption()
    }else{
        biblio()
    }
}

function personnelAuth(){
    let password = prompt('Enter your password: ')
    if(password == 'BooksAreTheWayToSuccess'){
        return true;
    }else{
        return false;
    }
}

function personnelOption(){
    console.log("Bienvenue en tant que personnel");
    console.log("1-Liste des empreinteurs");
    console.log("2-Liste des livres encore disponnibles");
    console.log("3-Liste des livres nos disponnibles");
    console.log("4-Quitter");

    const personnel_ask =  prompt("Veillez choisir votre réponse: ");
    if (personnel_ask == "1") {
        return;
    }
    if (personnel_ask == "2") {
        return;
    }
    if (personnel_ask == "3") {
        return;
    }
    if (personnel_ask == "4") {
        biblio();
    }
    else {
        biblio()
    }
}

biblio()