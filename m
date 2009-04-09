From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: [ANNOUNCE] Release of iptables-1.4.3.2
Date: Thu, 09 Apr 2009 10:31:06 +0200
Message-ID: <49DDB24A.80400@chello.at>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de> <49DAD5E0.9020303@caf.com.tr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DAD5E0.9020303@caf.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eray Aslan wrote:
> On 06.04.2009 17:18, Dennis J. wrote:
>   
>> What does "deprecation of NAT filtering" entail exactly?
>>     
>
> # /sbin/iptables -V
> iptables v1.4.2
> # /sbin/iptables -t nat -A OUTPUT -p tcp --dport 10000 -j DROP
>
> The "nat" table is not intended for filtering, hence the use of DROP is
> deprecated and will permanently be disabled in the next iptables
> release. Please adjust your scripts.
>
> # /sbin/iptables -L -nvx -t nat
> [...]
> Chain OUTPUT (policy ACCEPT 45827 packets, 3301166 bytes)
>     pkts      bytes target     prot opt in     out     source
>     destination
>        0        0 DROP       tcp  --  *      *       0.0.0.0/0
>   0.0.0.0/0           tcp dpt:10000
> #
>
> versus
>
> # /sbin/iptables -V
> iptables v1.4.3.1
> # /sbin/iptables -t nat -A OUTPUT -p tcp --dport 10000 -j DROP
> iptables v1.4.3.1:
> The "nat" table is not intended for filtering, the use of DROP is
> therefore inhibited.
>
>
> Try `iptables -h' or 'iptables --help' for more information.
> # /sbin/iptables -L -nvx -t nat
> [...]
> Chain OUTPUT (policy ACCEPT 5115 packets, 415189 bytes)
>     pkts      bytes target     prot opt in     out     source
>     destination
> #
>
> Do not filter in the nat table and you will be fine.
>
>   
Hello,

what about the 'policy' in the 'nat' table? Will it allow 'DROP'?

what about the other non 'filter' tables?
Will it be possible to 'DROP' in the mangle table? Or set it's policy to 
'DROP'?
Isn't dropping in the mangle table almost the same thing as doing that 
in the nat table?
At least it violates the concept of filtering in the filter table.

What if someone uses 'DROP' rules and policy in the 'raw' table?
Especially setting a drop policy there turns the concept upside down.
I've been reading some advices to do 'blacklisting' in the raw table, 
which does sound quite reasonable to me, as the raw table is the first 
to be process, thus speeding up the processing.
Though the raw table has been introduces to allow 'NOTRACK'. So, the 
concept violation makes sense here?
But again, a 'DROP' policy? Needed?

I must say I've always been wondering why the other tables (formerly 
just mangle and nat) would have the DROP policy available, and why they 
allow dropping rules, although the iptables concept says to do filtering 
in the filter table.
I've seen quite some people (mostly unexperienced) mess up their box 
with that, most of them ending up asking for public help.
It seems misleading to me, to make that options available.

Thanks for any information you want to share with me.

Thanks to the developers spending their time and energy.

Greets

Mart
