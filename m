From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: How to mirror traffic received on WAN interface *before* NAT?
Date: Sat, 03 Mar 2012 23:54:32 -0500
Message-ID: <1330836872.4671.200.camel@denise.theartistscloset.com>
References: <4F52EC29.9080607@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F52EC29.9080607@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org

On Sat, 2012-03-03 at 20:14 -0800, Jack Bates wrote:
> We run "ntop" on a computer connected to our router, for traffic 
> analysis: 
> http://jdbates.blogspot.com/2012/02/this-is-followup-to-this-post-on-how-to.html
> 
> We forward all traffic sent and received on our WAN interface to the 
> "ntop" computer with the following lines in /etc/firewall.user:
> 
> 
> > iptables -A PREROUTING -t mangle -i eth0.1 -j TEE --gateway 192.168.1.7
> > iptables -A POSTROUTING -t mangle -o eth0.1 -j TEE --gateway 192.168.1.7
> 
> 
> This works well, except that we also NAT traffic on our WAN interface. 
> We want to monitor traffic *before* NAT
> 
> Currently the source addresses of mirrored outgoing traffic are our 
> "private" addresses, e.g. 192.168.1.123, 192.168.1.234, etc. so these 
> rules happily mirror *outgoing* traffic before NAT
> 
> However the destination address of mirrored *incoming* traffic is our 
> "public" address. I guess I want to mirror incoming traffic after NAT, 
> so I tried "POSTROUTING" for incoming traffic:
> 
> 
> > iptables -A POSTROUTING -t mangle -i eth0.1 -j TEE --gateway 192.168.1.7
> > iptables -A POSTROUTING -t mangle -o eth0.1 -j TEE --gateway 192.168.1.7
> 
> 
>   - but I get the following error:
> 
> 
> > iptables v1.4.6: Can't use -i with POSTROUTING
> 
> 
> Any advice, how to improve these rules to monitor traffic *before* NAT? 
> so analysis of incoming and outgoing traffic consistently references our 
> "private" addresses associated with the traffic?
> 
> Any general advice concerning this setup?
<snip>
I wonder if using an IFB interface would be a better way to go.  You
would catch the traffic in the ingress queue which I believe will catch
it before NAT.  These are tc rather than iptables commands.  Off the top
of my head, it would be something like

modprobe ifb
ifconfig ifb0 up
tc qdisc add dev eth0 ingress
tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 match u8 0 0
action mirred egress redirect dev ifb0

You would then examine the traffic on ifb0.  I may not have remembered
the syntax exactly and you may need a flowid parameter on the filter
depending on your distribution.  Hope that helps - John

