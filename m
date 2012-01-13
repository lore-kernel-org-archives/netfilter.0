From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dual WAN set-up
Date: Fri, 13 Jan 2012 10:17:21 -0500
Message-ID: <201201131017.22019.dyioulos@onpointfc.com>
References: <201201121651.18887.dyioulos@onpointfc.com> <1326439545.2182.17.camel@andrew-desktop> <op.v700m6kzx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v700m6kzx1lyi3@debiandesk2.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 13 January 2012 9:17:20 am Lloyd Standish wrote:
> On Fri, 13 Jan 2012 01:25:45 -0600, Andrew Beverley 
<andy@andybev.com> wrote:
> > Using marks is one way to do this, and provides plenty of
> > flexibility. However, if all the traffic is coming from the
> > same IP address / interface, then you should be able to use
> > straight iproute2 rules to match those aspects, without even
> > touching iptables (see ip rule).
> >
> >> 	iptables -t mangle -A PREROUTING -m state --state NEW
> >> -s 10.x.x.x -j CONNMARK1
>
> That's a good point.  In my own firewall, at one point I wanted
> to avoid load-balancing for certain hosts (i.e., always route
> through a given interface for a certain source IP), and I was
> unable to use "ip rule" with no packet marking.  However, I
> think this is because all the hosts were internal LAN hosts
> using SNAT, and the NAT is done before the packet hits "ip
> rule."  Therefore "ip rule" could not match on the source IP. 
> But in Dimitri's case, since there is no NAT for the DMZ hosts,
> this should work fine, and is simpler.  The only reason to mark
> packets would be to allow the possibility of later routing some
> of the LAN hosts through the second interface.
>
> >Also, if you do decide to use netfilter marks (which is
> > certainly no bad thing IMHO), then you probably don't need to
> > mark connections and then restore them. Instead just mark a
> > packet straight away: iptables -t mangle -A PREROUTING -s
> > 10.x.x.x -j MARK --set-mark 1
>
> Another very good point for Dimitri, Andy, which should give
> better efficiency.  Connection marking is only necessary for
> load-balancing. I guess I am in a "load-balancing" mindset.
>
> --
> Lloyd
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


Lloyd,

Not to throw a proverbial wrench in the works, but in my case 
there is NAT for the DMZ hosts.

I have three NICs currently active on the fw (more are available): 
eth0 - WAN, eth1 - LAN, eth2 - DMZ.  In addition, eth0 has 
several aliases for the external addresses of the DMZ boxes.  
Then, NAT to internal addresses (10.x.x.x).

Hope I'm not muddying the waters but, rather, providing all of the 
info that you need to so kindly help me.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

