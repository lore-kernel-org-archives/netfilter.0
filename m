From: Shawn Starr <spstarr@sh0n.net>
Subject: Kernel 2.4.19 w/ iptables loaded but not used - Strange bug
Date: Mon, 9 Sep 2002 18:51:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091851.30539.spstarr@sh0n.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

config options:
[*] Network packet filtering (replaces ipchains)
[*]   Network packet filtering debugging
[*]   IP: TCP syncookie support (disabled per default)

=2D-
<*> PPP (point-to-point protocol) support
<*>   PPP support for async serial ports =20
<*>   PPP support for sync tty ports
<*>   PPP BSD-Compress compression
<*>   PPP BSD-Compress compression
<*>   PPP Deflate compression
=2D- for PPTP VPN=20

IP: Netfilter Configuration -->
<*> IP tables support (required for filtering/masq/NAT)
<*>   limit match support
<*>   MAC address match support
<M>   netfilter MARK match support
<M>   Multiple port match support
<M>   TOS match support
<M>   AH/ESP match support
<M>   LENGTH match support
<M>   TTL match support
<M>   tcpmss match support
<M>   Unclean match support (EXPERIMENTAL)
<M>   Owner match support (EXPERIMENTAL)
<*>   Packet filtering
<*>     REJECT target support
<M>     MIRROR target support (EXPERIMENTAL)
<*>   Packet mangling
<M>     TOS target support
<M>     MARK target support
<*>   LOG target support
<M>   ULOG target support
<M>   TCPMSS target support


What happens is when the kernel boots, and loads iptables, regular ping tim=
es=20
go all eratic.

However, when specifying ping -R host it shows normal ping times. When I=20
removed iptables (recompiled kernel without support). I did not see this=20
problem.

Is this known? =3D)

Shawn.

P.S I am not on this list. please reply to me directly and cc to the list i=
f=20
anyone else experienced this problem =3D)

