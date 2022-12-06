From: Aaron Fischer <mail@aaron-fischer.net>
Subject: nftables: origin sport after dstnat
Date: Tue, 6 Dec 2022 23:03:47 +0100
Message-ID: <20221206230347.205a59c1@deskFu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YYLmkr6rGxEXp0w3IDmOTT1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/YYLmkr6rGxEXp0w3IDmOTT1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi!

I want to use nftables along with Docker. Docker itself does not
support nftables, so I use the nf_tables backend for iptables. This
way, Docker uses iptables commands to setup all needed chains and
rules. So far so good.

The following chains will be setup by Docker (I shorten it for the
relevant information):

table ip filter {
	chain FORWARD {
		type filter hook forward priority filter; policy drop;
		counter packets 6 bytes 360 jump DOCKER-USER
	}
	chain DOCKER {
		iifname !=3D "docker0" oifname "docker0" ip daddr 172.17.0.2 tcp dport 50=
00 counter packets 0 bytes 0 accept
	}
	chain DOCKER-USER {
	}
}
table ip nat {
	chain DOCKER {
		iifname "docker0" counter packets 0 bytes 0 return
		iifname !=3D "docker0" tcp dport 8448 counter packets 6 bytes 360 # xt_DN=
AT
	}
	chain PREROUTING {
		type nat hook prerouting priority dstnat; policy accept;
		# xt_addrtype counter packets 6 bytes 360 jump DOCKER
	}
}

Here I started a Docker container with "-p 8448:5000" (map the host
port 8448 to the docker internal port 5000). If a package enters, it
will land in the PREROUTING NAT chain (dstnat), jump to the DOCKER
chain and here the dnat happen. This is all set up from the Docker
daemon itself. The only way for me to intercept traffic is the
DOCKER-USER chain (FORWARD FILTER), which will be created by Docker
and will be put on top of all other rules in this chain.

Now I want to stablish a whitelist for host ports. Meaning: I want
to control which ports are "open" from the outside, regardless what
Docker is doing.

My first idea was to use the DOCKER-USER chain and add a simple rule
which will drop all traffic which is not coming from the whitelisted
port list:

tcp sport !=3D {
  8448,
} drop

The problem is that the DOCKER-USER chain is behind the dnat, so I
can't use "sport", because it is already a random port from the dnat :(

With a trace in that chain, I got this (sport is 57484, a random port)
and the filter rule does not work.

trace id 2a3fb2fd ip filter DOCKER-USER packet: iif "eth0" oif "docker0" et=
her saddr 52:54:00:8e:37:c7 ether daddr 52:54:00:9c:e5:b7 ip saddr 192.168.=
122.1 ip daddr 172.17.0.2 ip dscp cs0 ip ecn not-ect ip ttl 63 ip id 57921 =
ip length 60 tcp sport 57484 tcp dport 5000 tcp flags =3D=3D syn tcp window=
 64240=20
trace id 2a3fb2fd ip filter DOCKER-USER rule tcp sport !=3D 8448
counter packets 6 bytes 360 drop (verdict drop)

Is there a way to somehow access the origin sport (8448 in my case), so
I can filter for it in the FORWARD chain?

Thanks!
Aaron

--Sig_/YYLmkr6rGxEXp0w3IDmOTT1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEpHbGLcTIsnv4V2LpkeCyCzhT8bkFAmOPvEQACgkQkeCyCzhT
8bnt7hAAhBbJLTNFjNqTQemnAn9AhUbxH3dhuUWvvsfueQ5KJrLNbo9YpdLobEZR
7eQUGXz291QTAaK5gI1ZzL9h+eiO7gk4xkyzG1YdhY41cFcaVQzWIs0pL69/pv4E
i9piL2t+GQWnEigKa/6RH+4O3fr4jTq/xOfmIiyVbXrCCCj1fk+M25/MLaMNqOpH
ueJk0TAoF6yR1GjkaGK7fXn9FxkyufqjEvskJLJ6yjdbW+ARO8RjdpD2DOPC4Fr/
pmsLCumgKeVVJP15d58cKc0PL7lH1Kif+/mPC/pkR0xrmObJ+Y+jMMt21oiXYwSz
YoWyQJzcR7vog2ihq1pFt1qg76PSMJclehVhbSppGVUbyG0tIp5zT7B/8iH139R5
CDUkoJbR2emegkM17iJhjTXbhFogqdPcHfJ/3As494AmCw6AvM5B75zg0+NCRftY
JaP5KS1WizaRVqxbV9TkYG2tmRDbKWQuLWCpwZJgKFk82d24IpYg8s9QpUYsIP+a
QR74hIdVZTAuaFDLqjBkegKprzE6v2ocLy+YhGoINmwxwu0XDB8Ob67esmork98B
erIp6+4SatXcfJVV4W//cMhGfaX7ivbqJ/qd5b2/NBwyvg1XkO0cb7B7ZfiAPnKq
qqxZcIqJXPCeuJ4roBhg3ldWgM/+CS3cCMm6prONhUaQ0FF/ef4=
=X3GK
-----END PGP SIGNATURE-----

--Sig_/YYLmkr6rGxEXp0w3IDmOTT1--
