From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Running iptables behind router
Date: Tue, 24 Feb 2004 09:13:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402240913.25473.JALaramie@Loudoun-Fairfax.com>
References: <20040216235513.GA1219@room101> <632269680.20040217093907@attla.net.ar> <20040224001308.GA10127@zaklinux.zakarun>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040224001308.GA10127@zaklinux.zakarun>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 23 February 2004 19:13, Kean Pedersen wrote:
> Okay... I have tried the solutions, but still can't connect from
> 192.168.2 to 192.168.1
>
> I can connect fine to 192.168.1.3 (the ip of eth0 on NAT box) from
> 192.168.2.101 (the only machine apart from the NAT box on .2 network).
>
> My network right now is:
>
> Hardware router(192.168.1.1), the only access to Internet.
> Desktop (192.168.1.42)
> Server/NAT box (eth0:192.168.1.3 and eth1:192.168.2.1)
> Laptop (192.168.2.101)
>
> The hardware router, desktop and server:eth0 are on one switch, while
> laptop and server:eth1 are on another switch.
>
> Info from the server:
> # uname -a
> Linux luftguitar 2.4.25 #1 man feb 23 23:45:36 CET 2004 i586 GNU/Linux
>
> # iptables -V
> iptables v1.2.9
>
> # iptables -t nat -L -v; iptables -L -v
> Chain PREROUTING (policy ACCEPT 603 packets, 52677 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>
> Chain POSTROUTING (policy ACCEPT 630 packets, 49138 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination 2    84 MASQUERADE  all  --  any    any     192.168.2.0/24     
>  anywhere
>
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>
> Chain INPUT (policy ACCEPT 48705 packets, 4302K bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>
> Chain FORWARD (policy DROP 97 packets, 8120 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination 4   336 LOG        all  --  any    any     anywhere            
> anywhere            LOG level warning 2   168 ACCEPT     all  --  any   
> any     192.168.2.0/24       anywhere

You are only allowing forwarding from the 192.168.2.x subnet. You need to add 
another rule like this for the 192.168.1.x subnet so it can reply/connect to 
192.168.2.x.

Jeff

