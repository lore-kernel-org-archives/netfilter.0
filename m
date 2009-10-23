From: =?ISO-8859-1?Q?Vlado_Drz=28=EDk?= <vlado@ttx.sk>
Subject: Re: access to terminal server in DMZ with 2 isp
Date: Fri, 23 Oct 2009 12:22:31 +0200
Message-ID: <4AE183E7.7010300@ttx.sk>
References: <000301ca51ac$5efe4f70$7600a8c0@VALFREDO>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000301ca51ac$5efe4f70$7600a8c0@VALFREDO>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: alfredo <asa@euroval.com>
Cc: netfilter@vger.kernel.org

Hi,

It's definitely a routing problem as you see and you have probably
noticed it already..

You are using fwmark to send packets to your spacial tables but it seems
that your local network is missing inside neo and ono tables.

Please verify the by:
ip route show table ono
ip route show table neo

>                # neo
>                IP1="213.172.XXXX"
>                P1_NET="213.172.XXXX/29"
>                P1="213.172.XXXX"
>                IF1="eth1"
> 
>                # ono
>                IP2="84.124.XXXXX"
>                P2_NET="84.124.87.224/29"
>                P2="84.124.XXXX"
>                IF2="eth2"
>                IP0="192.168.0.249"
>                P0_NET="192.168.0.0/24"
>                #P0=
>                IF2="eth0"
                 ^^^^^^^^^^
Seems like typo should be IF0="eth0"

> 
>                ip route add $P2_NET dev $IF2 src $IP2 table ono
>                ip route add default via $P2 table ono
>                ip route add $P1_NET dev $IF1 src $IP1 table neo
>                ip route add default via $P1 table neo
>                ip route add $P1_NET dev $IF1 src $IP1
>                ip route add $P2_NET dev $IF2 src $IP2
>                ip route add default via $P1
>                ip route add $P0_NET     dev $IF0 table neo
>                ip route add $P2_NET     dev $IF2 table neo
>                ip route add 127.0.0.0/8 dev lo   table neo
>                ip route add $P0_NET     dev $IF0 table ono
>                ip route add $P1_NET     dev $IF1 table ono
>                ip route add 127.0.0.0/8 dev lo   table ono
> 
> 
>                ip rule add fwmark 2 table ono
>                ip rule add fwmark 1 table neo
>                ip rule add from $IP2 table ono
>                ip rule add from $IP1 table neo
>                # -----------
> 
> When I try to connect from outside to each of my isps, for example ono,
> I see packets entering eth2 and then
> going out eth2 immediately without being routed to eth0.
> I see dnat has changed the destination ip so packets go out eth2 having
> the source ip from which I'm connecting from (not the ip of the
> 

Everything else seems to be correct to me..


Regarsd,
Vlado
