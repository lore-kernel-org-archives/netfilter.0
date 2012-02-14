From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Masquerade UDP doesn't work
Date: Tue, 14 Feb 2012 02:09:20 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1202140208250.21931@frira.zrqbmnf.qr>
References: <29809830.2793.1328765747294.JavaMail.root@ixer.mx> <8109c5112723b9bd7a946951e69bffd2@www.coochey.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8109c5112723b9bd7a946951e69bffd2@www.coochey.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giles Coochey <giles@coochey.net>
Cc: ehuerta@ixer.mx, netfilter@vger.kernel.org

On Thursday 2012-02-09 12:05, Giles Coochey wrote:

> On 2012-02-09 05:35, Enrique Huerta de la Fuente wrote:
>> Hello,
>>
>> Masquerade do not work at a UDP port, but if it works at a TCP port.
>>
>> (works) iptables -t nat -I POSTROUTING -m tcp -p tcp --dport 22 -o
>> ppp0 -j MASQUERADE
>> (not working) iptables -t nat -I POSTROUTING -m udp -p udp --dport
>> 1195 -o ppp0 -j MASQUERADE
>>
>
> The "-m udp" confuses me. Do you really need to specify that module, try it
> without the -m option for UDP, I don't tend to use it for TCP either, but if
> it's not broken, don't fix it...

Note that -p only looks at the IP header, but -m udp is required
for the UDP header. So yes, -m udp is required (though it's added
automatically if you forget it).
