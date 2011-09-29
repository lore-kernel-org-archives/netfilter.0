From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 19:35:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109291934450.25670@frira.zrqbmnf.qr>
References: <1317248412.26402.39.camel@andybev-desktop>  <1317279076.26402.52.camel@andybev-desktop>  <alpine.LNX.2.01.1109291224580.18982@frira.zrqbmnf.qr> <1317317318.26402.271.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1317317318.26402.271.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>

On Thursday 2011-09-29 19:28, Andrew Beverley wrote:

>On Thu, 2011-09-29 at 12:28 +0200, Jan Engelhardt wrote:
>> On Thursday 2011-09-29 08:51, Andrew Beverley wrote:
>> >> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800
>> >> ip rule add fwmark 0x800/0xffff table T2
>> >> ip route add table T2 default dev ppp1 via 94.30.127.76
>> >
>> >I've also added the following, which makes no difference:
>> >
>> >iptables -t nat -A POSTROUTING -o ppp1 \
>> >	-j SNAT --to-source 109.224.134.110
>> 
>> Of course it makes no difference, because SNAT is applied after routing.
>> ("POST" "ROUTING", see?)
>
>Yes, but in my case the SNAT still needed applying. The problem was that
>although the packets were being routed via the second interface, they
>were still being sent from the original IP address of the first
>interface. Therefore, packets were being returned to the first
>interface, making it look as if the second interface wasn't being used.

Well, that's why one should use tcpdump -i ethX, rather than tcpdump -i 
any :-)
