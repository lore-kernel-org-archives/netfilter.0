From: netfilter@horizon.com
Subject: -j ECN --ecn-tcp-remove seems to be mangling the TCP checksum...
Date: 27 Sep 2002 06:27:53 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020927062753.13067.qmail@science.horizon.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: netfilter@horizon.com

Environment: x86, 2.4.19 kernel with NTP PPS, ipsec, and netfilter patch-o-matic
patches (current CVS) installed.  Monolithic kernel.

I have the current mangle rules installed:

bash-2.05b# iptables -n -t mangle -L 
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
fix-ecn    tcp  --  0.0.0.0/0            0.0.0.0/0          tcp flags:0x16/0x02 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain fix-ecn (1 references)
target     prot opt source               destination         
ECN        tcp  --  0.0.0.0/0            205.181.112.65     ECN TCP remove 
ECN        tcp  --  0.0.0.0/0            205.152.54.6       ECN TCP remove 
ECN        tcp  --  0.0.0.0/0            134.219.0.0/16     ECN TCP remove 
ECN        tcp  --  0.0.0.0/0            64.14.140.109      ECN TCP remove 

The fix-ecn chain is the beginning of a rule to cope with broken hosts (or,
more commonly, firewalls) that do the wrong thing with ECN.

First, suppose I turn tcp_ecn on and try to telnet to some random web server:
bash-2.05b# echo 1 > /proc/sys/net/ipv4/tcp_ecn ; telnet 1.1.1.1 80

tcpdump -vvvx produces
01:50:26.819358 science.horizon.com.11047 > 1.1.1.1.www: SWE [tcp sum ok] 2541756082:2541756082(0) win 5840 <mss 1460,sackOK,timestamp 14279600 0,nop,wscale 0> (DF) [tos 0x10]  (ttl 64, id 64770, len 60)
                         4510 003c fd02 4000 4006 1783 c023 6401
                         0101 0101 2b27 0050 9780 1eb2 0000 0000
                         a0c2 16d0 441d 0000 0204 05b4 0402 080a
                         00d9 e3b0 0000 0000 0103 0300

Now I'll turn tcp_ecn off:
bash-2.05b# echo 0 > /proc/sys/net/ipv4/tcp_ecn ; telnet 1.1.1.1 80
01:50:55.077891 science.horizon.com.11051 > 1.1.1.1.www: S [tcp sum ok] 2563190821:2563190821(0) win 5840 <mss 1460,sackOK,timestamp 14282426 0,nop,wscale 0> (DF) [tos 0x10]  (ttl 64, id 56991, len 60)
                         4510 003c de9f 4000 4006 35e6 c023 6401
                         0101 0101 2b2b 0050 98c7 3025 0000 0000
                         a002 16d0 2715 0000 0204 05b4 0402 080a
                         00d9 eeba 0000 0000 0103 0300

Now I'll add the random host to the fix_ecn and try with ECN turned on:
bash-2.05b# iptables -t mangle -A fix-ecn -d 1.1.1.1 -p tcp -j ECN --ecn-tcp-remove
bash-2.05b# echo 1 > /proc/sys/net/ipv4/tcp_ecn ; telnet 1.1.1.1 80
01:52:20.662338 science.horizon.com.11058 > 1.1.1.1.www: S [bad tcp cksum bf40!] 2655433521:2655433521(0) win 5840 <mss 1460,sackOK,timestamp 14290984 0,nop,wscale 0> (DF) [tos 0x10]  (ttl 64, id 41753, len 60)
                         4510 003c a319 4000 4006 716c c023 6401
                         0101 0101 2b32 0050 9e46 b331 0000 0000
                         a002 16d0 3c55 0000 0204 05b4 0402 080a
                         00da 1028 0000 0000 0103 0300

Now I'll turn tcp_ecn off again:
bash-2.05b# echo 0 > /proc/sys/net/ipv4/tcp_ecn ; telnet 1.1.1.1 80
01:52:36.771155 science.horizon.com.11059 > 1.1.1.1.www: S [tcp sum ok] 2671050014:2671050014(0) win 5840 <mss 1460,sackOK,timestamp 14292595 0,nop,wscale 0> (DF) [tos 0x10]  (ttl 64, id 60269, len 60)
                         4510 003c eb6d 4000 4006 2918 c023 6401
                         0101 0101 2b33 0050 9f34 fd1e 0000 0000
                         a002 16d0 2bed 0000 0204 05b4 0402 080a
                         00da 1673 0000 0000 0103 0300

Notice the bad tcp checksum in the third case.

Is this a bug?  The ipt_ECN.c file is
ipt_ECN.c,v 1.4 2002/08/05 19:36:51 laforge Exp

Thanks!


