From: Peter Horst <phorst@speakeasy.net>
Subject: question about opening a port
Date: Mon, 31 Jul 2006 14:19:24 -0500
Message-ID: <44CE57BC.8010601@speakeasy.net>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello - if someone has a second, I could really use some help. I'm 
trying to open a port (in addition to the ones already open) in order to 
allow DNS traffic (port 53), both UDP and TCP.  Does the following 
iptables script look right for this purpose? 

Thanks very much.

Chain RH-Firewall-1-INPUT (2 references)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp 
type 255
3    ACCEPT     esp  --  0.0.0.0/0            0.0.0.0/0
4    ACCEPT     ah   --  0.0.0.0/0            0.0.0.0/0
5    ACCEPT     udp  --  0.0.0.0/0            224.0.0.251         udp 
dpt:5353
6    ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
7    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
8    ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp 
dpt:631
9    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
dpt:631
10   ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
11   ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state 
NEW tcp dpt:22
12   ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state 
NEW tcp dpt:25
13   ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state 
NEW tcp dpt:80
14   ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state 
NEW tcp dpt:443
15   ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state 
NEW tcp dpt:53
16   ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           state 
NEW udp dpt:53
17   REJECT     all  --  0.0.0.0/0            0.0.0.0/0           
reject-with icmp-host-prohibited

