From: O-Zone <liste@zerozone.it>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Fri, 21 May 2004 16:08:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405211608.42467.liste@zerozone.it>
References: <200405201318.34706.liste@zerozone.it> <200405211130.21108.liste@zerozone.it> <200405211119.14458.Antony@Soft-Solutions.co.uk>
Reply-To: liste@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405211119.14458.Antony@Soft-Solutions.co.uk>
Content-Description: clearsigned data
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
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 21 May 2004 12:19, Antony Stone wrote:
> How do you route reply packets from those two public IPs back to the
> sender?

Ok problem with UDP solved...again many many thanks ! But a little problem=
=20
still remain with IPSEC.

On Firewall we have OpenSwan to connect from remote places. Inside our=20
INTRANET, however some of us use IPSEC clients, such SSH Sentinel or SafeNe=
t=20
LT, to connect to remote IPSEC (using NAT-T Encapsulation).=20

What happens when an intranet's user (10.0.0.40) try to connect to remote=20
IPSEC server (81.113.x.y) ?

10.0.0.40 -----> [MASQ - 10.0.0.1] ----> 81.113.x.y
10.0.0.40 <-xx- [MASQ - 10.0.0.1] <--- 81.113.x.y

the reply to IPSEC packet was NOT forwarded and take by OpenSwan on 10.0.0.=
1=20
with, of course, "who are you and why the f&%k calling me ?".

To enable firewall (10.0.0.1) accepting IPSEC connection i've used the=20
following rules:

# IPSEC
$IPTABLES -A INPUT -i $INET_IFACE -p udp --dport 500 -j ACCEPT
$IPTABLES -A INPUT -i $INET_IFACE -p 50 -j ACCEPT
$IPTABLES -A INPUT -i $INET_IFACE -p 51 -j ACCEPT

How i can keep working correctly MASQ ?

Oz

=2D --=20
I always had a repulsive need to be something more than human.
		-- David Bowie
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArg1oYuBSFbgkEysRAn8EAKDftszKctvX4gDK8G98HEDqllCvxgCguUy6
sZQ3BxQzAEucvi8yXa0XAbE=3D
=3DcPye
=2D----END PGP SIGNATURE-----


