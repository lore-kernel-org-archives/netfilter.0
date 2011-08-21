From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 11:09:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108211107520.15071@frira.zrqbmnf.qr>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com> <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Cc: Netfilter <netfilter@vger.kernel.org>


On Sunday 2011-08-21 10:51, Vinicius Massuchetto wrote:
>2011/8/20 Vinicius Massuchetto <viniciusmassuchetto@gmail.com>:
>> I had this configuration before, and it used to work well, but now I
>> got a new server and I can't setup it to share the internet connection
>> from ppp0.
>>
>> The client connects directly on eth0 through a dhcp server, and it can
>> get an IP just fine. The problem seems only to appear when I set this
>> rule:
>> `iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE`
>>
>> Just after that, the client won't be able to receive an IP from the
>> server anymore. Here's the configuration files:
>
>Aug 21 04:52:13 onix dhcpd: DHCPREQUEST for 192.168.0.2 from
>00:16:36:96:2b:15 (amendoa) via eth0
>Aug 21 04:52:13 onix dhcpd: DHCPACK on 192.168.0.2 to
>00:16:36:96:2b:15 (amendoa) via eth0

Random thoughts
- rp_filter interfering
- having 192.168.0.0/24 on ppp0, colliding with eth0
