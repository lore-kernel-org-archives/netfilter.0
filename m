From: D K <iptables@bigmir.net>
Subject: Balancing two connections
Date: Wed, 28 Feb 2007 17:01:25 +0200
Message-ID: <20070228150125.BF7894AE01E@smtp5.bigmir.net>
Reply-To: D K <iptables@bigmir.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Good day
I have two connections to one ISP with IP addresses in different subnetwork=
s
 (eth0 123.123.123.206/255.255.255.240 (gw 123.123.123.200)
   and   eth3 123.123.123.234/255.255.255.224 (gw 123.123.123.225)).
123.123.123.* - of course not real IPs (I masked them).
And there is one connection to LAN (eth2 10.20.30.4/255.255.255.248)
I want to set up a gateway in which two internet connections would be like =
one but wider.
I want to use NTH or RANDOM method of netfilter to split traffic from users
 (they use IPs 192.168.32.0/24, 192.168.64.0/24, 192.168.128.0/24, 192.168.=
250.0/24 through PPTP server 10.20.30.3)
 between two internet links.
I have a problem:
 I tried to ping 111.111.111.2 (not real IP) from 10.20.30.3 - traffic goes=
 with no problems via eth0 but it doesn't via eth3.
 I sniffed with tcpdump and saw that packets are going out and in via eth3 =
but gate doesn't put it on eth2 to send it to 10.20.30.3.
I put some markers to iptables config (-j LOG) and here is what I got



ping came through
[root@host user]# tailf /var/log/syslog |grep 111.111.111.2|grep iptables_
Feb 26 20:36:14 kit kernel: iptables_mangle_prerouting: IN=3Deth2 OUT=3D MA=
C=3D00:00:e8:11:18:f2:00:30:48:55:f0:15:08:00 SRC=3D10.20.30.3 DST=3D111.11=
1.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D11246 PROTO=3DICMP T=
YPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_nat_prerouting: IN=3Deth2 OUT=3D MAC=
=3D00:00:e8:11:18:f2:00:30:48:55:f0:15:08:00 SRC=3D10.20.30.3 DST=3D111.111=
.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D11246 PROTO=3DICMP TY=
PE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_mangle_forward: IN=3Deth2 OUT=3Deth0 S=
RC=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_mangle_new: IN=3Deth2 OUT=3Deth0 SRC=
=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127=
 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_marked_0: IN=3Deth2 OUT=3Deth0 SRC=3D1=
0.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_after_new: IN=3Deth2 OUT=3Deth0 SRC=3D=
10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_after_ROUTE_0: IN=3Deth2 OUT=3Deth0 SR=
C=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D12=
7 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_after_ROUTE_1: IN=3Deth2 OUT=3Deth0 SR=
C=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D12=
7 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_filter_forward: IN=3Deth2 OUT=3Deth0 S=
RC=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_mangle_postrouting: IN=3D OUT=3Deth0 S=
RC=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_nat_postrouting: IN=3D OUT=3Deth0 SRC=
=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127=
 ID=3D11246 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_mangle_prerouting: IN=3Deth0 OUT=3D MA=
C=3D00:e0:91:03:18:59:00:13:20:42:7c:f5:08:00 SRC=3D111.111.111.2 DST=3D123=
.123.123.206 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D51 ID=3D17571 PROTO=3DIC=
MP TYPE=3D0 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_mangle_forward: IN=3Deth0 OUT=3Deth2 S=
RC=3D111.111.111.2 DST=3D10.20.30.3 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D5=
0 ID=3D17571 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D512 SEQ=3D30209
Feb 26 20:36:14 kit kernel: iptables_after_new: IN=3Deth0 OUT=3Deth2 SRC=3D=
111.111.111.2 DST=3D10.20.30.3 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=
=3D17571 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D512 SEQ=3D30209


ping didn't come through
[root@host user]# tailf /var/log/syslog |grep 111.111.111.2|grep iptables_
Feb 26 20:38:26 kit kernel: iptables_mangle_prerouting: IN=3Deth2 OUT=3D MA=
C=3D00:00:e8:11:18:f2:00:30:48:55:f0:15:08:00 SRC=3D10.20.30.3 DST=3D111.11=
1.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D7823 PROTO=3DICMP TY=
PE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_nat_prerouting: IN=3Deth2 OUT=3D MAC=
=3D00:00:e8:11:18:f2:00:30:48:55:f0:15:08:00 SRC=3D10.20.30.3 DST=3D111.111=
.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D7823 PROTO=3DICMP TYP=
E=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_mangle_forward: IN=3Deth2 OUT=3Deth0 S=
RC=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_mangle_new: IN=3Deth2 OUT=3Deth0 SRC=
=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127=
 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_marked_0: IN=3Deth2 OUT=3Deth0 SRC=3D1=
0.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_marked_1: IN=3Deth2 OUT=3Deth0 SRC=3D1=
0.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_after_new: IN=3Deth2 OUT=3Deth0 SRC=3D=
10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=
=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_after_ROUTE_0: IN=3Deth2 OUT=3Deth0 SR=
C=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D12=
7 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_after_ROUTE_1: IN=3Deth2 OUT=3Deth0 SR=
C=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D12=
7 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_filter_forward: IN=3Deth2 OUT=3Deth0 S=
RC=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_mangle_postrouting: IN=3D OUT=3Deth3 S=
RC=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D1=
27 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_nat_postrouting: IN=3D OUT=3Deth3 SRC=
=3D10.20.30.3 DST=3D111.111.111.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D127=
 ID=3D7823 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D30465
Feb 26 20:38:26 kit kernel: iptables_mangle_prerouting: IN=3Deth3 OUT=3D MA=
C=3D00:c0:26:aa:13:03:00:07:e9:2a:97:73:08:00 SRC=3D111.111.111.2 DST=3D123=
.123.123.234 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D51251 PROTO=3DIC=
MP TYPE=3D0 CODE=3D0 ID=3D512 SEQ=3D30465



As you can see ICMP packets goes via eth0 with no problems. But when it goe=
s via eth3, it goes out and comes back but it's lost somewhere after iptabl=
es_mangle_prerouting.
What can it be ??? May be some things should be added to routing?


[root@host user]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
10.20.30.0      *               255.255.255.248 U     10     0        0 eth=
2
123.123.123.192 *               255.255.255.240 U     10     0        0 eth=
0
123.123.123.224 *               255.255.255.224 U     35     0        0 eth=
3
default         123.123.123.200 0.0.0.0         UG    10     0        0 eth=
0


Forwarding is enabled as you can see
[root@host user]# cat /proc/sys/net/ipv4/ip_forward
1


Here is what iptables-save tells
# Generated by iptables-save v1.3.7 on Sun Feb 18 04:53:06 2007
*nat
:OUTPUT ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -p icmp -j LOG  --log-prefix "iptables_nat_postrouting: "
-A POSTROUTING -s 123.123.123.192/255.255.255.240 -j ACCEPT
-A POSTROUTING -o eth0 -j SNAT --to-source 123.123.123.206
-A POSTROUTING -o eth3 -j SNAT --to-source 123.123.123.234
-A PREROUTING -p icmp -j LOG  --log-prefix "iptables_nat_prerouting: "
-A OUTPUT -p icmp -j LOG  --log-prefix "iptables_nat_ouput: "
-A POSTROUTING -p icmp -j LOG  --log-prefix "iptables_after_nat: "
COMMIT
# Completed on Sun Feb 18 04:53:06 2007
# Generated by iptables-save v1.3.7 on Sun Feb 18 04:53:06 2007
*mangle
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:NEW_OUT_CONN - [0:0]
-A PREROUTING -p icmp -j LOG  --log-prefix "iptables_mangle_prerouting: "
-A INPUT -p icmp -j LOG  --log-prefix "iptables_mangle_input: "
-A FORWARD -p icmp -j LOG  --log-prefix "iptables_mangle_forward: "
-A OUTPUT -p icmp -j LOG  --log-prefix "iptables_mangle_ouput: "
-A POSTROUTING -p icmp -j LOG  --log-prefix "iptables_mangle_postrouting: "
-A FORWARD -d 123.123.123.192/255.255.255.240 -j ACCEPT
-A FORWARD -d 123.123.123.224/255.255.255.224 -j ACCEPT
-A FORWARD -m state --state NEW -j NEW_OUT_CONN
-A NEW_OUT_CONN -p icmp -j LOG  --log-prefix "iptables_mangle_new: "
-A NEW_OUT_CONN -j CONNMARK  --set-mark 0
-A NEW_OUT_CONN -p icmp -j LOG  --log-prefix "iptables_marked_0: "
-A NEW_OUT_CONN -m statistic -j RETURN  --mode nth --every 2 --packet 0
-A NEW_OUT_CONN -j CONNMARK  --set-mark 1
-A NEW_OUT_CONN -p icmp -j LOG  --log-prefix "iptables_marked_1: "
-A NEW_OUT_CONN -m statistic -j RETURN  --mode nth --every 2 --packet 1
-A FORWARD -p icmp -j LOG --log-prefix "iptables_after_new: "
-A FORWARD -m connmark -i eth2 -j ROUTE  --mark 0 --gw 123.123.123.200 --co=
ntinue
-A FORWARD -p icmp -j LOG  --log-prefix "iptables_after_ROUTE_0: "
-A FORWARD -m connmark -i eth2 -j ROUTE  --mark 1 --gw 123.123.123.225 --co=
ntinue
-A FORWARD -p icmp -j LOG  --log-prefix "iptables_after_ROUTE_1: "
COMMIT
# Completed on Sun Feb 18 04:53:06 2007
# Generated by iptables-save v1.3.7 on Sun Feb 18 04:53:06 2007
*filter
:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -p icmp -j LOG  --log-prefix "iptables_filter_input: "
-A INPUT -i lo -j ACCEPT
-A FORWARD -p icmp -j LOG  --log-prefix "iptables_filter_forward: "
-A FORWARD -p icmp -j ACCEPT
-A FORWARD -s 10.20.30.0/255.255.255.248 -i eth2 -j ACCEPT
-A FORWARD -d 10.20.30.0/255.255.255.248 -o eth2 -j ACCEPT
-A FORWARD -s 192.168.32.0/255.255.255.0 -i eth2 -j ACCEPT
-A FORWARD -s 192.168.64.0/255.255.255.0 -i eth2 -j ACCEPT
-A FORWARD -s 192.168.128.0/255.255.255.0 -i eth2 -j ACCEPT
-A FORWARD -s 192.168.250.0/255.255.255.0 -i eth2 -j ACCEPT
-A FORWARD -s 123.123.123.192/255.255.255.240 -i eth2 -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -s 10.20.30.0/255.255.255.248 -i eth2 -j ACCEPT
# Don't pay attention to next one - it's for future use
-A INPUT -p tcp -m tcp -m multiport -d 123.123.123.201 -j ACCEPT --dports 2=
1,25,53,80
-A OUTPUT -p icmp -j LOG  --log-prefix "iptables_filter_ouput: "
# It's for disabling traceroute through the gate (I think it should work an=
d shouldn't stop icmp ping requests/replies)
-A OUTPUT -p icmp -m icmp -s 10.20.30.0/255.255.255.248 --icmp-type ttl-zer=
o-during-transit -j DROP
-A INPUT -p udp -m udp --sport 53 -j ACCEPT
COMMIT
# Completed on Sun Feb 18 04:53:06 2007



By the way I have Mandriva 2007 installed, kernel 2.6.20 and iptables 1.3.7=
 pached with patch-o-matic-ng-20070217 (ROUTE enabled)

___________________________________________________
=D3=E7=ED=E0=E9 =EE =C2=C8=D7/=D1=CF=C8=C4 =E1=EE=EB=FC=F8=E5! =20
www.helpme.com.ua ICQ 271 324 528  


