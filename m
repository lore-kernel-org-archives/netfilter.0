From: Jason Opperisano <opie@817west.com>
Subject: Re: Forwarding non local packets to loopback with iptables?
Date: Tue, 07 Sep 2004 20:35:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094603729.1751.34.camel@wolfpack.ljm.dom>
References: <20040907114859.GA13315@scholars.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040907114859.GA13315@scholars.home>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-07 at 07:49, Mark Ord wrote:
> Setup:
>    NAT + Firewall - Debian, 2.4.18 kernel, iptables v1.2.6a
>    eth0 - 10.0.x.x        - wireless broadband VPN connection
>    eth1 - 192.168.0.1     - Local network
>    ppp0 - server assigned - Internet connection via VPN established via
>                             eth0 - though, fairly irrelivent.
>    eth1:1 - 192.168.0.128 - Local network alias
>    eth1:2 - 192.168.0.129 - Local network alias
>       .. etc ..
> 
> What I want to do is set up a SSH tunnel to another machine, behind
> another firewall, and use the eth1 aliases to access the remote machines from my
> local network (eth1) and the iptables machine. I tried to set this up
> before with iptables, failed, 

can we revisit why that failed, perhaps?

> found discovered rinetd, and have been using
> that since successfully. However, I'd like to use an iptables solution,
> because I think it'll be cleaner (can't easily ifup/ifdown the eth1 aliases
> when using rinetd), plus I'm plain interested in if/how to do an iptables
> solution.

k--see above.

> The main catch here is that I'm not using GatewayPorts for the ssh port
> forwarding. Firstly because binding the forwards to the loopback seems
> slightly more secure, and secondly because the ports I forward to on the
> remote machines are the same - using GatewayPorts binds to all available
> interfaces. Hence I do the ssh port forwards, binding to different
> ports on the loopback on the local end of the ssh tunnel, and then map
> the default service ports on the eth1 aliases to the appropriate port on
> the loopback ie:
> 
> rinetd.conf:
> 
>    192.168.0.128   3389      127.0.0.1       13389 # rdc
>    192.168.0.129   3389      127.0.0.1       23389 # rdc
>    192.168.0.130   3389      127.0.0.1       33389 # rdc
> 
> Connections to 192.168.0.128:3389 redirect to localhost:13389, which connects
> via the ssh tunnel to port 3389 on the remote host.
> 
> Last time I tried to establish this with iptables, I got nowhere. This time
> around I got it working on the iptables machine with:
> 
> $IPTABLES -t nat -I OUTPUT -p tcp -s 192.168.0.128 --dport 3389 \
>         -j DNAT --to 127.0.0.1:13389
>    .. etc .. for each address and port required.
> 
> Connecting to 129.168.0.128 port 3389 takes me where I want - down the
> ssh tunnel, to machine on the remote network.

this isn't exactly a great test scenario, as you're testing locally on
the box itself, which will not cleanly extrapolate to the forwarding
scenario.

> However, no matter what I try, I can't get connections from other machines
> on the 192.168.0.0/24 network to work. I've tried to several combinations
> of using PREROUTING, POSTROUTING and OUTPUT chains, with no luck.
> In particular, I've tried to model it on a rule that works:
> 
>     iptables -t nat -I PREROUTING -p tcp -d 192.168.0.128 --dport 3389 \
>          -j DNAT --to x.x.x.x:3389
>     (where x.x.x.x is a host on the internet.)
> 
> with:
> 
>     iptables -t nat -I PREROUTING -p tcp -d 192.168.0.128 --dport 3389 \
>          -j DNAT --to 127.0.0.1:3389
> 
> which doesn't work, to which I can only conclude that you can't dnat to
> 127.0.0.1.

nope--you sure can't. 

> Is it possible to achieve this with iptables (redirecting traffic coming in
> on eth1 (for eth1:?) to a port on 127.0.0.1), and if so, what rules are
> required?

no.  but since you have dedicated IP addresses per host--why aren't you
just DNAT-ing from the IP on eth1 directly to the host that should
receive the traffic (i believe this is the "previously failed"
scenario)?

-j

-- 
Jason Opperisano <opie@817west.com>


