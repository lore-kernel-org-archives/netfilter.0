From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Rule syntax
Date: Tue, 01 Mar 2005 14:33:56 +0100
Message-ID: <42246F44.200@mnemon.de>
References: <OF2F83684D.39A32C6C-ON80256FB7.003F7754-80256FB7.0040285E@wyrecompute.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OF2F83684D.39A32C6C-ON80256FB7.003F7754-80256FB7.0040285E@wyrecompute.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Hi,

your problem is, that the routing decision (here especially the
outgoing interface) is made before any chain is traversed. Even more,
the REDIRECT target redirects the packages to localhost, it does not
redirect to another host. So this will not work.

Using DNAT in OUTPUT will not work too, see above. I think, you should
try the ROUTE target from Pach-O-Matic, it promises to do the trick.
Last month there was a thread on this list about the ROUTE target, may
be you can find additional information there.

Sorry, I don't use this, so I can't help better.

Have a nice time,

J=F6rg

PS: PREROUTING is traversed only by incomming packets and never by
outgoing packets.

Chris Edwards schrieb:

| Hi,
|
| Need a bit of help with a rule. I've got a redhat box running a
| squid/websense installation. It's dualled interfaced on different
| network, and due to an update websense has done, is only
| contactable on the interface which can't see the default gateway.
| TO cut a long story short it aint working unless i can convince the
| reply packets to leave out the same interface. Putting a route in
| works for some but not all users, what i really need is to be able
| to redirect all the request as they try to go out eth1 to the
| gateway on eth0.
|
| I've been trying this command:-
|
| /sbin/iptables -t nat -A PREROUTING -o eth1 -p tcp --sport 15871 -j
|  REDIRECT -d xxx.xxx.xxx.193 or /sbin/iptables -t nat -A OUTPUT -o
| eth1 -p tcp -s xxx.xxx.xxx.xxx -j REDIRECT -d xxx.xxx.xxx.193
|
| I'm really new to iptables, only having done what the squid
| installation required, can anyone help with how to write a rule
| that does what i need?
|
| Chris =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
 If the only
| tool you have is a hammer, every problem looks like a nail.



- --
- -----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCJG9Et9fkjiZ7IE8RAvZnAJ9vW9t1ZBxiGLiRAUKTdzy4aOMBGACeOAJh
rVxs515J+RVvTqT9Wet76QE=3D
=3DEzvb
-----END PGP SIGNATURE-----



