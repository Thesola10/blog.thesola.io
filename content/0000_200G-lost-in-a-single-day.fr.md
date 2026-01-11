---
Title: Vous aussi, perdez jusqu'à 200 Go en une seule journée en suivant ces conseils !
Date: 2021-01-25
Category: tech
Lang: fr
Translation: true
Slug: 0000_200G-lost-in-a-single-day
---

Les sysadmins le _détestent_ ! Bon, peut-être pas, mais ça reste une histoire marrante sur les données résiduelles.

> Oh non, il a encore paumé toutes nos données !

Non, pas cette fois (probablement). Sur cet "épisode" je vais traiter d'un p'tit sujet dont je viens de me rendre compte: Oui, il y avait bel et bien presque 200 Go de données qui n'appartenaient à aucun service à ma connaissance.

Comme mes utilisateurs ont (malheureusement) pu remarquer, mon serveur a plusieurs fois changé de configuration, passant notamment de [Arch](https://archlinux.org) à [NixOS](https://nixos.org), de ZFS à Btrfs... et, plus récemment, de [Docker](https://docker.com) à [Podman](https://podman.io) (+ des conteneurs natifs NixOS).  
Je ne vais pas m'étaler sur les détails, mais vous vous doutez bien que c'est un assez gros changement.

Un beau jour, je regarde mon tableau de bord magique (relax, c'est juste un terminal), et qu'est-ce que je vois? L'occupation des disques principaux, que j'avais estimée à 700 Go, a bien grossi à plus de 900 Go... Bizarre.

Mon premier réflexe a été de lancer ma commande favorite: `ducks` (`du -cksh`, lister la taille des fichiers/dossiers dans un dossier donné).

```
80K     /var/cache
4,0K    /var/cron
12K     /var/db
0       /var/empty
0       /var/games
```

Et plus rien. Ça prend du temps. **Beaucoup** de temps.

> *C'est probablement la taille. Je vais pas pouvoir scanner 900 Go, c'est pas raisonnable.*

Ok, donc je lance le scan dans le sous-dossier `srv`, où se trouvent les fichiers des divers services du serveur. En seulement 2 minutes, le rapport se dresse: 700 Go, comme prévu.

> *Je me souviens avoir vu mes logs prendre beaucoup de place, je me demande où ils en sont...*

On tente: `/var/log` montre un résultat intéressant: `sudo-io`, qui enregistre toutes les commandes lancées via `sudo`, me montre une belle centaine de gigas de logs.

> *Bingo. Je supprime ça vite fait, et...*

*Vite fait*, c'est le cas de le dire. Trop vite, en fait. Et quand je re-regarde, la quantité de données occupées n'a pas bougé d'un iota.

C'est pas très étonnant, Btrfs a l'habitude de faire quelques tours de passe-passe avec la taille apparente des fichiers. Les reflinks, c'est décidément une lame à double tranchant.

Franchement, ça résout pas mon problème. Il y a peut-être une raison pour que `du` prenne tant de temps sur une minorité des données dans les disques, mais laquelle ?

> *Tiens, la sortie de* `du` *est classée alphabétiquement, non?*

Je relance donc, avec la variante `btrfs filesystem du`, qui est plus précise car adaptée au Btrfs et ses spécialités.

Il s'arrête encore sur `/var/games`... Qu'est-ce qui vient après, déjà ? `/var/lib` ?

> *Attends une seconde...*
>
> `/var/lib/docker` *y est encore, non?* 

La dernière fois que j'ai essayé de le supprimer, ça a là encore pris beaucoup de temps. Ben oui, ce sont des conteneurs, chacun avec d'innombrables fichiers...

Et là, je vois un `Operation not permitted`. Plusieurs, en fait.

> *Ah oui, c'est vrai, Docker utilise des sous-volumes Btrfs*

Je lance un `btrfs subvolume delete`, qui lui va bien vite (pour une fois que quelque chose va vite), puis je peux *enfin* supprimer `/var/lib/docker` tranquille.

Et effectivement, c'était le coupable. L'usage des disques est retombé à 700-quelque-chose Go, toujours moins inquiétant quand on sait d'où ils viennent.

**Conclusion**: <s>Docker c'est le maaal</s> Ne jamais laisser des fichiers inutilisés de côté. Ça aurait pu être bien pire.
