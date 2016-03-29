From: Miroslav Rovis <miro.rovis@croatiafidelis.hr>
Subject: Nftables or Iptables/Ebtables for a simple linux bridge?
Date: Tue, 29 Mar 2016 23:49:41 +0200
Message-ID: <20160329214941.GA8622@g0n>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I have done a lot of research, and am unable to decide which way to go
for my planned linux bridge implementation:

iptables+ebtables

or

nftables

All my initial insecure beginner's steps are in the topic on Gentoo
Forums:

A Firewalled Internet Access to Internal Subnet
https://forums.gentoo.org/viewtopic-t-1041028.html

And I posted about my query on another topic on Gentoo Forums, where a
(probably young) talented member attempts to deploy somewhat similar
setup, but the two (very) senior Gentooers in their advice they mete to
him, keep to Iptables only.

They never ever even mention Nftables... Have a look:

PPPoE and static subnet setup
https://forums.gentoo.org/viewtopic-t-1040272.html

Why is that? Those are senior members...

For my setup, that you can glean, maybe best if you go to this post in
my ample and painstaking wandering:

( same: "A Firewalled Internet Access to Internal Subnet" topic)
https://forums.gentoo.org/viewtopic-t-1041028.html#7897936

there is plenty of tutorials if I go the Iptables and the Ebtables way...

And my question to the list is: where are the corresponding Nftables tutori=
als for a setup like mine?

Or should I better stick with the Iptables/Ebtables?

Pls. also notice the questions I posted today on:

( sae: "PPPoE and static subnet setup" topic )
https://forums.gentoo.org/viewtopic-t-1040272.html#7899080
esp. what "There is currently no connection tracking available for
bridge filtering." on Nftables Wiki means.

WARNING opfront: I am sincere, but not a programmer, nor very advanced
user either, and it may be possible what I propose below, but it also
may be that I wouldn't be able to really test as proper tester:

I'd even be willing to try and do some testing with Nftables (simply
because of the good sides of the new concept), if developers were sure
they can achieve a result that, in some, even longer, but forseeable
future, could be as good as what can be achieved with Iptables/Ebtables.

(
I hope you also read the paragraph previous to that offer.

AND ANOTHER NOTE: you may need to have a lot of patience, but I would
post all here on the list and other readers could assist.
)

Regards!

--=20
Miroslav Rovis
Zagreb, Croatia
http://www.CroatiaFidelis.hr

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW+vh1AAoJEOqYhIhPuvCuenYP/3FliKJ7hJqhuXcQrTRdStTp
B+N/D4jVlNd+qIAHurx8G68tXLe09u7jvH0Lwe+sBWrn5OeRDduKpBalwp6UNf7h
1rxeIsWJDSk4KaScEL56vPadSDxmDkduHBDTLA4SCVWTvv0qDWxS57d0gQYlZI6b
UTbm0Xfcq3LaMHNaLlnqs7a0/rJeW4FZ9tkDGq+pY0Kzf1I56IKo2V9l4mVob4/U
8ffqHss/HrMeUL+OrHoHVmWbCVpi0f3j6RHJAHLM+5KLkPaJVCr38c1+wPf3CBjW
AuFaT9UVeKmcy9W6D85HVD5VK81nNCiu5rW+1OybcRREEAbWADoU0VN/ZSN7Kdfe
ifxRfxylC/AhaXc7IKL2h9gA32mXrToz6OVxXSgcOkFvDaEO4KvBw8M5JnyCZ8Ma
pDSI25/x5Z14UrLRqta6P4oZIjoEdycnl2M8uGXFCh5JVMaRJa4niChQKCmsD5OU
dax2g7k8qjVLSahAwtXIKC6toi1OPaiay7wbsL3nSw/wVWjA9srx0fFx5F3EddiY
lY3jZxxd7L1X3w3WLfdCn4jXqga70o45v/nbC+XbE7I9x5nT/O30Y82KAVF1L7sg
CGhZq11VcyOT3HVgVKNxu0IAchN+FM6w8vxyxzYuY4kV0qEmWM3blSOe++rbvdvP
aDCWmolqeqZ1inKdqcoS
=QZp6
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
