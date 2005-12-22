From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ICMP types to allow
Date: Wed, 21 Dec 2005 21:08:24 -0500
Message-ID: <1135217304.30754.69.camel@siren.chrisbrenton.org>
References: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
	<20051222002905.GI25728@nightfall.luchs.at>
Reply-To: cbrenton@chrisbrenton.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051222002905.GI25728@nightfall.luchs.at>
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

On Thu, 2005-12-22 at 01:29 +0100, Ren=C3=A9 Pfeiffer wrote:
>
> This is true. However you need some inbound ICMP in order to support
> things like Path MTU discovery.

As mentioned, the only modern OS I'm aware of that uses straight ICMP
for MTU path is 3-4 year old AIX boxes. The sane way to do this is to
set Don't Fragment (DF) in the IP header and watch for returning type 3
code 4's. Also as mentioned, RELATED will pass these in without a
problem so no special rules are needed.

> In addition to that you can add some general size limits for ICMP
> packets. Theoretically ICMP packets can have 64 kB and there are tools
> out there that use oversized packets for tunneling data.=20

I've run the following rules for about four years now on numerous
firewalls I maintain:
iptables -A FORWARD -p icmp -f -j LOG --log-prefix " ICMPFRAG "
iptables -A FORWARD -p icmp -f -j REJECT --reject-with
icmp-host-unreachable

In short, the rules look for fragmented ICMP datagrams. I've seen
exactly zero legitimate packets get picked up by this rule. Every time
its triggered its been because of an attack.

I agree that size limits could also be extremely useful. While the spec
says it can be as large as 65,535 bytes, in practice you should never
see anything larger than your local MTU. Further, I would even be
suspect of any ICMP larger than 100 bytes or so. Most legit ICMP will be
below this size.

HTH,
Chris



