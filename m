From: kevinc@seaplace.org
Subject: External only Nat?
Date: Fri, 15 Aug 2003 10:55:52 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43605.199.89.234.122.1060962952.squirrel@mail.seaplace.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi all -

I'm new to this list and hope you can help.

I'm using a Linux box as my primary firewall.  The box sits in my static
public address space, along with my mail and web servers.  It routes
packets between the public space and my private 10.x.x.x subnets.  e.g.=20
from my mail server, I can ping 10.x.x.x addressess successfully.

I'm having problems mapping samba shares on my web server (public address
space) from Windows boxes in the private 10.x.x.x space.  I believe this
is due to the use of NAT.

What I'd like to do is NAT mangle packets ONLY when they are destined for
the Internet (e.g. my default gateway box) and not when they are destined
for other boxes in my public address space.

I currently use the well-exampled command:

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

(eth0 is public space, eth1 is private LAN)

Can someone please suggest an iptables command that will accomplish what
I'm after?  Seems like there should be a way to replace the "-o eth0" wit=
h
the destination address of my gateway, although I'm not sure that would
work.  The packets destined for the internet flow through that box via th=
e
default route on the firewall, but are they addressed to it?

Thanks!

Kevin C.

ps.  This only became an issue after I moved my servers.  They previously
set behind a CISCO router connected to an ISDN line.  I had configured th=
e
CISCO to do all NATing, and let the firewall simply route and filter.  No=
w
I'm being a commercial cable connection and don't have access to their
modem/router, so had to push the NATing to the firewall.

