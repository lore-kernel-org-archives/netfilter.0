From: John Lister <john.lister@kickstone.com>
Subject: Re: Outbound traffic over two interfaces by port number
Date: Mon, 21 Jun 2010 14:45:24 +0100
Message-ID: <4C1F6CF4.8080706@kickstone.com>
References: <7628f5b45c96214fccdfcf03e8440ed2.squirrel@edders.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7628f5b45c96214fccdfcf03e8440ed2.squirrel@edders.homeip.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edwin van den Oosterkamp <edwin@vandenoosterkamp.com>
Cc: netfilter@vger.kernel.org

You might try looking at connection/packet marking.

You can use the MARK target and --set-mark to tag packets as they come 
in depending on other iptable rules (you might need to use CONNMARK to 
tag the associated conntrack tables with the mark for subsequent 
packets). Then create routing tables for each of the interfaces which 
have the correct routing information (including gateways, etc) for each 
interface. Finally set up routing rules using ip rule to check for the 
mark using the mark, (eg ip rule fwmark 1 table 1).

Hope that helps


John

Edwin van den Oosterkamp wrote:
> Hello All,
>
> The requirement I have is bit unusual and unfortunately I have not found
> any answers searching the archives and the Internet in general. I hope
> that if it is actually possible this knowledge will be with this list. I'm
> a programmer with quite a bit of experience on Linux kernel based systems,
> but fairly new to netfilter specifics.
>
> My system has two NICs (eth0 and eth1) and both are connected to different
> networks. One network is for handling data streams, the other solely for
> controlling. Both networks may have gateways, both networks may have
> overlapping IP address ranges. Luckily, there is only a handful of ports
> in use, which allows me to filter all the incoming packets and drop the
> wrong type of packet (data/control traffic) from the wrong type of
> interface (data/control interface). The system is not allowed to route
> between the two networks.
>
> The issue I'm having is that for outbound packets the kernel can select
> the "wrong" interface - e.g. control traffic will then go out on the
> data-only network (due to overlapping IP ranges or having two gateways for
> example). Can I use netfilter to force/redirect these packets so that they
> still go out on the "correct" interface, which in this case would be the
> control-network? I can see from the port number on which interface (data
> or control) the packet was supposed to go out and would like to use that
> information to ensure that the packet does go out on the correct network.
>
> I hope that I have been clear, if not then please let me know and will be
> more than happy to elaborate.
>
> Best regards,
>
> Edwin.
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
