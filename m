From: Philipp Offermann <philipp@offermann.tk>
Subject: iptables doesn't stop connection
Date: Sat, 1 May 2004 09:58:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405010958.47237.philipp@offermann.tk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm using iptables to firewall my system but it doesn't seem to work. For 
example I have a cvs-server running (port 2401) that shoud not be accessible 
from the outside. Still when I'm trying to connect with "telnet mymachine 
2401" I get a connection, if not on the first try then on the second. I get 
the following syslog:

Apr 27 11:12:36 mymachine kernel: [IPTABLES DROP] : IN=eth0 OUT= 
MAC=00:0c:76:1d:b0:ec:00:02:85:1a:d7:20:08:00 SRC=193.250.17.211 
DST=*myip* LEN=60 TOS=0x10 PREC=0x00 TTL=52 ID=57653 DF PROTO=TCP 
SPT=40871 DPT=2401 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A000E2C400000000001030300)

Apr 27 11:12:39 mymachine kernel: [IPTABLES DROP] : IN=eth0 OUT= 
MAC=00:0c:76:1d:b0:ec:00:02:85:1a:d7:20:08:00 SRC=193.250.17.211 
DST=*myip* LEN=60 TOS=0x10 PREC=0x00 TTL=52 ID=57654 DF PROTO=TCP 
SPT=40871 DPT=2401 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A000E2D6C0000000001030300)

Apr 27 11:12:45 mymachine cvs-pserver[1746]: connect from 193.250.17.211

You find my iptables configuration at the end of the message. Does anyone know 
why I can connect to my cvs server?

Thankx a lot,
Philipp


Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
bad_tcp_packets  tcp  --  0.0.0.0/0            0.0.0.0/0          tcp 
ACCEPT     all  --  127.0.0.1            0.0.0.0/0          
ACCEPT     all  --  *myip*       0.0.0.0/0          
ACCEPT     all  --  0.0.0.0/0            *myip*     state RELATED,ESTABLISHED 
tcp_packets  tcp  --  0.0.0.0/0            0.0.0.0/0          tcp 
udp_packets  udp  --  0.0.0.0/0            0.0.0.0/0          udp 
icmp_packets  icmp --  0.0.0.0/0            0.0.0.0/0          
log_drop   all  --  0.0.0.0/0            0.0.0.0/0          limit: avg 3/min 
burst 3 

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain allowed (10 references)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp 
flags:0x16/0x02 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp state 
RELATED,ESTABLISHED 
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0          tcp 

Chain bad_tcp_packets (1 references)
target     prot opt source               destination         
log_drop   tcp  --  0.0.0.0/0            0.0.0.0/0          tcp 
flags:!0x16/0x02 state NEW 

Chain icmp_packets (1 references)
target     prot opt source               destination         
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 8 
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 11 

Chain log_accept (0 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 6 level 
4 prefix `[IPTABLES ACCEPT] : ' 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          

Chain log_drop (5 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 6 level 
4 prefix `[IPTABLES DROP] : ' 
DROP       all  --  0.0.0.0/0            0.0.0.0/0          

Chain log_reject (1 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 6 level 
4 prefix `[IPTABLES REJECT] : ' 
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp reject-with 
tcp-reset 
REJECT     all  --  0.0.0.0/0            0.0.0.0/0          reject-with 
icmp-port-unreachable 

Chain tcp_packets (1 references)
target     prot opt source               destination         
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:22 
log_reject  tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:113 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:80 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:443 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:10000 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:25 
log_drop   tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:465 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:110 
log_drop   tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:995 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:143 
log_drop   tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:993 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:389 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:1002 
allowed    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:8080 

Chain udp_packets (1 references)
target     prot opt source               destination         
DROP       udp  --  0.0.0.0/0            213.239.192.18     udp dpts:135:139 
DROP       udp  --  0.0.0.0/0            255.255.255.255    udp dpts:135:139 

