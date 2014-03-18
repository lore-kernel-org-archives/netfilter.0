From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Rewrite destination IP
Date: Tue, 18 Mar 2014 09:51:08 +0530
Message-ID: <5327C9B4.1050601@atc.tcs.com>
References: <zarafa.5326df90.0b5a.15412cab2d2a09ca@detroit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <zarafa.5326df90.0b5a.15412cab2d2a09ca@detroit>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bram van den Hout <bram@legno.nl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 03/17/2014 05:12 PM, Bram van den Hout wrote:
> Hi,
>
> Is it possible to change the destination IP address of an incoming packet and have a local running server proces on application layer answer to the changed IP address ?
>
> To be more clear. I have a hosting software suite that is configured to run on a registered public IP address (a.b.c.d).
> The actual server is behind a firewall and has a private IP address. I have configured a virtual interface with the public IP address a.b.c.d.
>
> eth0      Link encap:Ethernet  HWaddr 00:0c:29:f5:10:9f
>            inet addr:192.168.100.11  Bcast:192.168.100.255  Mask:255.255.255.0
>
> eth0:0    Link encap:Ethernet  HWaddr 00:0c:29:f5:10:9f
>            inet addr:a.b.c.d  Bcast:a.b.c.d  Mask:255.255.255.255
>
> Incoming packets have destination IP : 192.168.100.11.
> I would like to change the destination to a.b.c.d and have for instance a webserver listening on a.b.c.d:80 and with directive <virtualhost a.b.c.d:80> answer to that request.
>
> I have tried :
>
> iptables -t nat -A PREROUTING -i eth0 -d 192.168.100.11 -j NETMAP --to a.b.c.d/32
>
> When checking the result of this command with tcpdump, I don't see any translation.

Better, try to log the packets and see whether the translation happened 
or not. Add the following rule,

     iptables -I INPUT -d a.b.c.d -j LOG --log-prefix "[netfilter] "

Then ping 192.168.100.11 from another node. Now the log 
(/var/log/messages or other custom log file) should have the 
corresponding entries, if the translation happened properly. I just 
tested now.


Regards,
Vignesh

>
> What am I missing ?
>
> Thank you very much for your response !
>
> Cheers,
>
> Bram
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

