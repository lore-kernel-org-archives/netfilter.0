From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: iptables rule chain question
Date: Thu, 09 Feb 2006 15:17:08 +0100
Message-ID: <43EB4EE4.7010004@prosyst.com>
References: <20060209131739.GA4441@server.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060209131739.GA4441@server.homelinux.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Mark-Walter@t-online.de wrote:
> Hi,
> 
> I've have this in my firewall rule script and I'am unsure about DROP:
> 
> #
> # allowed chain
> #
> 
> $IPTABLES -A allowed -p TCP --syn -j ACCEPT
> $IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> $IPTABLES -A allowed -p TCP -j DROP
> 
> The first should allow tcp connections with syn,rst,ack and he should
> accept it.
> 
> The second one describes already established connections with ACCEPT.
> 
> But what happens in the third rule ?
> 
> Does it mean iptables DROP every TCP connection in the case syn,rst,ack is not set and the connection is not established.

Yes and no. Yes, it will drop the rest of the tcp packets going
through this chain ONLY. And no, because this is a user defined
chain. Since it is a user defined, then one of the native chains
filter INPUT, filter OUTPUT, etc. should have an exisiting rule,
which sends SOME packets through it.

Somewhere in your script you have a rule like this, but not
necessary exactly the same:

iptables -A INPUT -p tcp -s <one_ip> -d <second_ip> -j allowed

In the example above only packets which match the source and
destination IP's will be sent to the "allowed" chain. All other
TCP packets will continue to travel the INPUT chain and will
never have the opportunity to hit the 3rd rule of the "allowed"
chain.


> 
> Does iptables storing all connection's with connection tracking to know
> which connection is established,related ? (2. rule)

Yes, iptables keeps track of the connections statuses.
Check the content of /proc/net/ip_conntrack

> 
> Sorry, for these questions but I think it's fast answer for you.
> 
> 


