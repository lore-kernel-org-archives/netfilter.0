From: Andy Smith <andy@strugglers.net>
Subject: Why does this connection stop being tracked?
Date: Tue, 14 Jun 2005 16:11:05 +0000
Message-ID: <20050614161105.GN750@strugglers.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iZGt3Nu4N+9AUM+d"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org


--iZGt3Nu4N+9AUM+d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This is rather a long email and so I hope that someone who knows
about netfilter, bridging and possibly Xen will have patience to
read it all the way through.

I have a server that I run Xen
(http://www.cl.cam.ac.uk/Research/SRG/netos/xen/) on, with 6 xen
user domains (virtual machines).

For those unfamiliar with Xen, the dom0 (host machine) has a virtual
network interface for each user domain and each of those virtual
interfaces are bridged onto xen-br0, along with the machine's real
eth0.  In each user domain, the virtual interface appears as eth0.
       =20
In dom0 I have iptables running, with the eb-nf support of linux
2.6.11 and the physdev module loaded so that I can match traffic
coming in to each of my user domains.

Part of my ruleset looks like this:

        $IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

        $IPT -A FORWARD -m physdev --physdev-out vif+ -j domu_forward_in
        $IPT -A FORWARD -m physdev --physdev-in vif+ -j domu_forward_out

        ###################################################################=
###
        # strugglers.net
        ###################################################################=
###

        $IPT -A domu_forward_in -m physdev --physdev-out vif-struggler.0 -j=
 domu_forward_in_strugglers
        $IPT -A domu_forward_in_strugglers -p tcp --syn -j domu_forward_in_=
strugglers_tcp
        $IPT -A domu_forward_in_strugglers_tcp -p tcp --dport 22 -j ACCEPT
        $IPT -A domu_forward_in_strugglers -m limit --limit 1/s -j LOG --lo=
g-prefix "FWD DROP: "
        $IPT -A domu_forward_in_strugglers -j DROP

Now, I have noticed that while this works most of the time, for
reasons unknown to me, some TCP connections just seem to stop being
tracked and hit the DROP rule.  Even though they have been tracked
fine for several hours.  This happens on every user domain to all
kinds of TCP connections, but I have pared the ruleset down to just
the one domain (strugglers.net) and SSH to demonstrate.

If I add a rule in domu_forward_in_strugglers to allow all TCP to
port 22 regardless of state the I have no problems.

This does not seem to affect the INPUT table where I have a similar
set of rules.

Today I decided to take a tcpdump while I was ssh'd in up until when
it kicked me out.  I ssh'd in at approx 13:07 GMT and got kicked out
at approx 15:32:49 GMT.  Here is a selection of what got logged on
the console of dom0:

Jun 14 15:32:34 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D92 TOS=3D0x00 PREC=3D0x00 TTL=3D119 ID=3D23572 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D63492 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:35 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D820 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23647 DF PROTO=3DTCP SPT=3D3=
1994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:37 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D820 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23675 DF PROTO=3DTCP SPT=3D3=
1994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:38 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23685 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK URGP=3D0
Jun 14 15:32:41 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D92 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23708 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:41 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23719 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK URGP=3D0
Jun 14 15:32:41 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D92 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23729 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:42 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D924 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23743 DF PROTO=3DTCP SPT=3D3=
1994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:45 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D76 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23757 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK PSH URGP=3D0
Jun 14 15:32:49 curacao kernel: FWD DROP: IN=3Dxen-br0 OUT=3Dxen-br0 PHYSIN=
=3Deth0 PHYSOUT=3Dvif-struggler.0 SRC=3D82.44.131.131 DST=3D212.13.198.70 L=
EN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D118 ID=3D23788 DF PROTO=3DTCP SPT=3D31=
994 DPT=3D22 WINDOW=3D64292 RES=3D0x00 ACK URGP=3D0

At the same time I see a lot of TCP connections suddenly being
denied to a number of other user domains, so I suspect that all TCP
connect tracking was purged then for some reason.

Although I was kicked out, I was able to reconnect straight away (as you wo=
uld
expect from the above ruleset, it allows the SYN to port 22 and away we go)=
 and
in fact that is how I am typing this email to you now.

Here is the bridge setup:

[andy@curacao src]$ brctl show
bridge name     bridge id               STP enabled     interfaces
xen-br0         8000.00e081641d07       no              eth0
                                                        vif-admin.0
                                                        vif-cholet.0
                                                        vif-outpostlo.0
                                                        vif-ruminant.0
                                                        vif-seinfeld.0
                                                        vif-struggler.0
[andy@curacao src]$ ip link
1: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:e0:81:64:1d:07 brd ff:ff:ff:ff:ff:ff
2: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 1000
    link/ether 00:e0:81:64:1d:08 brd ff:ff:ff:ff:ff:ff
3: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
4: sit0: <NOARP> mtu 1480 qdisc noop
    link/sit 0.0.0.0 brd 0.0.0.0
5: xen-br0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether 00:e0:81:64:1d:07 brd ff:ff:ff:ff:ff:ff
6: vif-admin.0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether fe:ff:ff:ff:ff:ff brd ff:ff:ff:ff:ff:ff
7: vif-cholet.0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether fe:ff:ff:ff:ff:ff brd ff:ff:ff:ff:ff:ff
8: vif-outpostlo.0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether fe:ff:ff:ff:ff:ff brd ff:ff:ff:ff:ff:ff
9: vif-ruminant.0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether fe:ff:ff:ff:ff:ff brd ff:ff:ff:ff:ff:ff
10: vif-seinfeld.0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether fe:ff:ff:ff:ff:ff brd ff:ff:ff:ff:ff:ff
11: vif-struggler.0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether fe:ff:ff:ff:ff:ff brd ff:ff:ff:ff:ff:ff

As I said above, I did a:

[andy@curacao src]$ sudo tcpdump -w /tmp/xen-br0.dump -i xen-br0 'host 212.=
13.198.70 and host 82.44.131.131'

just after ssh'ing in and left it running until just after my ssh client
gave up.  That file (1.5MB) can be found here:

http://strugglers.net/~andy/tmp/xen-br0.dump

But I cannot see anything obviously wrong with it.

Anyone have any ideas?  I can give up on connection tracking for my
user domains but it's troubling that it doesn't work.  Is it an
issue with using a bridge?

Thanks,
Andy

--iZGt3Nu4N+9AUM+d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCrwGZIJm2TL8VSQsRAgWNAKDyrnX0xFjR11jNyxHV20lnhxmm9ACePcYl
zSC4ZB9rE1vMuThfzi/zkn0=
=/WdX
-----END PGP SIGNATURE-----

--iZGt3Nu4N+9AUM+d--

