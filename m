From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: SIP 5060 traffic
Date: Tue, 31 May 2011 08:39:18 -0700
Message-ID: <4DE50BA6.3030609@arpa.org>
References: <20110531090945.M97668@kdtc.net>
Reply-To: erik-lists@arpa.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110531090945.M97668@kdtc.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cc <cc@kdtc.net>
Cc: netfilter@vger.kernel.org

For proper nat of SIP/RTP traffic, you'll probably need to load the 
ip_conntrack_sip (now nf_conntrack_sip) and ip_nat_sip (nf_nat_sip) 
modules, as well as have the following rules at the top of your INPUT 
and FORWARD chains to permit all traffic related to tracked SIP sessions:

$ipt -I INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
$ipt -I FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

The SIP conntrack module will track sessions on 5060/udp and enable 
related return and RTP traffic through the firewall.  the SIP nat module 
should properly translate the addresses/ports in the SIP headers as they 
traverse the firewall, based on how the packets get forwarded.

On 05/31/2011 02:17 AM, cc wrote:
> Hi,
>
> I have a LAN NET  and a DMZ NET.  I have a SIP phone within the LAN
> trying to connect to a proxy at an external site, say A.
>
> Can someone point out if I'm missing anything?
>
> Rules:
>
> $IPT -A FORWARD -o $INET_ETH -p udp --dport 5060 -j ACCEPT
> $IPT -t nat -A POSTROUTING -o $INET_ETH -p udp --dport 5060 \
>               -j SNAT --to-source $INET_IP
>
> When I do a tcpdump, I can see traffic from the LAN go through my
> bastion Firewall that routes to my external-facing firewall.
> But there is no traffic coming back from the outside.
>
> 17:05:19.831000 IP (tos 0x0, ttl 127, id 1595, offset 0, flags [none], proto:
> UDP (17), length: 367) LAN_IP.5060>  A_SITE.5060: SIP, length: 339
>
> There's no corresponding entry that has traffic going the other way:
> i.e.:
>
> IP (tos 0x0, ttl 127, id 1595, offset 0, flags [none], proto: UDP (17),
> length: 367) A_SITE.5060>  LAN_IP.5060: SIP, length: 339
>
> I'm a bit confused.  Any clarifications appreciated.
>
> Thanks
>
> Ed
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Erik Schorr KD6AUT
Advocate and Consultant
VMware/Iptables/Exim/Perl
