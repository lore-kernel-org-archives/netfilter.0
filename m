From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Drop packets with low IP Time to Live field value
Date: Fri, 24 Dec 2004 21:08:12 -0500
Message-ID: <1103940492.2011.19.camel@grendel>
References: <41CC19DF.2766.F2FCB6D@localhost>
	<1103914608.14459.23.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103914608.14459.23.camel@hubcap.ljm.dom>
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
To: netfilter <netfilter@lists.netfilter.org>

On Fri, 2004-12-24 at 13:56, Jason Opperisano wrote:
>
> this has nothing to do with netfilter or firewalling--it is part of
> standard routing.

Agreed. TTL of 0 should never happen unless the upstream router has gone
rogue or has been compromised.

> that all being said--use the ttl match:
> 
>   iptables [...] -m ttl --ttl-eq 1 [...]
>   iptables [...] -m ttl --ttl-lt 1 [...]
> 
> i don't condone the use of the above.

I've rejected TTL's of 5 or less with a host unreachable for many years
and have never had a problem. Its a great way to detect, and usually
prevent, tools such as Firewalk and TCPTrace. 

The lowest starting TTL you will see in the wild today is 32. Even then,
that's only certain networking hardware as most OS's are 64 or higher.
Given that most hosts are 14-18 hops away from each other on the
Internet, filtering TTL's or 5 or less should cause zero problems with
legitimate traffic.

HTH,
Chris



