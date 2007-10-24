From: Tiaan Wessels <tiaan@netsys.co.za>
Subject: Re: Packet duplication
Date: Wed, 24 Oct 2007 08:20:10 +0000
Message-ID: <471F003A.7090501@netsys.co.za>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <003801c81242$c160fec0$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Rob Sterenborg wrote:
> Tiaan Wessels =EDrta:
>  =20
>> thanks,
>> i have located patch-o-matic snapshot for yesterday on netfilter ftp
>> server. so i did a runme extra but it never asks me to apply the
>> ROUTE/--tee patch. is this correct ? must I recompile my
>> kernel in any case ?
>>    =20
>
> Yes you have to supply the kernel source-path and compile your own
> kernel. While you're at it, also download the new iptables source and
> let POM-ng also patch that source. Compiling the kernel isn't that ha=
rd,
> iptables is easier, just supply the iptables source path and when the
> kernel is done, compile and install iptables. Remember to remove the
> existing iptables package from your distribution.
>
> Perhaps you can find the kernel-config from the distro you're using t=
o
> import when running "make menuconfig", so you automatically have all
> options selected that you currently have (unless you choose another
> kernel version than what you are using now). That way you only have t=
o
> select the extra's you want.
>
>
>  =20
i patched the kernel sources with pom and compiled and installed and=20
then compiled and installed iptables 1.3.7 but still i get

nst2:~ # /usr/local/sbin/iptables -A PREROUTE -t mangle -p udp --dport=20
9090 -j ROUTE
iptables v1.3.7: Couldn't load target=20
`ROUTE':/usr/local/lib/iptables/libipt_ROUTE.so: cannot open shared=20
object file: No such file or directory


