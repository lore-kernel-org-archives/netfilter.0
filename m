From: Marek Dohojda <mdohojda@cisco.com>
Subject: Re: Please help...
Date: Mon, 28 Jun 2004 15:18:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E09927.4000101@cisco.com>
References: <FC8C43AB-C94D-11D8-9C38-000A95AD0230@mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FC8C43AB-C94D-11D8-9C38-000A95AD0230@mac.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sam Loy <sampaw@mac.com>
Cc: netfilter@lists.netfilter.org

well 0/0 is exactly right. that just means the whole internet.

What are your other chains setup as?

Sam Loy wrote:
> If I sound a little frustrated, keep in mind I'm now on week 2 of my 
> attempt to setup linux as a firewall router on my home network. I have 
> installed 3 different versions of linux, read hundreds of pages, tried 
> at least 5 different configurations 20 times each....but still I cannot 
> seem to share my dsl connection with my other machines.
> 
> I have 2 NICs in a Linux 9 installation. One card connects to my lan 
> with a static ip of 192.168.1.1. The other connects to my DSL provider 
> which dynamically allocates the ip.
> 
> I did this:
> 
> modprobe iptable_nat
> 
> # In the NAT table (-t nat), Append a rule (-A) after routing
> # (POSTROUTING) for all packets going out ppp0 (-o ppp0) which says to
> # MASQUERADE the connection (-j MASQUERADE).
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> 
> # Turn on IP forwarding
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> 
> It does not work.  When I do a iptables -t nat  -n -L
> It displays:
> 
> MASQUERADE all -- 0.0.0.0/0         0.0.0.0/0
> 
> once for each time I've executed the above command. (now 7 times). I'm 
> sorry, but this doesn't seem right. 0 to 0? don't think so. So I try 
> different -o values - but always get the same.
> 
> Don't get it - Do I need to manually add a route? Completely befuttled 
> and ready to throw in the towell.
> 
> Sam
> 
> 
> 

