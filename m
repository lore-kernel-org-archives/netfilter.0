From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: question about NAT rule
Date: Tue, 22 Jun 2010 17:10:27 +0200
Message-ID: <4C20D263.2050502@plouf.fr.eu.org>
References: <AANLkTimaYvRg2379FY2erzJTKyhXFjEtyvOtgqfYnV2d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimaYvRg2379FY2erzJTKyhXFjEtyvOtgqfYnV2d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Pete Kay a =E9crit :
>=20
> I have the following NAT rule set up :
>=20
> udp      17 12 src=3D192.168.1.102 dst=3D192.168.1.140 sport=3D7390
> dport=3D8000 packets=3D6 bytes=3D3258 [UNREPLIED] src=3D192.168.1.140
> dst=3D192.168.1.102 sport=3D10000 dport=3D9000 packets=3D0 bytes=3D0 =
mark=3D0
> secmark=3D0 use=3D2

This is not a NAT rule but a conntrack entry.

> What I am expecting to achieve is that when udp packets go from
> 192.168.1.102:7390 to 192.168.1.140:8000, the conntrack module would
> redirect the packet to 192.168.1.102:9000, but it is not happening.
>=20
> Does anyone know what is wrong?

It is not happenning because of the above conntrack entry that says
otherwise and already exists for these packets, so iptables NAT rules
are ignored. You must first delete the conntrack entry with
conntrack-tools or by not transmitting related packets until it expires=
=2E
Then the next packet will hit the iptables NAT rules and create a new
conntrack entry accordingly.
