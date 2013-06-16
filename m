From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Quick help with stateless firewall
Date: Sat, 15 Jun 2013 21:17:08 -0400
Message-ID: <201306152117.09121.neal.p.murphy@alum.wpi.edu>
References: <51BCFB07.3060408@gmail.com> <1B23F515-30BA-44F2-B551-CC516837F419@me.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1B23F515-30BA-44F2-B551-CC516837F419@me.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

IPv4 doesn't work very well without ICMP; generally, one should always accept 
it, in and out. However, it's OK to drop icmp-type=8 (ECHO requests) on input 
from non-local sources when the system should not respond to pings from 
others.

On Saturday, June 15, 2013 07:50:34 PM Bryan Harris wrote:
> I think you need this,
> 
> iptables -I INPUT -p icmp --icmp-type 8 -j ACCEPT
> 
> You can also do -j LOG to see what makes it to a certain place in the
> chain.
> 
> Bryan
> 
> On Jun 15, 2013, at 7:38 PM, Alex Flex <aflexzor@gmail.com> wrote:
> > Hello,
> > 
> > I have the following simpel stateless firewall... the issue is iam not
> > able to send ICMPs queries from within the machine. What could I modify
> > or add for this to be able to happen .  Also iam only intending to run a
> > HTTP service and DNS service is it fine the way it is?
> > 
> > Also, I intend to keep the script stateless not wanting to use conntrack
> > at all.
> > 
> > Thanks
> > Alex
> > 
> > 
> > #!/bin/bash
> > 
> > /sbin/iptables -F
> > /sbin/iptables -X
> > 
> > /sbin/iptables -P INPUT DROP
> > /sbin/iptables -P FORWARD DROP
> > /sbin/iptables -P OUTPUT ACCEPT
> > 
> > #Accept SSH
> > /sbin/iptables -A INPUT -p tcp -m tcp -s 204.199.62.74 --dport 22 -j
> > ACCEPT
> > 
> > /sbin/iptables -A INPUT -p tcp --dport 1000:65535 -j ACCEPT
> > /sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> > /sbin/iptables -A INPUT -p udp --dport 53 -j ACCEPT
> > /sbin/iptables -A INPUT -p tcp --dport 53 -j ACCEPT
> > 
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
