const prompt = require("prompt-sync")();

console.log("--------------------BIENVENUE-------------------- ");
console.log("***MENU***");
console.log("1-Membres");
console.log("2-Responsables");



const ask = +prompt("#Choisisser entre ses deux options:");


/**Pour les membres */
if (ask == "1") {

    console.log("Bienvenu cher membres.");
    console.log("1-Choisir un livre");
    console.log("2-Livre empreintable");
    console.log("3-Livre non empreintable");
    console.log("4-Quitter")

    const member_ask = +prompt("Veillez saisir votre reponse:");
    if (member_ask == "1") {
        return false;
    }
    if (member_ask == "2") {
        return true;
    }
    if (member_ask == "3") {
        return 1
    }
    if (member_ask == "4") {
        console.log("A bientot!")
    }
    else {
        console.log("Erreur");
    }
}


/**Pour le personnels */


else if (ask == "2") {
    console.log("Bienvenue en tant que personnel");
    console.log("1-Liste des empreinteurs");
    console.log("2-Liste des livres encore disponnibles");
    console.log("3-Liste des livres nos disponnibles");
    console.log("4-Quitter");

    const personnel_ask = + prompt("Veillez choisir votre réponse:");
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
        console.log("A bientot!");
    }
    else {
        console.log("Erreur")
    }
}

else {
    console.log("Erreur");
}

console.log("*****************************X**********************************");
