From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: disallow access from two internal networks
Date: Mon, 26 May 2003 07:57:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CD1@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Miguel Manso <mmanso@yahoo.com>, netfilter@lists.netfilter.org

Why not just allow forwarding to the outside only.. ie.

iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A FORWARD -o ppp+         -j ACCEPT # Or mask off what you =
want only
iptables -A FORWARD                 -j DROP

and make sure to allow other forwardings packets for whatever else you =
need..


you could possibly get away with something like

iptables -A FORWARD -i eth+ -o eth+ -j DROP

This will stop any packets going between nics... No need to specify IPs. =
But best test it first with -j LOG.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Miguel Manso [mailto:mmanso@yahoo.com]
Sent: Monday, May 26, 2003 3:31 AM
To: netfilter@lists.netfilter.org
Subject: disallow access from two internal networks


Hi there,

I've a linux router that's sharing an internet connection with four =
internal
networks:

192.168.1.0/24
192.168.2.0/24
192.168.3.0/24
192.168.4.0/24

I'd like to disallow each internal network to access the others.

I've this devices on the router:

ppp0 (external connection)
eth0 (network 1)
eth1 (network 2)
eth2 (network 3)
eth3 (network 4)

I thought that with this:

$IPT -A OUTPUT -o eth0 -s 192.168.2.0/24 -j DROP

I could drop any connection comming from the eth0 device (network 1) to =
the
network 192.168.2.0/24 (network 2).

I've tryed it but it don't DROP the connection.

What am I missing?

Thanks.



=3D=3D=3D=3D=3D
Miguel Manso
mmanso@yahoo.com

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com


