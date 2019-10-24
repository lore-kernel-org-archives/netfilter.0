From: zrm <zrm@trustiosity.com>
Subject: Re: understanding my MASQURADING and SNAT problem
Date: Thu, 24 Oct 2019 14:43:27 -0400
Message-ID: <d3dbd5e3-3d3a-36b7-1552-4af71586a6ba@trustiosity.com>
References: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
 <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com>
 <CANkmNDdnBB92niurKFGojdpUi8_wwLFooUWZmYQijMK5Vn1LvA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1571942607; bh=W8MJcV219zUaVp++D1Y/Vn1Iri0e1F8PPPai0Y/1iwU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=w/dZrFdiCvRPsVaVKwJYWGsSfpUA6/EYjx/I05/pY/V8BvQngt0oEiVke1KzO3GhO
         v+cuOyQy62/e48kZC3ZMyLtzH/Ujl/W1XIYqvNY/aWouQzRmMELW1eneiFv9bY0azY
         THna4YhL6CDnUdpWu0lYgv46Q8MaE9mSOJR3BEKQ=
In-Reply-To: <CANkmNDdnBB92niurKFGojdpUi8_wwLFooUWZmYQijMK5Vn1LvA@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Gray <aaronngray.lists@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 10/23/19 20:58, Aaron Gray wrote:
> 
> Ah that explains it, I cannot believe I did that, yes it should have 
> been 192.168.1.0/8 <http://192.168.1.0/8> !
> 
> And that explains the ! too ?

It should probably be 192.168.1.0/24. The '!' means "not" -- i.e. don't 
translate things with that destination.

>     You don't use MASQUERADE or the nat chain for filtering. Try this:
> 
>     iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
>     iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>     iptables -A FORWARD -i enp5s5 -p tcp --dport 443 -j ACCEPT
>     iptables -A FORWARD -i enp5s5 -p udp --dport 443 -j ACCEPT --comment
>     "HTTP/3"
>     iptables -A FORWARD -i enp5s5 -p tcp --dport 53 -j ACCEPT
>     iptables -A FORWARD -i enp5s5 -p udp --dport 53 -j ACCEPT
>     iptables -A FORWARD -i enp5s5 -j REJECT
>     iptables -P FORWARD DROP
> 
> 
> This is exactly what I want to be prohibitive as I can first to start 
> off with, for windows instillation, No HTTP, or other ports, then I want 
> to use IPSET to only allow specific Microsoft IP's too. So all the 
> others go in the 'filter' chain by default ?

If you're going to do this then what you may also want to do is log 
anything you're blocking, e.g.:

iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp5s5 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -i enp5s5 -p udp --dport 443 -j ACCEPT --comment 
"HTTP/3"
iptables -A FORWARD -i enp5s5 -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -i enp5s5 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -i enp5s5 -j LOG --log-prefix "enp5s5 rejected:"
iptables -A FORWARD -i enp5s5 -j REJECT
iptables -P FORWARD DROP

Then check the logs on a regular basis and see what's there, because if 
anything shows up it means that something is wrong -- either you're 
blocking something you shouldn't be or you're blocking something you 
should be but then it shouldn't even be trying to do that and you may 
want to go remediate whatever is attempting to misbehave.

>     Note however that blocking arbitrary _outgoing_ connections to other
>     ports generally does more harm than good, because nearly all "bad"
>     things today are either using very specific ports (e.g. SMTP) or
>     (along with most things in general) are using TCP/443.
> 
>     The primary result of blocking arbitrary outgoing ports by default
>     is to inconvenience applications that have to make connections to
>     peers with more than one computer behind the same IP address, which
>     thereby need to use more than one port. They then either break or
>     have to respond by falling back to typically slower/higher
>     latency/more expensive/centralized relaying through an external
>     server using TCP/443.
> 
>     Instead you generally want to start here:
> 
>     iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
>     iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>     iptables -A FORWARD -i enp5s5 -j ACCEPT
>     iptables -P FORWARD DROP
> 
>     And then reject the things you actually want to prohibit, e.g.:
> 
>     iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
>     iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>     iptables -A FORWARD -i enp5s5 -p tcp --dport 25 -j REJECT --comment
>     "no spamming"
>     iptables -A FORWARD -i enp5s5 -p tcp --dport 80 -j REJECT --comment
>     "no unencrypted HTTP"
>     iptables -A FORWARD -i enp5s5 -j ACCEPT
>     iptables -P FORWARD DROP
> 
> 
> what about 137 and 139 I want them blocked.

Those would be incoming connections, right? The only ACCEPT rule 
matching packets coming in the external interface is the one with "-m 
state --state RELATED,ESTABLISHED", which doesn't match NEW connections, 
so they hit the default policy (-P FORWARD DROP).
