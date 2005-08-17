From: Clockover <clockover@wanadoo.fr>
Subject: Problem with the hooks (forwarding decision problem)
	(English/French)
Date: Wed, 17 Aug 2005 21:49:28 +0200
Message-ID: <430394C8.5030403@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

My local network:

Notebook (1)-------internet---------router--------Serveur-VPN (3)
                                                            |
                                                             ----------=20
LocalNetwork (2)

So I have a VPN server with the iptables' configuration as this (only a=20
part):

INPUT (drop):
ACCEPT     tcp  --  any    any     localnet/24          Server-VPN      =20
 tcp dpt:ssh
ACCEPT     tcp  --  any    any     localnet/24          Server-VPN      =20
 tcp dpt:10000
=20
FORWARD (drop):
ACCEPT     all  --  bond0  ppp+    localnet/24          localnet/24
ACCEPT     all  --  ppp+   bond0   localnet/24          localnet/24
=20
OUTPUT (drop):
ACCEPT     tcp  --  any    any     Server-VPN         localnet/24      =20
  tcp spt:ssh
ACCEPT     tcp  --  any    any     Server-VPN         localnet/24      =20
  tcp spt:10000

The server isn't the gateway of the local network, there is a router befo=
re.
I connect to the VPN Network without any problem.

If I ping a computer of the local network(2) it's good. And if I use a=20
service (SSH, FTP, Samba....) on the Server VPN (3) no problem too.
And if I open a remote SSH on a computer of the local network (2) it's=20
good but if I open Webmin on the same computeur (2), it's failed!
The Firewall stop my request !!

I try to open the chaine OUTPUT (Accept policy) and now it's run. and if=20
I go to see with "iptables -L -v", I see that the IP packets go to the=20
FORWARD chaine.

Why I must open the OUTPUT chaine ??
That would have pass in the FORWARD chaine as it's not for the Sver VPN,=20
no ?
And why SSH run correctly and not Webmin ?

I have other examples:
-Terminal Server to a computer of the local network (2) =3D> no problem
-Open a VNC session to a computer to a computer of the local network =3D>=
=20
no problem but the data are bloqued (the session opens but not texture
And I haven't any exeption for VNC or Terminal Server on the INPUT=20
Chaine and OUTPUT chaine.

Why this error ?
I have forget anything ?
All my request was send by the computer (1) connected on the VPN of cours=
e.

Thanks :-)
Sorry for my english

Message in French:

Voila j'ai un serveur VPN avec les r=E8gles iptables suivantes (extrait=20
j'ai jsute mis ce qui nous interresse):
=20
INPUT (drop):
ACCEPT     tcp  --  any    any     localnet/24          Serveur-VPN    =20
   tcp dpt:ssh
ACCEPT     tcp  --  any    any     localnet/24          Serveur-VPN    =20
   tcp dpt:10000
=20
FORWARD (drop):
ACCEPT     all  --  bond0  ppp+    localnet/24          localnet/24
ACCEPT     all  --  ppp+   bond0   localnet/24          localnet/24
=20
OUTPUT (drop):
ACCEPT     tcp  --  any    any     Serveur-VPN         localnet/24      =20
  tcp spt:ssh
ACCEPT     tcp  --  any    any     Serveur-VPN         localnet/24      =20
  tcp spt:10000
=20
Le serveur ne fait pas office de passerelle, il y a un modem/routeur=20
devant. =20
Donc je me connecte sur mon VPN =E0 distance sans probl=E8me.
=20
Si je ping une b=E9cane du r=E9seau local aucun probl=E8me, idem si je de=
mande=20
le moindre services heberg=E9 par le Serveur-VPN.
Et les choses se corsent juste maintenant.
Si j'ouvre une session SSH =E0 distance sur une machine du reseau local,=20
ca fonctionne tout bien correctement mais si j'essaye d'ouvrir une=20
session Webmin, =E7a ne fonctionne pas! Le firewall le bloque.
Alors que les r=E8gles sont similaires...=20
=20
J'ai essay=E9 en ouvrant la cha=EEne OUTPUT (ACCEPT par d=E9faut) =E7a=20
fonctionne nickel. Apr=E8s =E7a, je referme cette r=E8gle une fois ma ses=
sion=20
=E9tablie ca continue =E0 tourner nickel et je vois en faisant "iptables =
-L=20
-v" les r=E8gles contenu dans FORWARD faire transiter les paquets.
=20
Alors d'ou vient cette neccessit=E9 d'avoir une ouverture sur OUTPUT ???
N'est-ce pas senser passer directement sur la cha=EEne FORWARD vu que ma=20
requ=EAte n'est pas =E0 destination du serveur ? =20
Et pourquoi =E7a fonctionne avec SSH mais pas Webmin ?

J'ai d'autres exemples en t=EAte:
=20
-Terminal Server sur un poste du reseau local =3D> nickel
-Ping vers un poste du reseau local =3D> nickel
-Ouverture d'une session VNC sur un poste =3D> nickel mais le flux de=20
donn=E9es est bloqu=E9 apr=E8s
=20
J'ai aucune r=E8gles pour ces trois services dans mes cha=EEnes INPUT/OUT=
PUT=20
pourtant (donc DROP).
=20
Comment expliquer cette erreur de routage ?
Ou est-ce moi qui est =E0 cot=E9 de quelque chose ?
Toutes mes requ=E8tes etant bien s=FBr =E9mise de l'ordinateur (1) connec=
t=E9 =E0=20
distance.

Merci

