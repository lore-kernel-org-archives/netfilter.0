From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: mac match and FORWARD chain
Date: Tue, 24 Oct 2006 12:21:51 +0200
Message-ID: <453DE93F.3000704@plouf.fr.eu.org>
References: <361567501.01771@mail.nankai.edu.cn>	<453C1F0B.4010707@mail.nankai.edu.cn>
	<20061023105043.GA1104@animx.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061023105043.GA1104@animx.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Wakko Warner a =E9crit :
>=20
> Box A -> (eth1)firewall/router(eth0) -> Box B
>=20
> firewall/router does not trust eth1 and uses MAC addresses to allow acc=
ess,
> so it does this:
> -I FORWARD -j ACCEPT -i eth1 -m mac --mac BOXAMAC
> -I FORWARD -j DROP -i eth1

If the firewall does not trust what is beyond eth1, MAC filtering is=20
pointless : a MAC address can be easily sniffed and spoofed.

> firewall/router knows the mac of both box a and b (obviously, box a doe=
sn't
> know box b's mac and vice versa).  Consider the above the only rules in=
 the
> firewall and box A and B have no rules at all.
>=20
> Box A pings Box B and fails.  The reason is the mac test above is seein=
g the
> MAC of eth0, not of Box A.

There must be a bug in your specific setup/kernel/iptables/whatever. On=20
my box, the FORWARD chain sees the correct MAC source address.
Besides, I don't see how iptables could see the outgoing MAC source=20
address which AFAIK is added at the link layer, after the packet has=20
leaved Netfilter.

> This is what I'm referring to and I had to add a MARK rule in PREROUTIN=
G to
> mark packets that I want to allow and then allow in the forward chain b=
ased
> upon the mark.

About your idea of doing this in the nat table PREROUTING chain : it=20
won't work because the nat chains see only the initial packet of a=20
connection.

*Don't you ever use the nat table chains for anything else than NAT*

