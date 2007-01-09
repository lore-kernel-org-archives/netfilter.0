From: Brian McNally <bmcnally@u.washington.edu>
Subject: Connection reset problem
Date: Tue, 9 Jan 2007 09:43:36 -0800
Message-ID: <778672E1-6297-45BD-AC2E-B142864AA189@u.washington.edu>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

I've got a host that periodically resets connections to clients, and  
I'm having trouble pinpointing the problem. Here are the details:

Server:

2.6.13 kernel
CAOS Linux
iptables 1.3.1

Relevant iptables rules:

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state  
RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            211.7.9.193       tcp dpt:22  
state NEW,ESTABLISHED
LOG        all  --  0.0.0.0/0            211.7.9.193       LOG flags  
0 level 4 prefix `BLOCKED: '
REJECT     tcp  --  0.0.0.0/0            211.7.9.193       reject- 
with tcp-reset

I see connections that should be being tracked as established end up  
matching the blocked and reject rules. For example, here's what ends  
up in systems logs for some sample packets:

Jan 4 09:38:57 serverhost kernel: BLOCKED: IN=eth1 OUT=  
MAC=00:35:48:71:c6:ea:00:14:f2:dd:f7:46:08:00 SRC=172.28.10.170  
DST=211.7.9.193 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=57445 DF PROTO=TCP
SPT=51645 DPT=22 WINDOW=16022 RES=0x00 ACK URGP=0

Jan 4 09:45:21 serverhost kernel: BLOCKED: IN=eth1 OUT=  
MAC=00:35:48:71:c6:ea:00:14:f2:dd:f7:46:08:00 SRC=172.28.10.170  
DST=211.7.9.193 LEN=64 TOS=0x10 PREC=0x00 TTL=63 ID=56765 DF  
PROTO=TCP SPT=36234 DPT=22 WINDOW=7680 RES=0x00 ACK URGP=0

And, here's a tcpdump snipet from the first of those packets:

09:38:57.547888 IP serverhost.example.com.ssh >  
172.28.10.170.51645: . 131806:133174(1368) ack 27689 win 540  
<nop,nop,timestamp 22101576 816063448>

09:38:57.547908 IP serverhost.example.com.ssh > 172.28.10.170.51645:  
P 133174:133838(664) ack 27689 win 540 <nop,nop,timestamp 22101577  
816063448>

09:38:57.548366 IP 172.28.10.170.51645 >  
serverhost.example.com.ssh: . ack 131806 win 16022 <nop,nop,timestamp  
816063449 22021269,nop,nop,sack sack 1 {1740668210:1740668874}>

09:38:57.548574 IP serverhost.example.com.ssh > 172.28.10.170.51645:  
R 1675860173:1675860173(0) win 0

09:38:57.548579 IP 172.28.10.170.51645 >  
serverhost.example.com.ssh: . ack 133838 win 15673 <nop,nop,timestamp  
816063449 22101576>

09:38:57.548740 IP 172.28.10.170.51645 >  
serverhost.example.com.ssh: . ack 133838 win 0

* Notice the 4th line, where the connection gets reset by  
serverhost.example.com.

So, what's going on here? I've got two theories but I'm certainly  
open to other ideas.

1. Our border firewall (something I don't have direct control over)  
is somehow mangling the packets so that iptables connection tracking  
gets thrown off. I'd want more concrete evidence that this is the  
case before proceeding though.

2. Some kernel options (or some collection of kernel options) is  
causing iptables or TCP/IP to screw up. This is a custom kernel, and  
not something I set up originally, so it's in an unknown state. If  
you suspect some kernel variable could reveal the problem, what would  
you check? I've played around a bit without luck.

--
Brian McNally


