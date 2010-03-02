From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Packets ending up in wrong chain after DNAT
Date: Tue, 02 Mar 2010 09:43:38 +0100
Message-ID: <4B8CCFBA.5000706@chello.at>
References: <4B8C69FF.7050400@concero.nl>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8C69FF.7050400@concero.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 02.03.2010 02:50, netfilter-owner@vger.kernel.org wrote:
> 
> I have a DNAT to an address behind the box, like this
> 
> Chain PREROUTING (policy ACCEPT 743K packets, 49M bytes)
>  pkts bytes target     prot opt in     out     source       
> destination        
>  1572 94320 DNAT       tcp  --  eth2   *       1.1.1.1      
> 0.0.0.0/0           tcp dpt:25 to:172.20.8.217
> 
> 
> I expect to see all packets from source 1.1.1.1 to tcp/25 ending up
> exclusively in the FORWARD chain. However a fraction of these packets
> end up in both FORWARD and INPUT chains.
> 
> The following log lines show the problem:
> 
> Mar  2 02:03:50 erouter kernel: [527920.547039] LOG 25 Correct  IN=eth2
> OUT=eth0 SRC=1.1.1.1 DST=172.20.8.217 LEN=60 TOS=0x00 PREC=0x00 TTL=48
> ID=6919 DF PROTO=TCP SPT=53800 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0
> Mar  2 02:03:55 erouter kernel: [527925.562582] LOG 25 Correct  IN=eth2
> OUT=eth0 SRC=1.1.1.1 DST=172.20.8.217 LEN=60 TOS=0x00 PREC=0x00 TTL=48
> ID=26610 DF PROTO=TCP SPT=53803 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0
> Mar  2 02:03:55 erouter kernel: [527925.765439] LOG 25 Wrong  IN=eth2
> OUT= MAC=00:16:3e:78:4a:72:00:1d:45:8a:1b:2e:08:00 SRC=1.1.1.1
> DST=2.2.2.2 LEN=40 TOS=0x00 PREC=0x00 TTL=49 ID=0 DF PROTO=TCP SPT=53803
> DPT=25 WINDOW=0 RES=0x00 RST URGP=0
> 
> The first entry is fine. The next two lines show the problem. The second
> line comes from the FORWARD chain and a fraction later in time, another
> entry is logged in the INPUT chain. Note the different LEN and other
> values in the last log line.
> 
> I used the following to create the log lines (addresses are fake)
> 
> IPTABLES=/usr/sbin/iptables
> xs1=eth2
> lan=eth0
> 
> $IPTABLES -t nat -A PREROUTING  -i $xs1 -p tcp -s 1.1.1.1 --dport 25 -j
> DNAT --to-destination 172.20.8.217
> 
> $IPTABLES -N inet-fw
> $IPTABLES -A INPUT -i $xs1 -j inet-fw
> $IPTABLES -A inet-fw -p tcp --dport 25 -j LOG --log-prefix 'LOG 25 Wrong  '
> 
> $IPTABLES -N inet-lan
> $IPTABLES -A FORWARD -i $xs1 -o $lan -j inet-lan
> $IPTABLES -A inet-lan -p tcp --dport 25 -j LOG --log-prefix 'LOG 25
> Correct  '
> 
> I see this problem running openSUSE 11.2 with there kernel
> 
> Linux erouter 2.6.31.12-0.1-xen #1 SMP 2010-01-27 08:20:11 +0100 i686
> i686 i386 GNU/Linux
> 
> running on a Xen domU. I cannot remember I have seen this behaviour
> before. Does someone have a clue?
> 
> Dion.

Do you encounter connection problems/drops?
It could be those 'wrong' packets are classified by conntrack into state
'INVALID'.
Try to LOG, DROP or LOG/DROP with -m state --state INVALID in INPUT and
FORWARD chain.
Netfilter NAT predicts the traffic being valid for the conntrack engine.

Hope it helps

Mart
