From: Alexander Pyhalov <alp@rosten.elektra.ru>
Subject: Wrong ips
Date: Thu, 1 Feb 2007 08:51:14 +0300
Message-ID: <200702010851.14795.alp@rosten.elektra.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello.
Maybe I'm doing something wrong, but I have the following trouble.
I have kernel 2.6.17.11 and options, related to netfilter in it :
//////////////////////////////////////////////
CONFIG_NETFILTER=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_XTABLES=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_IP_NF_CONNTRACK=m	
CONFIG_IP_NF_FTP=m
CONFIG_IP_NF_IRC=m
CONFIG_IP_NF_TFTP=m
CONFIG_IP_NF_AMANDA=m
CONFIG_IP_NF_QUEUE=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_IPRANGE=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_LOG=m
CONFIG_IP_NF_TARGET_ULOG=m
//////////////////////////////////////////////

lsmod shows, that all related to netfilter (as I think)  modules are loaded:
af_packet              16904  0
xt_tcpudp               3584  0
ip_queue                8480  0
ipt_iprange             1920  0
ipt_REJECT              4608  0
ipt_LOG                 6656  0
iptable_filter          2816  0
ip_tables              14556  1 iptable_filter
x_tables               12932  5 xt_tcpudp,ipt_iprange,ipt_REJECT,ipt_LOG,ip_tables
capability              5128  0
commoncap               7424  1 capability
...

iptables version is 1.3.6

I'm trying to add some rules, but they don't work, when contain port numbers: 

When I'm adding the following rule

#  Access to HTTP server
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
#  Access to SSH is allowed to all
iptables -A INPUT -p tcp -m --dport 22 -j ACCEPT
#  Access to Tomcat
iptables -A INPUT  -s <ip1>ACCEPT
iptables -A INPUT  -s <ip2>  -j ACCEPT
# Access to SMB is allowed to all
iptables -A INPUT -p tcp -m --dport 139   -j ACCEPT 
iptables -A INPUT -p tcp -m --dport 445   -j ACCEPT 
iptables -P INPUT REJECT 

I can't ssh to server. 
When I do 
iptables -A INPUT -s <my ip> -j ACCEPT
everything is fine.

Now I do 

iptables -A INPUT -p tcp -m tcp -s <my ip>   -j LOG

and got something strange in log:
eb  1 08:15:12 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=58.48.57.58 DST=255.255.0.13 LEN=15942 TOS=0x14
 PREC=0x20 TTL=49 ID=25954 MF FRAG:32 PROTO=32
Feb  1 08:15:12 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=58.48.57.58 DST=47.98.0.13 LEN=15942 TOS=0x14 P
REC=0x20 TTL=49 ID=25954 MF FRAG:32 PROTO=32
Feb  1 08:15:12 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=0.0.8.0 DST=0.0.0.13 LEN=0 TOS=0x00 PREC=0x00 T
TL=0 ID=0 PROTO=0
Feb  1 08:15:12 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=58.48.57.58 DST=0.0.0.13 LEN=15942 TOS=0x14 PRE
C=0x20 TTL=49 ID=25954 MF FRAG:32 PROTO=32
Feb  1 08:15:12 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=58.49.48.58 DST=255.255.0.13 LEN=15942 TOS=0x14
 PREC=0x20 TTL=49 ID=25954 MF FRAG:32 PROTO=32
Feb  1 08:15:13 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=58.48.57.58 DST=255.255.0.13 LEN=15942 TOS=0x14
 PREC=0x20 TTL=49 ID=25954 MF FRAG:32 PROTO=32
Feb  1 08:15:13 athena kernel: IN=eth0 OUT= MAC=00:0d:60:eb:a7:7c:00:02:b3:d6:be:9d:08:00 SRC=0.0.0.0 DST=0.0.0.13 LEN=19526 TOS=0x04 PREC=0x
40 TTL=0 ID=257 FRAG:256 PROTO=0

But these ip addresses are not my ip addresses.
They even don't exist in network environment....

 

