From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: netfilter firewall w/ failover, Poor man's conntrack failover
Date: Fri, 29 Aug 2003 15:33:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030829133357.GA8109@koala7>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="jI8keyz6grp/JLjh";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Harald and others,

i've seen Haralds presentation on netfilter failover at this years
FOSDEM[1].

I know that connection tracking information replication is not yet
implemented, so i am looking into using the "poor man's" approach with
shared ethernet.

I've played around with the kernel a bit so far but have had little success.

It would be nice if someone could provide some insight into how to hack the
kernel so it does connection tracking based on packets from an interface in
promiscuous mode without actually forwarding those.

Right now i have to identical machines set up with identical routes,
interfaces and corresponding ips. Both machines have ip forwarding turned
on, but the box that is on hot standby has arp replies turned off
(ifconfig <iface> -arp).

With a standard kernel, packets for other hosts are dropped in
net/ipv4/ip_input.c:

/*
 *      Main IP Receive routine.
  */
  int ip_rcv(struct sk_buff *skb, struct net_device *dev, struct packet_typ=
e *pt)
{
        struct iphdr *iph;

	        /* When the interface is in promisc. mode, drop all the crap
	         * that it receives, do not try to analyse it.
 		 */
		 if (skb->pkt_type =3D=3D PACKET_OTHERHOST)
		     goto drop;

The second place where these packages could be dropped is
net/ipv4/ip_forward.c:

int ip_forward(struct sk_buff *skb)
{

[...]

        if (skb->pkt_type !=3D PACKET_HOST)
	                goto drop;
		=09

Right now i have tried two things:

1. just commenting out the "goto drop" so that the packet are handled like
any other (ip_route_local(), ip_forward() etc).

2. instead of dropping the packet, calling=20
NF_HOOK(PF_INET, NF_IP_LOCAL_IN, skb, skb->dev, NULL,
                       ip_local_deliver_finish);
or
NF_HOOK(PF_INET, NF_IP_FORWARD, skb, skb->dev, dev2,
                       ip_forward_finish);
		      =20
respectively.

If someone could point me in the right direction i would be very grateful.

thanks,

Nils Juergens


[1] http://www.fosdem.org

--=20
Nils Juergens  | ju@isf.rwth-aachen.de
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/T1ZFlkk/tUOsNeMRAsP+AKDlee8TWVlhRCV+amCkzdwDFry0fACgr9qX
HFvevBCyCZfQV/CRrNQ1k+4=
=6gf4
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--


