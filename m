From: Bryan Harris <bryanlharris@me.com>
Subject: Re: Quick help with stateless firewall
Date: Sat, 15 Jun 2013 19:50:34 -0400
Message-ID: <1B23F515-30BA-44F2-B551-CC516837F419@me.com>
References: <51BCFB07.3060408@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <51BCFB07.3060408@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Flex <aflexzor@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I think you need this,

iptables -I INPUT -p icmp --icmp-type 8 -j ACCEPT

You can also do -j LOG to see what makes it to a certain place in the chain.

Bryan

On Jun 15, 2013, at 7:38 PM, Alex Flex <aflexzor@gmail.com> wrote:

> Hello,
> 
> I have the following simpel stateless firewall... the issue is iam not able to send ICMPs queries from within the machine. What could I modify or add for this to be able to happen .  Also iam only intending to run a HTTP service and DNS service is it fine the way it is?
> 
> Also, I intend to keep the script stateless not wanting to use conntrack at all.
> 
> Thanks
> Alex
> 
> 
> #!/bin/bash
> 
> /sbin/iptables -F
> /sbin/iptables -X
> 
> /sbin/iptables -P INPUT DROP
> /sbin/iptables -P FORWARD DROP
> /sbin/iptables -P OUTPUT ACCEPT
> 
> #Accept SSH
> /sbin/iptables -A INPUT -p tcp -m tcp -s 204.199.62.74 --dport 22 -j ACCEPT
> 
> /sbin/iptables -A INPUT -p tcp --dport 1000:65535 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> /sbin/iptables -A INPUT -p udp --dport 53 -j ACCEPT
> /sbin/iptables -A INPUT -p tcp --dport 53 -j ACCEPT
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
