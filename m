From: Larry LeBlanc <leblanc@inmotiontechnology.com>
Subject: Masquerade does not forget connections when interface goes down
Date: Tue, 15 Mar 2005 16:29:49 -0800
Message-ID: <42377DFD.1090901@inmotiontechnology.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

There was a thread on this subject last October that did not solicit any 
real solution. Unfortunately my scenario is a little different from the 
one described before and so their workaround doesn't work for me. Here's 
the problem:

My gateway has 2 dialup interfaces, ppp0 and ppp1. Let's say the IP 
address for ppp0 is 1.2.3.4 and the address for ppp1 is 5.6.7.8. 
Masquerading is turned on for both, but ppp1 is considered a backup so 
the default route is set to transmit everything on ppp0. When it goes 
down, the default route is switched to ppp1.

One of my test cases is to have an internal client send continuous 
ping's to an external address. These (as expected) get routed out ppp0 
with source address 1.2.3.4. If ppp0 drops "in-between" pings, i.e. 
after one reply is received but before the next one is sent, the next 
ping will get routed out ppp1 with source address 5.6.7.8 and everything 
is happy. On the other hand, if the failover occurs while there is an 
outstanding ping response, subsequent pings will go out ppp1 with source 
address 1.2.3.4 (and, of course, fail). The TTL on the connection in 
/proc/net/ip_conntrack is reset to 30 seconds every time a ping goes 
out, so the situation does not resolve itself. To fix things you have to 
stop the ping client, wait 30 seconds for the connection to expire, then 
start again.

My understanding is that one of the main reasons to use Masquerade 
instead of SNAT for dial-up connections is that connections are 
"forgotten" when the connection goes down. This does not seem to be the 
case, at least not for icmp packets. I am using iptables 1.2.10 and 
would consider upgrading but I see no mention of Masquerade updates in 
1.2.11 through 1.3.1 and I doubt that will fix my problem.

In lieu of an actual fix, can anyone say with confidence that this 
problem is isolated to icmp? I can probably live with ping failures in 
this case but if the problem affects other protocols I will need a fix. 
Also, is there any simple way to flush conntrack entries for addresses 
which no longer exist? If so then I can flush anything related to 
1.2.3.4 when ppp0 goes down...

Thanks,

Larry




