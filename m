From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: DNAT seems to be working, but nothing goes out on the wire.
Date: Thu, 01 Jul 2010 08:40:51 +0200
Message-ID: <4C2C3873.70405@chello.at>
References: <2E25EA97-7A28-49D5-947A-F6ABEC235321@micasaverde.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2E25EA97-7A28-49D5-947A-F6ABEC235321@micasaverde.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Alfonso Ortega <alfonso@micasaverde.com>, netfilter@vger.kernel.org

On 01.07.2010 02:55, Alfonso Ortega wrote:
> Ok, I'm at a loss here. I've tried tutorials, IRC, forums, and now i'm turning to the iptables mailing list to see if I can find some kind of resolution.
>
> What I'm trying to do is to get iptables to act as a sort of transparent proxy using NAT and forward packets sent to the gateway(ip of 192.168.2.37) on port 5000 to another device on port 80.
>
>
> In my nat table, I have these chains defining the DNAT behavior:
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> prerouting_rule  all  --  anywhere             anywhere
> prerouting_wan  all  --  anywhere             anywhere
> Chain prerouting_rule (1 references)
> target     prot opt source               destination
> LOG        tcp  --  anywhere             anywhere            tcp dpt:5000 LOG level warning prefix `prerouting_rule hit: '
>
> Chain prerouting_wan (1 references)
> target     prot opt source               destination
> DNAT       tcp  --  anywhere             anywhere            multiport dports 5000 to:192.168.2.31:80
> DNAT       udp  --  anywhere             anywhere            multiport dports 5000 to:192.168.2.31:80
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> postrouting_rule  all  --  anywhere             anywhere
> LOG        all  --  anywhere             192.168.2.31        LOG level warning prefix `POSTROUTING: '
> ACCEPT     all  --  anywhere             anywhere

what is in 'postrouting_rule'?
anyway, you need to SNAT to the ip address of the gateway.
otherwise the server will reply directly to the client.
remove this last rule (what's the ACCEPT for in the nat table?) and add 
those:
iptables -t nat -A POSTROUTING -p tcp --dport 80 -d 192.168.2.31 -j SNAT 
--to-source 192.168.2.37
iptables -t nat -A POSTROUTING -p udp --dport 80 -d 192.168.2.31 -j SNAT 
--to-source 192.168.2.37


> in my filter table, I have these chains that the packet hits:
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> DROP       all  --  anywhere             anywhere            state INVALID
> ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
> forwarding_rule  all  --  anywhere             anywhere
> forwarding_wan  all  --  anywhere             anywhere
>
> Chain forwarding_rule (1 references)
> target     prot opt source               destination
>
> Chain forwarding_wan (1 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             192.168.2.31        LOG level warning prefix `forwarding_wan hit with: '
> ACCEPT     tcp  --  anywhere             192.168.2.31        tcp dpt:80
> ACCEPT     udp  --  anywhere             192.168.2.31        udp dpt:80
>

[...]

>
> Can anyone give me some sort of hint as to why the packets aren't actually getting sent out? Sorry if this is a lot of text, but it should be all of the relevant information ot the situation. If you need anything else, I can provide it.
>
> Thanks in advance,
> Alfonso--

Best regards

Mart
