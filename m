From: Les Mikesell <les@futuresource.com>
Subject: Re: GRE problem
Date: Thu, 13 Jan 2005 15:40:23 -0600
Message-ID: <1105652423.18586.49.camel@moola.futuresource.com>
References: <200501131013.17416.marcin.giedz@eulerhermes.pl>
	<1105626751.917.21.camel@les-home.futuresource.com>
	<41E6E3C1.7030909@hermes-kredit.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E6E3C1.7030909@hermes-kredit.pl>
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
To: Marcin Giedz <marcin.giedz@hermes-kredit.pl>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-01-13 at 15:10, Marcin Giedz wrote:

> >I think you need to get rid of the /proc/net/ip_conntrack
> >entry but there is no mechanism to do this.
> >
> >
> So how this is removed from ip_conntrack after some period of time?. As 
> I said before, on a next day all GRE packets are transimited through 
> router, thence it seems that there is some "TTL" on "these" packets.

There is some kind of timeout on the conntrack entries and I assume
each protocol (tcp/udp/icmp/gre) has its own value.  In my case it
never does work because the source never stops sending and even though
it is doing the wrong thing applying the NAT it keeps the timeout
from expiring.

-- 
  Les Mikesell
   les@futuresource.com



