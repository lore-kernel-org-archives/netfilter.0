From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Nix-AW: AW: How to mark packet by reqid?
Date: Fri, 25 May 2012 11:43:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205251140310.24419@frira.zrqbmnf.qr>
References: <EDD810CD654E254F90731B425DE8AA6F106B555B@dc2008r2.sh-solutions.intern> <alpine.LNX.2.01.1205160116330.17751@frira.zrqbmnf.qr> <EDD810CD654E254F90731B425DE8AA6F106B55B1@dc2008r2.sh-solutions.intern> <alpine.LNX.2.01.1205160843250.23441@frira.zrqbmnf.qr>
 <EDD810CD654E254F90731B425DE8AA6F106B5872@dc2008r2.sh-solutions.intern>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <EDD810CD654E254F90731B425DE8AA6F106B5872@dc2008r2.sh-solutions.intern>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Thursday 2012-05-17 22:15, Steffen Heil (Mailinglisten) wrote:
>
>> >> xt_esp generates debug output if you have "printk" sysctl set to show
>it.
>> >How would I do so? I never used sysctl for anything but enabling ip
>> >forwarding....
>> sysctl -w kernel.printk="7 7 7 7"
>
>I did. And I tried 
># echo "7 7 7 7" > /proc/sys/kernel/printk
>
>Nothing appears on `dmesg`.

Sigh. Then I don't know, but it ought to be enabled somehow at runtime,
this awesome dynamic printk thing. (provided it's compiled)


>Also I noticed that xt_esp was not loaded automatically. I had to load it
>using `insmod`.

Is modprobe broken on your system? It is loaded automatically
(try_then_request_module from the kernel).

>But note, that I could not use -m esp --espspi either, see below.
>
>> ># iptables -t mangle -A PREROUTING -p esp --spi 0xcdfebb11 -j MARK
>> >--set-mark 1 iptables v1.4.12: Gives: unknown option "--spi"
>>  --espspi per manpage.
>
>-m esp --espspi XXXXX
>Or
>-m polixy --spi XXXXX --dir in
>
>The later does not match, but I cannot even get the former one to be
>accepted:
>
># iptables -t mangle -D PREROUTING -p esp -m esp --espspi 0xcde0e1ca -j MARK
>--set-mark 1
>iptables: No chain/target/match by that name.

So, kernel without mangle table or without xt_esp or without MARK.
Pretty easy:
	modprobe -q xt_esp
	ls -dl /sys/module/xt_esp
etc.

