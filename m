From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: SNAT vs MASQUERADE
Date: Thu, 10 Nov 2005 22:05:24 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEGEDPBFAB.pablo@blueoakdb.com>
References: <200511090951.31228.rob0@gmx.co.uk>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511090951.31228.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of /dev/rob0
> Sent: Wednesday, November 09, 2005 10:52 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: SNAT vs MASQUERADE ... RE: ftp conntrack - nat problem
>=20
>=20
> On Wednesday 2005-November-09 09:23, Pablo Sanchez wrote:
> > When you say the SNAT target is better.  Can you quantify 'better?'=20
> > Are there any functional limitations overcome by SNAT over the
> > MASQUERADE target?
>=20
> Ooooh, I was afraid someone might ask that. Unfortunately I am only=20
> parroting the party line.

Hi,

I discovered a case where SNAT'ing is necessary over the MASQUERADE =
target. =20

I have an environment where I'm peering and I send traffic via one IP =
(when my primary ISP is down and they're providing backup) and they send =
me traffic via another IP (when they're down and I'm providing backup).  =
The IP's are associated with one interface so I assign one IP to the =
NIC's if-cfg file and I IP alias the second IP.

Pictorially, here's what I have:

           DSL               DSL
            |                 |
       [ router A ]<---->[ router B ]
        172.16.1.x         10.1.1.x

When [A] is failed over to [B], [A]'s routing table looks like so:

Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
10.1.1.101      0.0.0.0         255.255.255.255 UH    0      0        0 =
eth2 <-- IP alias
172.16.1.128    0.0.0.0         255.255.255.252 U     0      0        0 =
eth2 <-- ifcfg'd
172.32.1.0      0.0.0.0         255.255.255.248 U     0      0        0 =
eth1
172.16.1.0      0.0.0.0         255.255.255.128 U     0      0        0 =
eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 =
lo
0.0.0.0         10.1.1.101      0.0.0.0         UG    0      0        0 =
eth2

On [A], here are how the IP's are assigned to 'eth2':

ip addr show dev eth2
4: eth2: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc tbf qlen 3
    link/ether 00:09:5b:1a:82:72 brd ff:ff:ff:ff:ff:ff
    inet 172.16.1.129/30 brd 172.16.1.131 scope global eth2
    inet 10.1.1.105/32 scope global eth2
    inet6 fe80::209:5bff:fe1a:8272/64 scope link=20
       valid_lft forever preferred_lft forever

What I have found is when I use the MASQUERADE target, [B] sees the =
traffic as if it came via IP 172.16.1.129.

If I SNAT to 10.1.1.105, then the traffic comes to [B] looks like it's =
coming from 10.1.1.105

I thought intuitively, since I had defaulted the gateway to 10.1.1.101, =
[B] would see the traffic originating from 10.1.1.105.

Funky eh?  Perhaps I don't fully understand the underpinnings of the =
MASQUERADE target however it seems it picks the IP based on the ifcfg =
value, not the value of how traffic is being directed (via a default =
gateway).

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.664.9118                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


