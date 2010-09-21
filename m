From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Wed, 22 Sep 2010 00:42:51 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net>
 <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Paris <eparis@parisplace.org>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org


On Tuesday 2010-09-21 23:00, Eric Paris wrote:
>
>My current patch looks like so:
>
>cat /proc/net/nfs_conntrack
>
>ipv4     2 udp      17 8 src=10.11.231.82 dst=10.11.255.156
>sport=34095 dport=53 src=10.11.255.156 dst=10.11.231.82 sport=53
>dport=34095 mark=0 secmark=system_u:object_r:unlabeled_t:s0 use=2

I think that rather than bloating ancient procfs files with more info,
the respective userspace tool should be augmented by secmark name
resolution instead. Then we would also not need change anything inside
the kernel, or its interfaces to userspace.
