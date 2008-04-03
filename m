From: Nicolas KOWALSKI <niko@petole.dyndns.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 03 Apr 2008 17:48:56 +0200
Message-ID: <87y77vx7kn.fsf@petole.dyndns.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net>
	<20080403081822.GA13254@piper.oerlikon.madduck.net>
	<47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org>
	<20080402212653.GC11325@piper.oerlikon.madduck.net>
	<20080403081822.GA13254@piper.oerlikon.madduck.net>
	<47F4A36A.2010600@plouf.fr.eu.org>
	<20080403102632.GA22035@piper.oerlikon.madduck.net>
	<47F4F2B0.9020205@plouf.fr.eu.org> <873aq3ymr1.fsf@petole.dyndns.org>
	<20080403153847.GA17170@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080403153847.GA17170@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

martin f krafft <madduck@madduck.net> writes:

> also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.03.1735 +0200]:
>> IN=eth0 OUT= MAC=33:33:00:00:00:02:00:0f:1f:c9:4e:7d:86:dd
>> SRC=fe80:0000:0000:0000:020f:1fff:fec9:4e7d
>> DST=ff02:0000:0000:0000:0000:0000:0000:0002 LEN=56 TC=0
>> HOPLIMIT=255 FLOWLBL=0 PROTO=ICMPv6 TYPE=133 CODE=0
>
> Exactly. router-solicitation being matched by INVALID.

Ok.

I added rules to accept these. Do you think this is harmfull ?

petole:~# ip6tables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
   27  2808 ACCEPT     0        *      *       ::/0                 ::/0               state RELATED,ESTABLISHED
    0     0 ACCEPT     0        *      *       ::/0                 ff01::/32
    1    76 ACCEPT     0        *      *       ::/0                 ff02::/32
    0     0 LOG        0        *      *       ::/0                 ::/0               state INVALID LOG flags 0 level 4
    0     0 DROP       0        *      *       ::/0                 ::/0               state INVALID
    0     0 ACCEPT     0        lo     *       ::/0                 ::/0
    0     0 ACCEPT     0        *      *       fe80::/64            ::/0
    0     0 ACCEPT     0        eth0   *       2001:6f8:3f1::/48    ::/0
    0     0 ACCEPT     icmpv6    *      *       ::/0                 ::/0
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:22
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:25
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:80
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:443
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:465
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:993
    0     0 DROP       0        *      *       ::/0                 ::/0


It works fine.

-- 
Nicolas
