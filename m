From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables broute DROP problem in production environment
Date: Wed, 23 Dec 2009 21:48:26 +0100
Message-ID: <4B32821A.309@plouf.fr.eu.org>
References: <8a87046f0912231019l76e69a9eg52a529023d02237b@mail.gmail.com> <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

=46elipe W Damasio a =E9crit :
>=20
>   I'm trying to use ebtables/iptables to implement a tproxy-squid on =
my network.
>=20
>   I have a bridge-setup, with eth0 facing the user and eth1 facing th=
e internet.
>=20
>   Everything works great when I have an user connected with a
> cross-over cable on eth0.
>=20
>   But when I plug eth0 on the production environment network (which
> uses multiple VLANs, one for the users and another for the internet),
> http traffic stop working (ie. doesn't get routed to squid).

Do you mean that eth0 sees VLAN tagged traffic ?
