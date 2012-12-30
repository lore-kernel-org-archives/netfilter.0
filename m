From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Mirroring traffic with iptables TEE target
Date: Sun, 30 Dec 2012 14:18:49 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212301413250.20701@nerf07.vanv.qr>
References: <20121230091048.GA4575@devnull.qunarservers.com> <alpine.LNX.2.01.1212301224240.30402@nerf07.vanv.qr> <CAJZVxRnvbPQfXJRQOLx8tjjP8ee8D6F8Mt=4U8GFBdN_iKCbjA@mail.gmail.com> <alpine.LNX.2.01.1212301319030.7798@nerf07.vanv.qr>
 <CAJZVxRkB2OzBdWR=H4d8vXC1SFfJWWyW+Uj5ffB14Ud5-d5K5w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRkB2OzBdWR=H4d8vXC1SFfJWWyW+Uj5ffB14Ud5-d5K5w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

On Sunday 2012-12-30 13:54, Aaron Lewis wrote:

>Hi Jan,
>
>How should the debugging process began?
>
>In wireshark I see no traffic between the two hosts ...

That would mean that there is a problem with the duplication, but which 
seems unlikely because UDP is transmitted.

I do this

 iptables -A OUTPUT -o eth0 -j TEE --gateway 10.10.7.128

and the '128 machine gets all the packets, including TCP. I can verify 
that with both tcpdump on the emitter as well as the receiver side.

>On Host A (That accept the duplicate, IP: 192.168.56.178):
>iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT
>--to-destination 192.168.56.178:80

Ugh-ly.
Also pretty much pointless because, as you noticed, there is not a whole 
lot to do with half a TCP stream.


>> >So I guess you can't mirror TCP traffics, since it's connection oriented,
>> > am
>> >I right?
