From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reject non-ipsec traffic
Date: Wed, 20 Jul 2011 22:34:37 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com> <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr> <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com> <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
 <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Whelan <rcwhelan@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-07-20 22:33, Ryan Whelan wrote:
>>>
>>>iptables -A OUTPUT -p udp --dport 500 -d hostB.example.com -j ACCEPT
>>>iptables -A OUTPUT -p tcp --dport 500 -d hostB.example.com -j ACCEPT
>>>iptables -A OUTPUT -p esp -d hostB.example.com -j ACCEPT
>>>iptables -A OUTPUT -d hostB.example.com -j REJECT
>>>
>>>but if i remove that the last rule, the 3 rule starts counting matches
>>>(the ESP protocol rule).
>>
>> Sure, because once you are not dropping the original packet in rule
>> 4, it has a chance to get encrypted, show up as ESP, and match rule
>> 3.
>
>So the outbound traffic is being processed by netfilter before getting
>wrapped by IPSec?

Both before and after.
