/* Fichiers sources:

https://github.com/lvdEphec/tp-progra

Q1--- Logique et programmations

1) Se baser en local sur les données de produits définis ci-dessous.

2) Remplir la table sur base de ces données.

3.a) Créer un index qui trie sur base des montants,
puis afficher les données dans le tableau sur base de cet index.
3.b) Créer un index qui trie sur base des montants en majeur, puis sur les nom en mineur,

puis afficher les données dans le tableau sur base de cet index.

4) Ajouter un produit en utilisant le formulaire.

5) Créer une fonction calculerPrixMoyen() qui calcule le prix moyen.
Puis une fonction afficherPrixMoyen(), qui affiche en console le prix moyen en utilisant la fonction précédente.

*/

let index = ['p02','p03'];
let courses = {
    p01:{nom: "table",     montant: 50},    
    p02:{nom: "ordinateur",     montant: 1000},    
    p03:{nom: "PS5",     montant: 600},   
    p04:{nom: "switch2",     montant: 600}
	
};
