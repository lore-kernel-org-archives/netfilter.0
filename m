From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Setting NOTRACK on all tcp connections
Date: Wed, 01 Dec 2010 15:42:29 +0100
Message-ID: <4CF65ED5.50808@plouf.fr.eu.org>
References: <4CF65D15.3060109@trego.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF65D15.3060109@trego.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Raviv a =E9crit :
>=20
> I tried to setup a rule for notracking TCP connections as follows:
>=20
> iptables -t raw -A  PREROUTING -p tcp -j NOTRACK
>=20
> but stiil i can see a lot of tcp connections in /proc/net/nf_conntrac=
k.

If these TCP connections are established by the host, you need to add
the same rule in the OUTPUT chain too. Also if you have IPv6 traffic yo=
u
need to add the same rules with ip6tables.
