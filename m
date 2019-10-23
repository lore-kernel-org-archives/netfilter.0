From: zrm <zrm@trustiosity.com>
Subject: Re: understanding my MASQURADING and SNAT problem
Date: Wed, 23 Oct 2019 16:46:36 -0400
Message-ID: <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com>
References: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1571863598; bh=2n2ng5D14I/1L3WqIDL0eiQ4RWKyY6GHONua7cPuOyo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=e4I2DEvxNVwB0equTXA/SV2S9ZT89DgEJ9ATa64TI4Pky4cs2XWfFcYbojuf2rLCX
         QuDcfFKfx8P7oIVScW6bUGl/Qbl/qF3ySi48fEDnHwa+bJP7Gf20WKI19j4YUb3Udv
         6R08kwqhSOVNdzNoo1tpzlGCsznGfXsOh1vKD4pg=
In-Reply-To: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Aaron Gray <aaronngray.lists@gmail.com>, netfilter@vger.kernel.org

On 10/23/19 15:52, Aaron Gray wrote:
> I am trying to provide a gateway for firewalling Windows.
> 
> I have two ethernet ports :-
> 
>      enp4s0 which is external onto another router onto the internet on 
> 192.168.1.0/8 <http://192.168.1.0/8>
>      enp5s5: which is my internal Windows network.
> 
> I have the following rule working :-
> 
>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
> <http://192.0.1.0/8> -o enp4s0 -j MASQUERADE
> 
> Why do we need the '! d 192.0.1.0/8 <http://192.0.1.0/8>' this doesn not 
> seem to make any sense ?

It's incorrect. At least the subnet mask is wrong, for 192.0.1.0 it 
would have to be no more than a /24, not a /8. Also, it's probably meant 
to be 192.168.1.0 rather than 192.0.1.0.

I imagine the intended purpose is to not translate the source address 
when the destination is on the local network, but that only works if 
you've configured the outside router to send packets for the inside 
subnet to the outside address of the inside gateway. And if that's the 
case you probably shouldn't have the inside gateway doing NAT at all and 
just let the outside gateway handle it to the internet. If it's not the 
case then you'll need to translate everything regardless of the 
destination, if you expect it to be able to receive a response.

> I am trying to just allow ports 53 DNS and 443 HTTPS to be allow 
> through, so I tried :-
> 
>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
> <http://192.0.1.0/8> -p tcp --dport 53 -o enp4s0 -j MASQUERADE
>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
> <http://192.0.1.0/8> -p udp --dport 53 -o enp4s0 -j MASQUERADE
>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
> <http://192.0.1.0/8> -p tcp --dport 533 -o enp4s0 -j MASQUERADE
> 
> But it is failing.
> 
> Hope I am doing something simple wrong !

You don't use MASQUERADE or the nat chain for filtering. Try this:

iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp5s5 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -i enp5s5 -p udp --dport 443 -j ACCEPT --comment 
"HTTP/3"
iptables -A FORWARD -i enp5s5 -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -i enp5s5 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -i enp5s5 -j REJECT
iptables -P FORWARD DROP

Note however that blocking arbitrary _outgoing_ connections to other 
ports generally does more harm than good, because nearly all "bad" 
things today are either using very specific ports (e.g. SMTP) or (along 
with most things in general) are using TCP/443.

The primary result of blocking arbitrary outgoing ports by default is to 
inconvenience applications that have to make connections to peers with 
more than one computer behind the same IP address, which thereby need to 
use more than one port. They then either break or have to respond by 
falling back to typically slower/higher latency/more 
expensive/centralized relaying through an external server using TCP/443.

Instead you generally want to start here:

iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp5s5 -j ACCEPT
iptables -P FORWARD DROP

And then reject the things you actually want to prohibit, e.g.:

iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp4s0 -p tcp --dport 25 -j REJECT --comment "no 
spamming"
iptables -A FORWARD -i enp4s0 -p tcp --dport 80 -j REJECT --comment "no 
unencrypted HTTP"
iptables -A FORWARD -i enp5s5 -j ACCEPT
iptables -P FORWARD DROP

