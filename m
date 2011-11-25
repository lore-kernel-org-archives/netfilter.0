From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: iptables -n doesn't display numbers in all cases for prot column
Date: Fri, 25 Nov 2011 10:17:28 +0100
Message-ID: <4ECF5D28.8080703@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=VW9hGkBp0356qTgQpFjFH2WqJT68hnC1mmSp8GcbYus=;
	b=IGqjsnydp56DWKTyqmFMdOwZ79ik8Jk71pRhHG8V8erDjTekPoj1dGJrvRhp2RLs71uaoBJQj8dPzo0EXgpdgu4NX54g4Y7n4P3gOHEldx/aQJ+fSOOUeO8tAUgWSWrv;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!
I'd like to ask you about such situation. When i display rules without 
using "-n" i'm getting:
# iptables -L -v
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 ACCEPT     ipencap--  any    any     anywhere 
anywhere
     0     0 ACCEPT     ipv6 --  any    any     anywhere 
anywhere
     1    88 ACCEPT     icmp --  any    any     anywhere 
anywhere
    94 13850 ACCEPT     udp  --  any    any     anywhere 
anywhere
   801  632K ACCEPT     tcp  --  any    any     anywhere 
anywhere

It's ok. When i add "-n" switch i'm getting:
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 ACCEPT     4    --  *      *       0.0.0.0/0 
0.0.0.0/0
     0     0 ACCEPT     41   --  *      *       0.0.0.0/0 
0.0.0.0/0
     1    88 ACCEPT     icmp --  *      *       0.0.0.0/0 
0.0.0.0/0
   101 14402 ACCEPT     udp  --  *      *       0.0.0.0/0 
0.0.0.0/0
   905  651K ACCEPT     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0

As we can see protocols "ipencap","ipv6" are shown as number but 
icmp/tcp/udp wasn't displayed as number of protocol.
$ grep "tcp\|udp\|icmp" /etc/protocols
icmp    1       ICMP            # internet control message protocol
tcp     6       TCP             # transmission control protocol
udp     17      UDP             # user datagram protocol

# iptables -V
iptables v1.4.12.1

My question is: why some protocols are always displayed as protocol name 
even i use "-n" switch?
Thanks for help.
Marcin
