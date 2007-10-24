From: Tiaan Wessels <tiaan@netsys.co.za>
Subject: Re: Packet duplication
Date: Wed, 24 Oct 2007 10:00:28 +0000
Message-ID: <471F17BC.9060507@netsys.co.za>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819> <471F003A.7090501@netsys.co.za> <001501c81620$a81ac3b0$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001501c81620$a81ac3b0$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Rob Sterenborg wrote:
>> i patched the kernel sources with pom and compiled and installed and
>> then compiled and installed iptables 1.3.7 but still i get
>>
>> nst2:~ # /usr/local/sbin/iptables -A PREROUTE -t mangle -p
>> udp --dport 9090 -j ROUTE
>> iptables v1.3.7: Couldn't load target
>> `ROUTE':/usr/local/lib/iptables/libipt_ROUTE.so: cannot open shared
>> object file: No such file or directory
>>     
>
> So, "locate libipt_ROUTE.so" doesn't return
> "/usr/local/lib/iptables/libipt_ROUTE.so".
>
> In that case I suppose there was an error when compiling iptables
> (perhaps also when compiling the kernel?) that caused libipt_ROUTE.so
> not to be compiled. When you ran "make", did you see any related errors?
> Anyway, I don't think I can help you there; I'm not a developer, maybe
> someone else can.
>
>   
thats correct. locate finds nothing. in an attempt at hacking i added 
ROUTE to the variable PF_EXT_SLIB in extensions/Makefile and tried to 
make but then get

nst2:~/iptables-1.3.7 # make
Unable to resolve dependency on linux/netfilter_ipv4/ipt_ROUTE.h. Try 
'make clean'.
Extensions found: IPv4:CLUSTERIP IPv4:connbytes IPv4:dccp IPv4:quota 
IPv4:recent IPv4:statistic IPv4:string IPv6:REJECT IPv6:ah IPv6:esp 
IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt IPv6:sctp


i could not see any problem in compiling either the kernel or iptables. 
what did strike me as odd was when i ran the ./runme script in pom it 
never asks me for the patch on routing so i answer N to all the 
questions. this right ???
