From: "Andrew Smith" <nfml@k1k2.com>
Subject: RE: problem with FORWARD chain
Date: Sat, 11 Jan 2003 14:56:53 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1693.192.168.7.41.1042257413.squirrel@iw.k1k2.com>
References: <211E94403B74D211878A0008C71C74DC60DCD6@ip216-50-5-162.z5-50-216.customer.algx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <211E94403B74D211878A0008C71C74DC60DCD6@ip216-50-5-162.z5-50-216.customer.algx.net>
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
To: netfilter@lists.netfilter.org

> (Forgot this info in last post!)
> 
> I'm running the 2.4.19 kernel on a debian box with the
> bridging/firewall patch from bridging.sourceforge.net (version 0.0.7)
> and the latest version of iptables.
> 
> A sample output from iptables -L -vx would be:
> 
> Chain INPUT (policy ACCEPT 20403 packets, 27177359 bytes)
>    pkts      bytes target     prot opt in     out     source
> destination
> 
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>    pkts      bytes target     prot opt in     out     source
> destination
> 
> Chain OUTPUT (policy ACCEPT 12188 packets, 786022 bytes)
>    pkts      bytes target     prot opt in     out     source
> destination
> 
> The few other people (who also don't get the FORWARD chain to properly
> show the counters) are still able to activate and implement rules,
> although as you can see, my policy should drop everything, and yet I'm
> still able to use the bridge.
> 
> eol,
> 
> Reed

Guess suggestions:

1) the chain header only shows counts of packets that run off the
end of the chain - if for some reason there are rules in your tables
that you are not showing then that could account for it
2) you don't have forwarding enabled
3) something else in the kernel is getting the packets before iptables
(e.g. the bridging/firewall patch) and iptables doesn't get passed the
packets afterwards

OK - just guesses, but just a few suggestions anyway since noone has
said anything yet :-)

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


