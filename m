From: "Ellad G. Yatsko" <eyatsko@ngs.ru>
Subject: Re: Iptables NAT with two external Interfaces
Date: Thu, 03 May 2012 18:46:37 +0400
Message-ID: <4FA29A4D.4050606@ngs.ru>
References: <4FA24C69.4000607@ngs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FA24C69.4000607@ngs.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is anybody here? Does anybody hear me? :-) Did I break some rules if 
nobody answered,
or was my question (or English) very difficult for understanding?  
Excuse me please if I wrong!

Kind regards,
Ellad

> Hello!
>
> May you help me in one very specific issue?
>
> - I have Ubuntu router with several interfaces with Quagga/BGP working 
> on it, and of course IPTables with NAT for internal users;
>
> - One interface is used to connect to ISP, it has ISP's IP-address. 
> For definiteness it is 89.222.233.165. Ubuntu connects to ISP's 
> network via this IP;
>
> - Another interface - DMZ with own IP-address (delegated by RIPE NCC) 
> of own Autonomous System: 91.223.181.1;
>
> - DMZ is terminated on Cisco 2821 (one subinterface 91.223.181.2)  
> which is connected to second ISP (via second subinterface with IP from 
> second ISP: 188.35.132.79).
>
> - There is specific routing: each of my "borders" marks a part of 
> prefixes received from corresponding ISP by higher LocalPref: Ubuntu 
> marks prefixes 0.0.0.0-127.0.0.0, and Cisco marks prefixes 128.0.0.0 
> up to 224.0.0.0.
> That is if destination IP is more than 128.0.0.0 Ubuntu prefers to 
> send the current packet to directly connected ISP, if it is less than 
> 128.0.0.0 Ubuntu prefers  to route the packet through DMZ. It is made 
> to utilize both uplinks evenly.
> I need to explain one important detail: both of my ISPs are connected 
> to the same higher-level ISP, which uses the only ISP from the pair of 
> mine to direct incoming traffic into my AS. So there is no other 
> opportunity to make balancing except egress traffic.
>
> - Ubuntu has internal interfaces to give to its internal users access 
> to Internet. Internal users have "private" IPs which are "NATted" on 
> external Ubuntu's interfaces.
>
> - Actually the question: with probability 50% a packet from internal 
> users can be sent through one external Ubuntu's interface and reply 
> can return through another. In that case NAT is not working. Here my 
> relevant part of configuration:
> $IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $INTERNAL -d $EXTERNAL 
> -j SNAT --to $DMZ_IP
> $IPTABLES -t nat -A POSTROUTING -o $DMZ_IF -s $INTERNAL -d $EXTERNAL 
> -j SNAT --to $DMZ_IP
>
> What can I do except:
> $IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $INTERNAL -d $EXTERNAL 
> -j SNAT --to $EXT_IP
> $IPTABLES -t nat -A POSTROUTING -o $DMZ_IF -s $INTERNAL -d $EXTERNAL 
> -j SNAT --to $DMZ_IP
>
> Difference with above two is "$EXT_IP" in the first line. In that case 
> all works fine. But I need to hide ISP's IP from External World. I 
> need to show to others my own IPs only. It's the highest priority. 
> Again, may you help me to find an answer? Are there some "secret 
> commands" for IPTables to make NAT to ignore ingress interface to 
> de-NAT replies? For example, FreeBSD's PF can do correct "back" 
> translations independently from interface where reply-packet has come 
> on. Ubuntu has changed FreeBSD on the place of central router due to 
> rank of reasons (one of them is stability), but now I have big 
> trouble! :-)
>
> He-e-e-lp!...
>
> Kind regards,
> Ellad
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

