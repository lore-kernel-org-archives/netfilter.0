From: Larry LeBlanc <leblanc@inmotiontechnology.com>
Subject: Re: Masquerade does not forget connections when interface goes down
Date: Sun, 20 Mar 2005 16:51:04 -0800
Message-ID: <423E1A78.1080905@inmotiontechnology.com>
References: <42377DFD.1090901@inmotiontechnology.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42377DFD.1090901@inmotiontechnology.com>
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
To: Larry LeBlanc <leblanc@inmotiontechnology.com>
Cc: netfilter@lists.netfilter.org

Hello,

I have found that the problem described below is not restricted to ICMP 
protocol. Consider:


Client       ------------GW-----------  Internet            Server
             |                       |
10.0.0.2-------10.0.0.1-----a.b.c.d--------------------
             |            |          |                |
             |            |          |                ------p.q.r.s
             |            |          |                |
             |            --e.f.g.h--------------------
             |                       |
             -------------------------
 
In the test case, a.b.c.d and e.f.g.h are the addresses of two dial-up 
ppp network interfaces on a gateway that is masquerading the local 
10.0.0.0/24 network onto the internet. At the start of the scenario, 
a.b.c.d is the default route.
  - client 10.0.0.2 establishes a connection to server p.q.r.s
  - dial-up interface a.b.c.d goes down and the gateway updates the 
default route to be via e.f.g.h
  - client sends another packet to p.q.r.s
  - packet is transmitted out the e.f.g.h interface but with source ip 
address a.b.c.d
  - server tries to respond to a.b.c.d but of course cannot.
  - as long as the client continues to transmit packets, the connection 
entry in /proc/net/ip_conntrack is refreshed
  - if the client stops transmitting packets long enough for the 
ip_conntrack entry to expire, subsequent packets are transmitted with 
the correct source address e.f.g.h. Note that for some connections, 
"long enough" means > 100 hours.

I believe there are actually two problems here: since the ppp connection 
has gone down, all related connection entries in /proc/net_ip_conntrack 
should be deleted, shouldn't they? I suppose in some special cases you 
might want to keep them around if you know the interface is going to 
come back up with the same IP address, but I would think in most cases 
dial-up links are dynamically addressed and won't get the same IP.

Regardless of the above, Masqeurade should assign the source ip address 
of the network interface the packet is being routed through, creating a 
new ip_conntrack entry if necessary. Right?

I am using IPTables 1.2.10. I would be prepared to upgrade to 1.3.1 but 
nothing in the change notes suggests to me that this problem will be 
solved and I'd rather not upgrade for nothing. I've tried things like 
flushing iptables and re-defining the masquerade rules but this doesn't 
seem to help. Is there any command I can use to flush the ip_conntrack 
entries? Otherwise I guess I'll dive into the netfilter code and see if 
I can figure out what needs to be changed. Any tips would be appreciated...

Thanks,

Larry


Larry LeBlanc wrote:

> There was a thread on this subject last October that did not solicit 
> any real solution. Unfortunately my scenario is a little different 
> from the one described before and so their workaround doesn't work for 
> me. Here's the problem:
>
> My gateway has 2 dialup interfaces, ppp0 and ppp1. Let's say the IP 
> address for ppp0 is 1.2.3.4 and the address for ppp1 is 5.6.7.8. 
> Masquerading is turned on for both, but ppp1 is considered a backup so 
> the default route is set to transmit everything on ppp0. When it goes 
> down, the default route is switched to ppp1.
>
> One of my test cases is to have an internal client send continuous 
> ping's to an external address. These (as expected) get routed out ppp0 
> with source address 1.2.3.4. If ppp0 drops "in-between" pings, i.e. 
> after one reply is received but before the next one is sent, the next 
> ping will get routed out ppp1 with source address 5.6.7.8 and 
> everything is happy. On the other hand, if the failover occurs while 
> there is an outstanding ping response, subsequent pings will go out 
> ppp1 with source address 1.2.3.4 (and, of course, fail). The TTL on 
> the connection in /proc/net/ip_conntrack is reset to 30 seconds every 
> time a ping goes out, so the situation does not resolve itself. To fix 
> things you have to stop the ping client, wait 30 seconds for the 
> connection to expire, then start again.
>
> My understanding is that one of the main reasons to use Masquerade 
> instead of SNAT for dial-up connections is that connections are 
> "forgotten" when the connection goes down. This does not seem to be 
> the case, at least not for icmp packets. I am using iptables 1.2.10 
> and would consider upgrading but I see no mention of Masquerade 
> updates in 1.2.11 through 1.3.1 and I doubt that will fix my problem.
>
> In lieu of an actual fix, can anyone say with confidence that this 
> problem is isolated to icmp? I can probably live with ping failures in 
> this case but if the problem affects other protocols I will need a 
> fix. Also, is there any simple way to flush conntrack entries for 
> addresses which no longer exist? If so then I can flush anything 
> related to 1.2.3.4 when ppp0 goes down...
>
> Thanks,
>
> Larry
>
>
>
>
>



