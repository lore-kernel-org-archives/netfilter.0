From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: REJECT target and Source NAT
Date: Tue, 5 Nov 2002 15:17:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211051517.gA5FHCe19285@vulcan.rissington.net>
References: <BC6421B0F2CC4C43897842092E0E00A94C1938@tx1ex1nt.dyncorptx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BC6421B0F2CC4C43897842092E0E00A94C1938@tx1ex1nt.dyncorptx.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Tuesday 05 November 2002 1:42 pm, Kellogg, Chris wrote:

> Hi, everyone.
>
> I'm thinking about a series of obfuscation rules to try to reduce firewall
> visibility.
>
> I'd like to make an IPTables firewall reject packets with an
> ICMP-Host-Unreachable, but also change the source address of the packet to
> be the gateway router instead of the firewall itself.
>
> Opinions?  Comments?

My opinion is that if you want to reduce firewall visibility, you should send 
back nothing at all.

However, if you want to try your idea, I think it's not the OUTPUT chain you 
want to look at, but the POSTROUTING chain, because that's where SNAT is 
done.   I see no reason why you shouldn't be able to SNAT ICMP packets coming 
from the firewall to make them look like they came from somewhere else.

iptables -A POSTROUTING -t nat -p icmp -s a.b.c.d -j SNAT --to w.x.y.z

a.b.c.d is firewall's external address
w.x.y.z is gateway router's external address

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

