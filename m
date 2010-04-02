From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: MARK not working
Date: Fri, 2 Apr 2010 13:30:26 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004021328480.18189@obet.zrqbmnf.qr>
References: <4BB53BEC.9010709@gmail.com> <20100402065742.23be08f0@catlap> <4BB59C59.50607@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB59C59.50607@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennison Williams <dennison.williams@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-04-02 09:27, Dennison Williams wrote:

>Before brining up the vpn I flush both mangle/PREROUTING and
>filter/INPUT tables:
># iptables -t filter -Z
># iptables -t mangle -Z PREROUTING
>

Deparsing this mess..

>I then succesfully bring up the vpn connection and provide a count of
>the two tables:
># iptables -t filter -L INPUT -vxn
>Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>    pkts      bytes target     prot opt in     out    
>source               destination
>       0        0 REJECT     all  --  !lo    *      
>0.0.0.0/0            127.0.0.0/8         reject-with icmp-port-unreachable
>     374    37299 Accounting  all  --  *      *      
>0.0.0.0/0            0.0.0.0/0
>       0        0 ACCEPT     all  --  lo     *      
>0.0.0.0/0            0.0.0.0/0
>       0        0 ACCEPT     all  --  eth2   *      
>0.0.0.0/0            0.0.0.0/0
>     371    36320 ACCEPT     all  --  *      *      
>0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
>       1      620 ACCEPT     all  --  eth1   *      
>0.0.0.0/0            0.0.0.0/0           mark match 0x1

There is your mark-1 packet, and right above it is the ESTABLISHED
rule that catches all the other packets that have this condition,
including those marked 1 which are subsequent in the IKE talk.

