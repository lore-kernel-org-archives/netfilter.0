From: Reed Wiedower <rwiedower@peyser.com>
Subject: RE: problem with FORWARD chain
Date: Fri, 10 Jan 2003 18:39:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <211E94403B74D211878A0008C71C74DC60DCD6@ip216-50-5-162.z5-50-216.customer.algx.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

(Forgot this info in last post!)

I'm running the 2.4.19 kernel on a debian box with the bridging/firewall
patch from bridging.sourceforge.net (version 0.0.7) and the latest version
of iptables.

A sample output from iptables -L -vx would be:

Chain INPUT (policy ACCEPT 20403 packets, 27177359 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 12188 packets, 786022 bytes)
    pkts      bytes target     prot opt in     out     source
destination

The few other people (who also don't get the FORWARD chain to properly show
the counters) are still able to activate and implement rules, although as
you can see, my policy should drop everything, and yet I'm still able to use
the bridge.

eol,

Reed


reed wiedower
reed.wiedower@peyser.com
peyser.com
202.638.3730x115



| -----Original Message-----
| From: Reed Wiedower 
| Sent: Friday, January 10, 2003 6:11 PM
| To: 'netfilter@lists.netfilter.org'
| Subject: problem with FORWARD chain
| 
| 
| I'm setting up a simple bridge firewall, and I've managed to get the
| bridging working properly. However, every time I attempt to create a
| firewall rule to prevent packets from traversing the FORWARD 
| chain, I notice
| that, at least according to "iptables -L -vX", no packets are 
| going across
| that particular chain. Any idea why this might be happening? 
| I can implement
| rules on both the INPUT and OUTPUT chains and they work as 
| expected, but for
| some reason nothing will display on the FORWARD chain.
| 
| The bridging folks seem to think that it's an issue with 
| iptables, not with
| the bridging code. Thanks in advance if anyone has seen this 
| or knows how to
| deal with it.
| 
| 
| eol,
| 
| Reed
| 
| 
| reed wiedower
| reed.wiedower@peyser.com
| peyser.com
| 202.638.3730x115
| 
| 

