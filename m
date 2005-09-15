From: lst_hoe01@kwsoft.de
Subject: Re: Performance issues
Date: Thu, 15 Sep 2005 14:53:00 +0200
Message-ID: <20050915145300.8oix2qhtqn7k084k@webmail.kwsoft.de>
References: <004c01c5b966$5386e7c0$94010a0a@commtech.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004c01c5b966$5386e7c0$94010a0a@commtech.ie>
Content-Disposition: inline
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

Zitat von Ferry van Aesch <tmp123@bavirtual.org>:

> Hi,

[-- snip --]

>
> Right now, I'm only using eth0 (the top one) and eth3 (the bottom 
> one). Eth1 and eth2 have no cables plugged in.
> eth0 has a PPPoE connection to an ISP (ADSL, 2mbit/128kbit, through a 
> Netopia router in bridge mode).
> On eth3 I have the rp-pppoe-server running, with a number of 
> pppoe-sessions hanging off that. It's connected to a 10mbit hub 
> (similar results with a 100mbit switch, 100baseTx-FD).
>
> Now, the problem description is quite simple:
> When I do a wget or ncftp or anything like that on the Linux machine, 
> for instance I download a kernel from ftp.kernel.org, I get some 
> 211KB/s. Nothing wrong with that for a 2mbit line.
> When I do a big transfer over eth3 (so an ftp from the linux machine 
> (server) to a windows machine (client) that is one of the 
> pppoe-clients on eth3), I can easily saturate the 10mbit hub, and I 
> get a good few megabit when using the switch. Again, nothing wrong 
> with that.
>
> Now for the problem. When I use one of those Windows clients to 
> download something from the Internet (simple NAT rule in the nat 
> table), I get a maximum of about 50KB/s. I can get it to go up to 
> some 90KB/s when I play around with the TCP receive window size in 
> the Windows registry, but a) that's still way too slow and b) I don't 
> want to mess around with Windows registries.
>
> When I force the transfers through a squid proxy on the Linux 
> machine, I get 211KB/s again. Two seperate TCP streams in other words.
>
> So, it seems that something is slowing things down a *lot* during the 
> NAT step.
>
> I've swapped out the hub for a 100mbit switch, to no avail. I've 
> assigned an IP to eth3 and a windows machine (to get the pppoe-server 
> out of the equation), but to no avail either. I do some HTB stuff on 
> the pppoe-connections, but with those disabled (so the standard 
> pfifo_fast re-instated), there's also zero in the difference.
>
> It doesn't look like the CPU is going mad over it either, an uptime 
> still shows 0.00 0.00 0.00, and the machine is very responsive, so I 
> don't think that I'm draining the resources either (not that you'd 
> expect that with only 2mbit...)
>
> I've gone back to a 2.4 kernel, but the results are the same.
>
> I'm a bit stumped really. I've set up numerous routers with 2.2 
> kernels (ipchains NAT though), with 3Com cards as well, and I've 
> never had any performance issues, even with full 100mbit transfers 
> through it.
>
> The NAT rule is nothing spectacular either:
> Chain POSTROUTING (policy ACCEPT 685 packets, 66775 bytes)
> pkts bytes target     prot opt in     out     source               
> destination
>  240 17774 SNAT       all  --  *      *       10.11.2.0/24         
> 0.0.0.0/0           to:xx.xx.xx.xx

 From what you explain i would guess for PMTU issues. Any chance that 
some other
rule (in FORWARD chain) is blocking ICMP on this device?

Regards

Andreas


