From: Jason Opperisano <opie@817west.com>
Subject: Re: state: INVALID
Date: Tue, 23 Nov 2004 09:05:54 -0500
Message-ID: <1101218753.12981.18.camel@hubcap.ljm.dom>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
	<419FD0BD.6000906@uni-paderborn.de>
	<1101061543.3501.18.camel@hubcap.ljm.dom>
	<41A11AD5.3080401@uni-paderborn.de>
	<1101131121.13662.17.camel@hubcap.ljm.dom>
	<41A2010A.9090601@uni-paderborn.de>
	<20041122175440.GA31032@bender.817west.com>
	<41A23EE6.4080804@uni-paderborn.de>
	<20041122213910.GA31537@bender.817west.com>
	<41A3007B.7090009@uni-paderborn.de>
	<1101202285.3503.5.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101202285.3503.5.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: bj-schmidt@uni-paderborn.de

On Tue, 2004-11-23 at 04:31, Jason Opperisano wrote:
> On Tue, 2004-11-23 at 04:18, Bj=C3=B6rn Schmidt wrote:
> > Does not work. I only changed "-J LOG -log-prefix" to "-j ULOG -ulog-=
prefix"
>=20
> then either i'm an idiot or there's something horribly wrong with your
> kernel.  both are about equally likely at this point.

just for my own edification--i installed that rule base on my wireless
laptop, which runs a VPN tunnel for all its traffic (but normally does
not use connection tracking), and it does work--so i don't think this is
a "bug" per se.

this is on Fedora Core 2, kernel 2.6.9-1.3, iptables version 1.2.9

(sorry about the line mangling)

Chain INPUT (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out   =20
source               destination
     878   656329 ACCEPT     all  --  *      *     =20
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
     883   718600 ACCEPT     all  --  *      *     =20
0.0.0.0/0            0.0.0.0/0           MARK match 0x1 state NEW
       0        0 ACCEPT     udp  --  eth1   *     =20
192.168.1.125         0.0.0.0/0           udp spt:500 dpt:500
       0        0 ACCEPT     esp  --  eth1   *     =20
192.168.1.125         0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *     =20
0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out   =20
source               destination

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out   =20
source               destination
     778    88999 ACCEPT     all  --  *      *     =20
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
      26     2037 ACCEPT     all  --  *      *     =20
0.0.0.0/0            0.0.0.0/0           state NEW
       0        0 ACCEPT     udp  --  *      eth1  =20
0.0.0.0/0            192.168.1.125        udp spt:500 dpt:500
       0        0 ACCEPT     esp  --  *      eth1  =20
0.0.0.0/0            192.168.1.125

-j

--
"I'm better than dirt. Well, most kinds of dirt... not that fancy
 store-bought dirt... that stuff's loaded with nutrients, I... I
 can't compete with that stuff."
	--The Simpsons


