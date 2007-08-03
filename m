From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT on stateless firewall ?
Date: Fri, 03 Aug 2007 11:55:35 +0200
Message-ID: <46B2FB97.3090605@plouf.fr.eu.org>
References: <46B26400.7050504@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B26400.7050504@andrei.myip.org>
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

Florin Andrei a =E9crit :
[...]
> Since HTTP is the only thing traversing the firewall,

Really ? No ICMP error messages, no outgoing DNS queries ?

> The problem is, NAT seems to imply stateful filtering. The moment I=20
> start playing with the nat table, the ip_conntrack module gets loaded.

Iptables NAT is stateful by design and requires the connection tracking.=20
However it does not imply stateful filtering, i.e. the use of connection=20
tracking matches such as 'state' or 'conntrack' in filtering rules.

> Is there a way to do NAT on a true stateless firewall? (no conntrack=20
> loaded)

There used to be a stateless NAT implemented in routing code of old=20
kernels enabled by the option CONFIG_IP_ROUTE_NAT. It could be set up=20
with 'ip rule' and 'ip route' commands. But it was considered broken and=20
has been removed since version 2.6.9. However it is still present in=20
recent 2.4 kernels.

> If the answer to the previous q is negative, can I just ignore conntrac=
k=20
> and build the filter and nat tables as if conntrack would not exist?

Yes, of course. But keep in mind that iptables NAT is stateful by design.

> I stumbled upon "-t raw" and I'm testing it, looks like it does what I =
need.

If you mean using the NOTRACK target, this is a bad idea. Packets in the=20
UNTRACKED state will be ignored by the connection tracking *and* thus by=20
the stateful NAT which depends on it.

