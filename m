From: Sam Halliday <fommil@yahoo.ie>
Subject: firewall bother
Date: Sat, 22 Feb 2003 20:21:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030222202147.196de8dc.fommil@yahoo.ie>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi there,

i am having trouble viewing one particular website under my current
firewall setup... (www.talk21.com)

at the bottom of this email is a list of all TCP packets that iptables logs
when i allow all packets (i.e. the webpage loads correctly), and here is a
printout of my `iptables -L -nv` when the firewall is up (to save from having
to post my firewall script! this email is big enough as it is). i would really
really appreciate it if someone could shed some light on why this page
does not work for me unless i turn off the firewall!

linux-2.4.20
iptables-1.2.7

it is really confusing as al packets look just look like normal webpage tcp port
80 sources to me, but the firewall is obviously stopping something getting
through...

apart from this one page, i am 100% happy with my firewall setup. sorry
about the size of this email!

thanks in advance!
Sam
-- 
The six great gifts of an Irish girl are beauty, soft voice, sweet speech,
wisdom, needlework, and chastity.
-- Theodore Roosevelt, 1907
################
iptables -L -nv:
Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          tcp dpt:25 state NEW 
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          tcp dpt:6346 state NEW 
    0     0 LOG        icmp --  eth0   *       0.0.0.0/0            0.0.0.0/0          icmp type 0 LOG flags 0 level 4 prefix `Firewall: Pinged ' 
    1    30 ACCEPT     icmp --  eth0   *       0.0.0.0/0            0.0.0.0/0          icmp type 8 
    0     0 LOG        tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          tcp dpt:113 LOG flags 0 level 4 prefix `Firewall: Ident Query ' 
    0     0 REJECT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          tcp dpt:113 reject-with tcp-reset 
    2   120 LOG        tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          tcp state NEW LOG flags 0 level 4 prefix `Firewall: NEW Attempt ' 
   41 11660 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          state NEW 
    0     0 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          state INVALID 
  280  132K ACCEPT     all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0          
    0     0 LOG        all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 prefix `Firewall: DROPPED ' 
    0     0 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 298 packets, 23789 bytes)
 pkts bytes target     prot opt in     out     source               destination         
################
LOG WITH FIREWALL UP (WEBPAGE CLAIMS CONNECTION REFUSED):
Feb 22 19:03:58 localhost kernel: Firewall: EST or REL IN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.31.64.116 DST=62.30.72.238 LEN=184 TOS=0x00 PREC=0x00 TTL=253 ID=6555 DF PROTO=UDP SPT=53 DPT=32768 LEN=164 
Feb 22 19:03:58 localhost kernel: Firewall: EST or REL IN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.238 LEN=60 TOS=0x00 PREC=0x00 TTL=40 ID=25273 DF PROTO=TCP SPT=80 DPT=33235 WINDOW=5840 RES=0x00 ACK RST URGP=0 
################
LOG WITH NO FIREWALL (PAGE WORKS):
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=60 TOS=0x00 PREC=0x00 TTL=52 ID=32727 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK SYN URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=52 TOS=0x00 PREC=0x00 TTL=52 ID=32728 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32729 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1389 TOS=0x00 PREC=0x00 TTL=52 ID=32730 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32731 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=630 TOS=0x00 PREC=0x00 TTL=52 ID=32732 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32733 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32734 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32735 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=160 TOS=0x00 PREC=0x00 TTL=52 ID=32736 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=60 TOS=0x00 PREC=0x00 TTL=52 ID=32737 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK SYN URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32738 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32739 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32740 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32741 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32742 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32743 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1471 TOS=0x00 PREC=0x00 TTL=52 ID=32744 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=52 TOS=0x00 PREC=0x00 TTL=52 ID=32745 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1196 TOS=0x00 PREC=0x00 TTL=52 ID=32746 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32747 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1450 TOS=0x00 PREC=0x00 TTL=52 ID=32748 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=348 TOS=0x00 PREC=0x00 TTL=52 ID=32749 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1054 TOS=0x00 PREC=0x00 TTL=52 ID=32750 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1242 TOS=0x00 PREC=0x00 TTL=52 ID=32751 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=457 TOS=0x00 PREC=0x00 TTL=52 ID=32752 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=758 TOS=0x00 PREC=0x00 TTL=52 ID=32753 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=771 TOS=0x00 PREC=0x00 TTL=52 ID=32754 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1258 TOS=0x00 PREC=0x00 TTL=52 ID=32755 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32756 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=402 TOS=0x00 PREC=0x00 TTL=52 ID=32757 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1040 TOS=0x00 PREC=0x00 TTL=52 ID=32758 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:57 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=824 TOS=0x00 PREC=0x00 TTL=52 ID=32759 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32760 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32761 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32762 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=57 TOS=0x00 PREC=0x00 TTL=52 ID=32763 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32764 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32765 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32766 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=1500 TOS=0x00 PREC=0x00 TTL=52 ID=32767 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=678 TOS=0x00 PREC=0x00 TTL=52 ID=32768 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=358 TOS=0x00 PREC=0x00 TTL=52 ID=32769 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:27:58 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=880 TOS=0x00 PREC=0x00 TTL=52 ID=32770 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK PSH URGP=0 
Feb 18 22:28:28 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=52 TOS=0x00 PREC=0x00 TTL=52 ID=32771 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=34752 RES=0x00 ACK FIN URGP=0 
Feb 18 22:28:28 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=52 TOS=0x00 PREC=0x00 TTL=52 ID=32772 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=34752 RES=0x00 ACK FIN URGP=0 
Feb 18 22:28:37 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=40 TOS=0x00 PREC=0x00 TTL=40 ID=32773 DF PROTO=TCP SPT=80 DPT=32839 WINDOW=0 RES=0x00 RST URGP=0 
Feb 18 22:28:52 localhost kernel: Firewall: DEBUGIN=eth0 OUT= MAC=00:10:a7:09:94:a7:00:30:80:30:88:a8:08:00 SRC=62.172.192.30 DST=62.30.72.196 LEN=40 TOS=0x00 PREC=0x00 TTL=40 ID=32774 DF PROTO=TCP SPT=80 DPT=32840 WINDOW=0 RES=0x00 RST URGP=0 
################

