From: "Henning Riis Rasmussen" <hrr@hkkf.dk>
Subject: Masquerade and dhcp lease renewal - what happens?
Date: Mon, 3 Oct 2005 16:57:27 +0200
Message-ID: <FBE2D879EA1A434D94659001D0C3647A045037@kbh1.hkkf>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hello :)

I have a problem with a Gentoo box that I'm using as firewall at home
(vanilla kernel 2.6.11.11, iptables 1.3.2, dhclient 3.0.1).

I have an ADSL connection with DHCP assigned dynamic IP address, so I
use "-j masquerade $WAN_IF" to NAT all traffic destined for the
Internet.

My ISP (Telia, Sweden) uses a DHCP lease time of 10 minutes leading to
constant renewal of the lease.

If I use "-j masquerade" instead of "-j snat" I cannot have any
longlived connections (they all die with "new not syn" or "invalid").

With "-j snat" there isn't any problems (except that this is a little
hard to use with a dynamic IP...).

What is supposed to happen to the masquerade nat entries when a dhcp
renewal happens, particularly one that doesn't actually change the IP
address to a new one?

Thanks,
Henning

