From: "Caracal - G. Hostettler" <100112_2660@bluewin.ch>
Subject: Re: port forwarding with one interface to trace traffic?
Date: Wed, 21 Jan 2004 17:16:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00bb01c3e039$ed0b6310$017ca8c0@lucens.caracal.ch>
References: <400E9EB3.4070309@triad.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Rasca <rasca-ml@triad.de>
Cc: netfilter list <netfilter@lists.netfilter.org>

Just one silly question:

Do you have a "1" in /proc/sys/net/ipv4/ip_forward ?
If a zero, nothing will go through.

BTW, I never used such a config with only on interface.

I am *not* a guru, but having a mask of /32 instead of /24 seems strange to
me.
What is the mask on your printer and on your Mc ?

GH

----- Original Message ----- 
From: "Rasca" <rasca-ml@triad.de>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 21, 2004 4:45 PM
Subject: port forwarding with one interface to trace traffic?


> Hi IP-gurus,
>
> I want to setup a specific port forwarding to trace the
> ip traffic between a macos9 and a hp net printer to debug
> a spooler problem.
>
> I thought the port forwarding feature of linux/iptables
> would be nice to do that. But until now I wasn't able
> to get it running ;-(
>
> May be some one can help here. The setup is quite simple.
>
> * one class C net (192.168.10.0)
> * a linux box with one interface (eth0), kernel 2.4.24
>    and iptables 1.2.9 (192.168.10.156
>
> * macos9 machine with 9.2.x (192.168.10...)
>
> * HP laser printer with network interface (192.168.10.9)
>
> I want to configure the Mac to print to the linux box.
> The linux box should do port forwarding to the hp printer.
> So I can use "ethereal" or what ever to dump the traffic.
>
> Because it's not a firewall all chains have as default
> "accept".
>
> I added the following rule (which seems not to be enough,
> cause the printing freezes):
>
> iptables -t nat -A PREROUTING -p tcp --dport 515 \
> -d 192.168.10.156/32 -j DNAT --to-dest 192.168.10.9:515
>
> Any ideas?
>
> thx + cu
>   rasca
>
>
> -- 
> _______________________________________________________________
> | Triad Berlin Projektgesellschaft mbH | http://www.triad.de/ |
>
>


