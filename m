From: =?ISO-8859-15?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: I cant flush rules
Date: Mon, 07 Mar 2005 12:15:55 +0100
Message-ID: <422C37EB.6090305@mnemon.de>
References: <1110138094.6856.65.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1110138094.6856.65.camel@debian>
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

your port 8000 - and all others - can be accessed, because you allowed
it. First:

iptables -A INPUT -s 195.140.140.100 -j ACCEPT

you accept all connections from this box: Second:

iptables -A INPUT -p tcp --syn -m limit --limit 5/s -j ACCEPT

you allow 5 connections per second from everywhere, including the
internet. This is the second rule and as ACCEPT is a terminating
target, chain traversing stops right here. So your services are all
available to the whole world.

You can remove the second rule or do it more specifically, e.g. with
interfaces or ports like this:

iptables -A INPUT -p tcp -i ethn -m limit ... # if you have at least 2
interfaces

or

iptables -A INPUT -p tcp --dport 8000 -m limit ...

In the last rule you should specify addresses, that may connect to
port 8000. You can also combine it like this:

iptables -A INPUT -p tcp -i ethn --dport 8000 -s SOME_ADDRESS -m limit
....

HTH

J=F6rg



Rakotomandimby (R12y) Mihamina schrieb:

| Hello, I have one big problem with my iptables 1.2.11 on a Debian
| testing box. Though I explicitely drop, some connections can be
| done. The iptables-save output is also strange.
|
| http://www.etud-orleans.fr/Members/mihamina/divers/rules.txt/file_view
|
|
| And here is the output of iptables-save:
|
http://www.etud-orleans.fr/Members/mihamina/divers/ipt-save.txt/file_view
|
|
| As you see, although I tried to flush, ...
|
| The critical thing is I'm running a test daemon listening on port
| 8000, and it can be accessed though I told to DROP by default...
|
| What did I do wrong ?



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
iD8DBQFCLDfqt9fkjiZ7IE8RAvHKAJ9Yr3pag9qVc6bMkaI4+ygYYSBVtACgnT2L
EJ4zynj5SFWXYi9fx4uHVoA=3D
=3DOF65
-----END PGP SIGNATURE-----



