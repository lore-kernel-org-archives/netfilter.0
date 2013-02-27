From: Daniel huhardeaux <daniel.huhardeaux@tootai.com>
Subject: Re: Using set mark to split traffic against 2 IF
Date: Wed, 27 Feb 2013 23:17:43 +0100
Message-ID: <512E8607.5020201@tootai.com>
References: <512B7507.7000008@tootai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <512B7507.7000008@tootai.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Le 25/02/2013 15:28, Daniel huhardeaux a =C3=A9crit :
> Hello,
>
> I'm running a Debian Squeeze with iptables 1.4.8. The server has 3=20
> physical interfaces, local one (eth2) being bridged as br0. Both othe=
r=20
> interfaces are connected too 2 providers in ADSL (eth0) and SDSL (eth=
1).
>
> Default route is going out through eth1. Two computers are going out=20
> using eth1, ip rule make this setup working.
>
> What I want now, is to mark packets 0x1 for eth0 0x2 (or nothing) for=
=20
> eth1, so I will be able to use the links by services for instane (lik=
e=20
> ssh and http connections going out using eth0, doesn't matter which=20
> computer) rest of traffic using the default route.

I got it, for archives. Two problems:

=2E -J CONNMARK doesn't do the job as -j MARK does
=2E have to deativate reverse path filtering which protect from IP=20
spoofing ( /etc/sysctl.conf net.ipv4.conf.all.rp_filter =3D0)

More info here=20
http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter=
-load-balancing-using-connmark

Regards

--=20
TOOTAi
