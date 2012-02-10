From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Fri, 10 Feb 2012 12:36:03 -0600 (CST)
Message-ID: <22755605.2952.1328898963472.JavaMail.root@ixer.mx>
References: <19323396.2950.1328898736467.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19323396.2950.1328898736467.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org


>> I have four interfaces and the default gateway is eth1
>>
>> - eth0 (LAN)
>> - eth1 (internet link)
>> - eth3 (internet link)
> - ppp0 (internet link)
>>
>> I mark (mangle) package udp (1195) for out by interface ppp0.
>> "iptables -t mangle -I OUTPUT -p udp -m udp --dport 1195 -j MARK
>> --set-mark 1
>>
>> and when i try MASQUERADE the package udp (1195) with "iptables -t nat
>> -I POSTROUTING -p udp -m udp --dport 1195 -o ppp0 -j MASQUERADE", does
>> not work!!
>
>I'm still not sure exactly what you're trying to achieve. Presumably you
>want different traffic going out on different interfaces, source-natted
>to that interface IP address.
>
>If so, why not route your traffic as you are already doing (I assume
>that is working) and then just MASQUERADE each interface:
>
>iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
>
>Andy


Yes, I routed traffic by different interfaces, MASQUERADE each interface and it works, I know that because I do the same with the TCP (22) packages (iptables -t nat -I POSTROUTING -p tcp -m tcp --dport 22 -o ppp0 -j MASQUERADE) and it works very well. But only the UDP(1195) packages do not work.

I have dealt with:
iptables -t nat -I POSTROUTING -p udp -m udp --dport 1195 -o ppp0 -j MASQUERADE
iptables -t nat -I POSTROUTING -p udp --dport 1195 -o ppp0 -j MASQUERADE
iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

but it does not work.

Any ideas?

E.Huerta



 
