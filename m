From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dual WAN setup redux
Date: Wed, 1 Feb 2012 17:08:17 -0500
Message-ID: <201202011708.17672.dyioulos@onpointfc.com>
References: <201201271803.19071.dyioulos@onpointfc.com> <1328128504.1891.38.camel@andy-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1328128504.1891.38.camel@andy-laptop>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: "DiCecca, Caitlin" <cdicecca@onpointfc.com>

On Wednesday 01 February 2012 3:35:04 pm Andrew Beverley wrote:
> On Fri, 2012-01-27 at 18:03 -0500, Dimitri Yioulos wrote:
> > I want to use WAN2 for a new Web server and test server living in the
> > DMZ.
> >
> > I created a new routing table called WAN2.  Here's the output of "ip
> > route show table WAN2":
> >
> > 75.x.x.24/29 dev eth3  scope link  src 75.x.x.25
> > default via 75.x.x.30 dev eth3
>
> In which case you need to force traffic from/to your new webserver to
> use the routing table above.
>
> > 75.x.x.24   *               255.255.255.248 U         0 0          0 eth3
>
> This is saying any traffic for 75... should go via eth3.
>
> > 65.x.x.160  *               255.255.255.224 U         0 0          0 eth0
> > 10.8.0.0        vpn.mydomain.c 255.255.255.0   UG        0 0          0
> > eth2 192.168.1.0     *               255.255.255.0   U         0 0       
> >   0 eth2 192.168.100.0   *               255.255.252.0   U         0 0   
> >       0 eth1
>
> Likewise for these.
>
> > default         65.x.x.161. 0.0.0.0                UG        0 0         
> > 0 eth0
>
> And anything else should go via 65...
>
> So, at the moment, there's nothing making traffic use eth3, unless it
> happens to be on that same subnet.
>
> > The following are probably stupid noob questions, but here goes:
> >
> > I can ping the WAN2 gateway address from our firewall/router, but not
> > from any other network device (I can ping the gateway address of WAN1
> > just fine).
>
> See point above.
>
> >   Don't
> > I have to be able to do that first?
>
> Yes.
>
> > I'm not sure what internal ip addresses to give the new Web server and
> > test server (192.100.1.x, or 75.x.x.26-29.
>
> You could do either. If you've been issued with a 'spare' public IP
> address, then you might as well use that, as it saves SNAT.
>
> If you're not using 75.x.x.26-29 then you could use one of these. But
> you should not be assigning them all to eth3 as aliases (as per your
> diagram). You only need one there.
>
> In summary, if I understand your setup correctly, you should be able to
> assign *one* of your public IP addresses to eth3, and then assign
> another one to the web server, assuming they're all in the same subnet
> and you get the subnets correct.
>
> Once you've done that, as long as IP forwarding is enabled and you
> ACCEPT the packets in iptables then it should work.
>
> Andy
>
>
Andy,

Thanks for your efforts, especially as you're dealing with someone as dense as 
me.

On the test machine (call it box 3 in the diagram), I changed the ip to be 
75.x.x.28, netmask 255.255.255.248, network 75.x.x.24.  I set the gateway to be 
75.x.x.25 (eth3 address on the firewall/router).  I can't ping anything.

At this point, is it a firewall rule issue?  If so, what is/are the rule(s) I 
need to add?

If I had my choice, though, I'd rather assign an address of 192.168.1.x to the 
test machine (as with the rest of the devices in the DMZ), and make it use the 
WAN2 connection instead of WAN1 that the other devices are using.

Hope I'm not being too much of a pita here.

Dimitri





-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

