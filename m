From: Jason Opperisano <opie@817west.com>
Subject: Re: Drop packets with low IP Time to Live field value
Date: Fri, 24 Dec 2004 13:56:48 -0500
Message-ID: <1103914608.14459.23.camel@hubcap.ljm.dom>
References: <41CC19DF.2766.F2FCB6D@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41CC19DF.2766.F2FCB6D@localhost>
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

On Fri, 2004-12-24 at 13:30, Jorge Agrelo wrote:
> Hi Folks
> 
> Anybody can help to write an iptables rule to drop/reject packets 
> with a TTL of 1 or 0 ?

coupla things:  if your routing firewall receives a packet with a TTL =
1 that is not destined for itself, it will drop the packet and reply to
the sender with an ICMP Time Exceeded, TTL expired in transit (type 11
code 0).

there is no "valid" way to receive a packet with a TTL of 0.  for that
matter, unless the attacker is on the same segment as you, it's pretty
tough to receive an "invalid" packet with a TTL of 0; unless the
attacker controls every router between himself and you.

this has nothing to do with netfilter or firewalling--it is part of
standard routing.

that all being said--use the ttl match:

  iptables [...] -m ttl --ttl-eq 1 [...]
  iptables [...] -m ttl --ttl-lt 1 [...]

i don't condone the use of the above.

-j

--
"Homer no function beer well without."
	--The Simpsons


