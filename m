From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: AW: How to mark packet by reqid?
Date: Wed, 16 May 2012 08:51:04 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205160843250.23441@frira.zrqbmnf.qr>
References: <EDD810CD654E254F90731B425DE8AA6F106B555B@dc2008r2.sh-solutions.intern> <alpine.LNX.2.01.1205160116330.17751@frira.zrqbmnf.qr> <EDD810CD654E254F90731B425DE8AA6F106B55B1@dc2008r2.sh-solutions.intern>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <EDD810CD654E254F90731B425DE8AA6F106B55B1@dc2008r2.sh-solutions.intern>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Wednesday 2012-05-16 08:34, Steffen Heil (Mailinglisten) wrote:
>
>> xt_esp generates debug output if you have "printk" sysctl set to show it.
>
>How would I do so? I never used sysctl for anything but enabling ip
>forwarding....

sysctl -w kernel.printk="7 7 7 7"

is probably one way.

>Second: Below is the current output of `ip -s xfrm policy`, `ip -s xfrm
>sate` and `setkey -D`.
>I noticed, 
>- `ip -s xfrm policy` contains "proto esp spi 0x00000000(0)".
>- `setkey -D` contains "spi=3243547107(0xc15499e3)".
>- `ip -s xfrm state` contains "esp spi 0xc4b51d18(3300203800)".
>
>Is this to be expected?

It is not unusual to see `ip -s x p` showing spi 0.
About setkey I don't know, since openswan and I don't use that.
Better trust `ip x s`.
Also note that there may be a handful of SPIs live between peers,
not just a single one.

>Third, I tried you command:
>
># iptables -t mangle -A PREROUTING -p esp --spi 0xcdfebb11 -j MARK
>--set-mark 1
>iptables v1.4.12: Gives: unknown option "--spi"

 --espspi per manpage.

># iptables -t mangle -A PREROUTING -p esp -m espspi --spi 0xcdfebb11 -j MARK
>--set-mark 1
>iptables v1.4.12: policy match: neither --dir in nor --dir out specified

Your command does not match your output.


># iptables -t mangle -A PREROUTING -p esp -m policy --spi 0xcdfebb11 --dir
>out -j MARK --set-mark 1
>iptables: Invalid argument. Run `dmesg' for more information.

See dmesg. (Well, it told you that.)


># iptables -t mangle -A PREROUTING -p esp -m policy --spi 0xcdfebb11 --dir
>in -j MARK --set-mark 1
>
>That worked, however I still don't get the packets through.

Why don't you try --espspi 0xc4b51d18 for a change, since that is
(one value) from those obtained from ip x s.
