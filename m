From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: How to mark packet by reqid?
Date: Wed, 16 May 2012 01:23:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205160116330.17751@frira.zrqbmnf.qr>
References: <EDD810CD654E254F90731B425DE8AA6F106B555B@dc2008r2.sh-solutions.intern>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <EDD810CD654E254F90731B425DE8AA6F106B555B@dc2008r2.sh-solutions.intern>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Wednesday 2012-05-16 00:44, Steffen Heil (Mailinglisten) wrote:
>
>I have incoming packets that need to be decrypted and I need to set the
>correct mark for those.
>I CAN actually set the mark using the following command:
>
>  iptables -t mangle -A PREROUTING --proto esp -j MARK --set-mark 1
>
>BUT that rule matches ALL incoming esp packets. Yet I will have multiple SAs
>and I need to set different marks.
>I tried to use select by reqid or by spi, but as soon as I try that, the
>rule does not match anything any more.

xt_esp generates debug output if you have "printk" sysctl set to show it.

>Can someone help me to get that iptables command right?

 -t mangle -A PREROUTING -p esp --spi 0xc480f134 -j MARK --set-mark 1

>10.5.0.2 10.5.0.1
>        esp mode=tunnel spi=3296784692(0xc480f134) reqid=1(0x00000001)
>        E: aes-cbc  c5eb72ab 906d5717 67e405f5 cfe73f7a
>        A: hmac-sha1  6935290e e51f0965 06577876 0d6237d6 45a0083d
>        seq=0x00000000 replay=32 flags=0x00000000 state=mature
>        created: May 15 22:23:06 2012   current: May 15 22:24:43 2012
>        diff: 97(s)     hard: 1200(s)   soft: 907(s)
>        last: May 15 22:23:19 2012      hard: 0(s)      soft: 0(s)
>        current: 7140(bytes)    hard: 0(bytes)  soft: 0(bytes)
>        allocated: 85   hard: 0 soft: 0
>        sadb_seq=1 pid=8282 refcnt=0
