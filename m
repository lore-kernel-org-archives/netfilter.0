From: Nicolas KOWALSKI <niko@petole.dyndns.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 03 Apr 2008 17:35:46 +0200
Message-ID: <873aq3ymr1.fsf@petole.dyndns.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net>
	<20080403081822.GA13254@piper.oerlikon.madduck.net>
	<47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org>
	<20080402212653.GC11325@piper.oerlikon.madduck.net>
	<20080403081822.GA13254@piper.oerlikon.madduck.net>
	<47F4A36A.2010600@plouf.fr.eu.org>
	<20080403102632.GA22035@piper.oerlikon.madduck.net>
	<47F4F2B0.9020205@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F4F2B0.9020205@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Pascal Hambourg <pascal.mail@plouf.fr.eu.org> writes:

> However it appears that ICMPv6 types related to neighbor discovery
> (router advertisement, neighbor solicitation/advertisement...) are
> always in the INVALID state.

Well, I am confused; I am not able to reproduce what I saw before...
(before last reboot) :-|


I now only have these kernel messages:

IN=eth0 OUT= MAC=33:33:00:00:00:02:00:0f:1f:c9:4e:7d:86:dd SRC=fe80:0000:0000:0000:020f:1fff:fec9:4e7d DST=ff02:0000:0000:0000:0000:0000:0000:0002 LEN=56 TC=0 HOPLIMIT=255 FLOWLBL=0 PROTO=ICMPv6 TYPE=133 CODE=0

IN=eth0 OUT= MAC=33:33:00:00:00:02:00:0e:35:6c:eb:d0:86:dd SRC=fe80:0000:0000:0000:020e:35ff:fe6c:ebd0 DST=ff02:0000:0000:0000:0000:0000:0000:0002 LEN=56 TC=0 HOPLIMIT=255 FLOWLBL=0 PROTO=ICMPv6 TYPE=133 CODE=0


ip6tables -nvL shows:

petole:~# ip6tables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  180 19680 ACCEPT     0        *      *       ::/0                 ::/0               state RELATED,ESTABLISHED
    5   340 LOG        0        *      *       ::/0                 ::/0               state INVALID LOG flags 0 level 4
    5   340 DROP       0        *      *       ::/0                 ::/0               state INVALID
    0     0 ACCEPT     0        lo     *       ::/0                 ::/0
    0     0 ACCEPT     0        eth0   *       fe80::/64            ::/0
    0     0 ACCEPT     0        eth0   *       2001:6f8:3f1::/48    ::/0
   13  1352 ACCEPT     icmpv6    *      *       ::/0                 ::/0
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:22
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:25
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:80
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:443
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:465
    0     0 ACCEPT     tcp      *      *       ::/0                 ::/0               tcp dpt:993
    0     0 DROP       0        *      *       ::/0                 ::/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     0        *      *       ::/0                 ::/0               state RELATED,ESTABLISHED
    0     0 LOG        0        *      *       ::/0                 ::/0               state INVALID LOG flags 0 level 4
    0     0 DROP       0        *      *       ::/0                 ::/0               state INVALID
    0     0 ACCEPT     0        eth0   *       2001:6f8:3f1::/48    ::/0
    0     0 DROP       0        *      *       ::/0                 ::/0

Chain OUTPUT (policy ACCEPT 194 packets, 20168 bytes)
 pkts bytes target     prot opt in     out     source               destination

-- 
Nicolas
