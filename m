From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Newbie: why is this packet being dropped/logged?
Date: Mon, 04 Aug 2003 14:11:35 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2DEB07.1060801@mega-bucks.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am relatively new to iptables. I have set up some basic rules for my 
web server to allow only SSH and HTTP traffic (listed below). But I am 
finding some log entries showing packets that were trying to connect to 
port 80 getting logged (and dropped).

I can't understand why these packets were logged as I thought my rules 
would let through any packet trying to connect to port 80.

# iptables -n -v -L
Chain INPUT (policy DROP 279 packets, 14864 bytes)
  pkts bytes target     prot opt in     out     source 
destination
   238 47040 ACCEPT     all  --  lo     *       0.0.0.0/0 
0.0.0.0/0
  366M   21G ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0          state RELATED,ESTABLISHED
2199K  120M ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
203.179.86.66      state NEW,RELATED,ESTABLISHED tcp dpt:80
    38  1824 ACCEPT     tcp  --  eth0   *       219.118.175.0/24 
203.179.86.66      state NEW,RELATED,ESTABLISHED tcp dpt:22
     0     0 DROP       udp  --  *      *       0.0.0.0/0 
0.0.0.0/0          udp dpt:67
     0     0 REJECT     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0          tcp dpt:113 reject-with tcp-reset
     0     0 REJECT     udp  --  *      *       0.0.0.0/0 
0.0.0.0/0          udp dpt:137 reject-with icmp-port-unreachable
     0     0 REJECT     udp  --  *      *       0.0.0.0/0 
0.0.0.0/0          udp dpt:138 reject-with icmp-port-unreachable
     0     0 REJECT     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0          tcp dpt:138 reject-with icmp-port-unreachable
     0     0 REJECT     udp  --  *      *       0.0.0.0/0 
0.0.0.0/0          udp dpt:139 reject-with icmp-port-unreachable
   279 14864 LOG        all  --  *      *       0.0.0.0/0 
0.0.0.0/0          LOG flags 0 level 7 prefix `DROP:'

Here is one of those log entries:

kernel: DROP:IN=eth0 OUT= MAC=00:d0:b7:e1:13:e7:00:90:fe:1e:50:a6:08:00 
SRC=66.69.93.167 DST=203.179.86.66 LEN=40 TOS=0x00 PREC=0x00 TTL=105 
ID=8622 DF PROTO=TCP SPT=1439 DPT=80 WINDOW=64952 RES=0x00 ACK URGP=0

Can someone help me understand why this packet was dropped?

Thanks,

Jean-Christian Imbeault


