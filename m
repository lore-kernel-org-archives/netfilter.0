From: Jason Opperisano <opie@817west.com>
Subject: RE: INPUT or FORWARD;;
Date: Mon, 20 Dec 2004 08:36:17 -0500
Message-ID: <1103549777.3264.18.camel@hubcap.ljm.dom>
References: <20041220132421.DAE032F42A@kshira.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041220132421.DAE032F42A@kshira.sterenborg.info>
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

On Mon, 2004-12-20 at 08:24, Rob Sterenborg wrote:
> I'm not sure I understand this :
> I agree it's a valid rule (syntax), but I don't think it will ever match
> a packet.
> 
> If -i and -d are specified, they both have to match to accept a packet,
> right ?
> Because <ip_eth0> is not assigned to ppp0, how can -i ppp0 -d <ip_eth0>
> ever match for the INPUT chain ?

  eth0 IP:  1.2.3.4
  eth1 IP:  10.1.1.1

  iptables -A INPUT -i eth1 -p icmp -d 1.2.3.4 -j ACCEPT

an ICMP echo-request packet arrives on eth1 with dst IP 1.2.3.4.

the routing code needs to figure out what the destination of the packet
is--so we do a route lookup.  1.2.3.4 is a local IP--OK, destination is
local.  packets with a local destination passes through the INPUT chain
of netfilter, so let's hook in...does the packet match our rule?

  -i eth1	YES
  -p icmp	YES
  -d 1.2.3.4	YES

so this rule matches--apply the target:

  -j ACCEPT

the majority of people i encounter need to free themselves from the
notation that there is some magic binding between interfaces and their
IP addresses, because the kernel certainly does not see things that way.

if you mean "destined for IP a.b.c.d and arriving on ethX" then say that
in your rule:

  iptables -A INPUT -i ethX -d a.b.c.d [...]

say what you mean and mean what you say.

-j

--
"Ah, good ol' trustworthy beer. My love for you will never die."
	--The Simpsons


