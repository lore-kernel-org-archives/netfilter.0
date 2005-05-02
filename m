From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Mon, 02 May 2005 15:03:46 -0500
Message-ID: <427687A2.7040501@riverviewtech.net>
References: <200505021350.32836.dcinege-mlists@psychosis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505021350.32836.dcinege-mlists@psychosis.com>
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

> Local net
>     eth0: 192.168.1.1 - net/mask 192.168.1.0/24
> Configuration network (special type of network in my appliance)
>     eth1: 172.27.1.2 - net/mask 172.27.0.0/30
> 
> The configuration network Masq's:
> /sbin/iptables -t nat -I POSTROUTING -o eth1 -d 172.27.0.2/255.255.255.252 \
>   -j SNAT --to-source 172.27.0.2

I'm going to presume that the different subnet's from your eth1 and your iptables rule 172.27.1.0/30 vs 172.27.0.0/30 was a typo.

> The SNAT to configration networks is to simplify life, as we don't have to 
> deal with playing with routes back to the local network in the external 
> devices, (wifi bridges, satellite terminals, etc)
> 
> And we normally browse to these devices via IP not hostname.
> 
> So to clarify my situtation:
>  Depending on what mood Windows is in, browering from a 192.168.1.0/24 host to 
> 172.27.1.1 (linksys bridge in this case) or browsing to 192.168.1.1 (the 
> appliance itself, running Zope) will become ungodly slow. SOMETIMES it is 
> just fine.

I'm not sure what to say.  I'm at a loss as to what might be causing problems.  At this point I would start sniffing as much traffic as I could on all the networks going in and out of devices that you are working with.  What you are trying to do looks reasonable to me.  I don't see any inherent flaws in what you are trying to do.  But that is just my eyes, see what the rest of the list has to say.

> I am also seeing zope deadlock, which I now believe is related to this 
> performance problem. When zope locks all other processes are fine, and the 
> box pings. 
> 
> To expand further on the zope issue:
> A few months ago I was remotly ssh'ed in to an appliance with my partner on 
> site. Zope had locked. I restarted the process. He connected a few times and 
> it locked again. I could not get a head reply back when it locked. 
>    (telnet 127.0.0.1 < HEAD / HTTP/1.0)
> We restarted it a dozen times with the same thing. It did not stop locking 
> until we rebooted the machine. All of this was via SSL. 
> 
> It was at this point I figured it was SSL in zope. I turned off SSL access. 
> Seemed to help but now we're seeing locking, though maybe less frequently. 
> I was wondering if it was hardware, IRQ, etc. all but ruled that out. As I 
> mentioned, I just saw everything run perfectly with my laptop, then I plug 
> the XP machine in, and it dies.

I'd be willing to bet that there is an underlying issue that is messing with things that is causing the SSL slowdown as well as the newly occurring non-SSL slowdown.  What that underlying issue is I have no clue though.

> If you can't tell this is really driving us crazy. I've got the simplest of 
> networks configs, barely any traffic, and it's running like shit with 
> direclty attached hosts. 

I bet.  I wish that I could be more help, but alas I can not.



Grant. . . .

