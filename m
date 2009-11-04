From: Patrick McHardy <kaber@trash.net>
Subject: Re: Iptables v1.4.4 + kernel 2.6.31 mangle marking changed?
Date: Wed, 04 Nov 2009 15:10:31 +0100
Message-ID: <4AF18B57.6060707@trash.net>
References: <4AF0CF8C.7000602@deboom.biz> <4AF1628D.5080401@trash.net> <4AF17E57.2060206@deboom.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF17E57.2060206@deboom.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph de Boom <lkml@deboom.biz>
Cc: netfilter@vger.kernel.org

Ralph de Boom wrote:
> Patrick McHardy schreef:
>> Ralph de Boom wrote:
>>  
>>> Hi there,
>>>
>>> Excuse me if this email might go wrong, it's my first message to a
>>> mailing list.
>>>
>>> But here's my problem: (And I hope you guys could shed light for me...)
>>>
>>> I originally ran Debian Lenny on kernel 2.6.18.
>>> Since today I reinstalled it to Ubuntu Server 9.10 with kernel  2.6.31.
>>>
>>> Now I used to do this in lenny:
>>>
>>> iptables -t mangle -A PREROUTING -s 192.168.1.0/24 -d 81.4.97.0/24 -j
>>> MARK --set-mark 0x1
>>>
>>> This would cause relevant packets to be marked 0x1, which in return I
>>> had a 'ip rule':
>>>
>>> my rules look like this:
>>>
>>> ip rule show
>>> 0:      from all lookup local
>>> 32760:  from all fwmark 0x2 lookup upc
>>> 32761:  from all fwmark 0x1 lookup xs4all
>>> 32762:  from 192.168.1.XX lookup xs4all
>>> 32763:  from 192.168.1.XX lookup upc
>>> 32764:  from 24.132.104.XXX lookup upc
>>> 32765:  from 192.168.2.XX lookup xs4all
>>> 32766:  from all lookup main
>>> 32767:  from all lookup default
>>>
>>> And my 'xs4all' table looks like:
>>>
>>> ip route show table xs4all
>>> 192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.XX
>>> default via 192.168.2.X dev eth0
>>>
>>>
>>> I know the rule matches packets i make:
>>>
>>> iptables -t mangle -v -L
>>> Chain PREROUTING (policy ACCEPT 3111K packets, 1861M bytes)
>>> pkts bytes target     prot opt in     out     source             
>>> destination
>>>   16  1100 MARK       all  --  any    any     192.168.1.0/24     
>>> ip-space.by.proserve.nl/24 MARK xset 0x1/0xffffffff
>>>
>>> But somehow the connection is never relayed over the xs4all table...
>>>
>>> The changes I've noticed compared to lenny:
>>>
>>> iptables now likes to mark my --set-mark 0x1 as a --set-xmark
>>> 0x1/0xffffffff
>>> whereas in lenny it would stay a --set-mark 0x1
>>>
>>> Would be very pleased if someone could help me in this matter.
>>>     
>>
>> Please try adding a LOG rule directly after the marking rule and
>> see what it prints out for the MARK= value.
>>
>>   
> At first, thanks for helping me out!
> 
> Here's the info:
> 
> iptables -t mangle -v -L
> Chain PREROUTING (policy ACCEPT 42M packets, 25G bytes)
> pkts bytes target     prot opt in     out     source              
> destination
>  362 84150 MARK       all  --  any    any     192.168.1.0/24      
> ip-space.by.proserve.nl/24 MARK xset 0x1/0xffffffff
>  362 84150 LOG        all  --  any    any     192.168.1.0/24      
> ip-space.by.proserve.nl/24 LOG level debug prefix `fwmark 0x1: '
> 
> kern.log:
> Nov  4 14:12:58 sakura kernel: [52836.368503] fwmark 0x1: IN=eth1 OUT=
> MAC=00:1b:21:2d:a9:fa:00:1b:21:32:99:5f:08:00 SRC=192.168.1.30

This looks fine, it also works properly for me. Perhaps the
packets are already delivered locally through the "local"
table. The TRACE target should be able to tell you more.
