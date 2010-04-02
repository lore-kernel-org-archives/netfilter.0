From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: setting quotas with quota
Date: Fri, 2 Apr 2010 16:37:34 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004021630590.19122@obet.zrqbmnf.qr>
References: <4BB53BEC.9010709@gmail.com> <20100402065742.23be08f0@catlap> <4BB59C59.50607@gmail.com> <alpine.LSU.2.01.1004021328480.18189@obet.zrqbmnf.qr> <006a01cad270$b1876110$14962330$@toure@vipnet.ci>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <006a01cad270$b1876110$14962330$@toure@vipnet.ci>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toure Mamadou <mamadou.toure@vipnet.ci>
Cc: 'Dennison Williams' <dennison.williams@gmail.com>, netfilter@vger.kernel.org


On Friday 2010-04-02 16:27, Toure Mamadou wrote:

>when i run this :
>iptables -L FORWARD -v
>
>I got this output :
>pkts bytes target prot opt in out source destination
>2786 3744K ACCEPT udp -- any any anywhere anywhere udp dpt:search-agent
>quota: 1024 bytes
>
>But when traffic pass through my box I got this output of  iptables -L
>FORWARD -v pkts bytes target prot opt in out source destination
>2786 3744K ACCEPT udp -- any any anywhere anywhere udp dpt:search-agent
>quota: 13976899182565778736 bytes
> 
>Why the quota is too big even i have fixe to 1024.
>I'm using kernel 2.6.30 with iptable 1.4.4 Note : I did not  made any pach
>for kernel nor iptable.

The 139... is caused by a bug present in kernels before 2.6.31.

Additionally, the quota cannot be displayed with iptables
(it will stay at 1024 starting from 2.6.31), as the kernel
does not export the current counter back to userspace.

You will have to use xt_quota2 and its procfs interface to read
the counters back.
