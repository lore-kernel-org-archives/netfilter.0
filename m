From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Yet another local nat/port redirecting question
Date: Wed, 25 Apr 2007 07:50:25 +0200
Message-ID: <462EEC21.5020306@rtij.nl>
References: <200704241701.28038.henrik@netgate.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704241701.28038.henrik@netgate.net>
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
To: Henrik Martin <henrik@netgate.net>
Cc: netfilter@lists.netfilter.org

Henrik Martin wrote:
> All I want to do is run my web server as an ordinary user and having
> it bind to port 8080 and then have my firewall redirect traffic from
> port 80 to 8080.  I have a firewall running on the local machine and I
> only let through ports 80, 443, and SSH. I'm using the SuSEFirewall
> utilities to create this.  At first, I tried setting the REDIRECT
> variable in SuSE's own firewall to do the port forwarding, but
> couldn't get it to work. So I've basically pared it down to where I've
> disabled the SuSE firewall, and I'm just doing the following on the
> command line:
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
> iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 8080
>   

The output rule will never be hit, the packet is already redirected by 
the predirect rule. You don't need that second rule.
> If I log into an external machine and try to telnet to my web server's
> port, I can see the PREROUTING chain's packet counter increase, but 
> not the OUTPUT. I'm not able to connect.
>   

So this is expected.

> # iptables --list -n -t nat -v
> Chain PREROUTING (policy ACCEPT 140K packets, 42M bytes)
>  pkts bytes target     prot opt in     out     source               destination 
>     3   180 REDIRECT   tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:80 redir ports 8080
>
> Chain POSTROUTING (policy ACCEPT 140K packets, 42M bytes)
>  pkts bytes target     prot opt in     out     source               destination 
>
> Chain OUTPUT (policy ACCEPT 763 packets, 56801 bytes)
>  pkts bytes target     prot opt in     out     source               destination 
>     0     0 REDIRECT   tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:80 redir ports 8080
>
>
> What am I doing wrong? Is this a bug, or is it the way I'm configuring
> the firewall?
>   

This should work. It works for me, I use redirects quite frequently. The 
only thing I can think of is that the webserver listens on a specific IP 
and you try to connect to another.

HTH,
M4



