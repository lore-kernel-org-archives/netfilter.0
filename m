From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: question on state module ....
Date: Sat, 22 Nov 2003 13:57:41 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3b119$be544b80$95ffa8c0@ESTACAO>
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
To: netfilter ML <netfilter@lists.samba.org>


    Hello Guys,

    I'm having a strange behavior here with state module. I'm using kernel
2.4.22 with some patchs applied from a pretty recent (20031111)
patch-o-matic. I have SEVERAL rules to deal with FORWARD chain, as I have 5
NICs in this machine.

    Well ...... what I think shouldnt being blocked is this:

[root@firewall log]# cat /var/log/messages | grep "=110 " | grep "Nov 22" |
grep forward
Nov 22 11:17:13 firewall kernel: bloq_forward_intadm:IN=eth2 OUT=eth0
SRC=172.16.1.2 DST=10.0.0.39 LEN=40 TOS=0x00 PREC=0x00 TTL=63 ID=6783 DF
PROTO=TCP SPT=110 DPT=1089 SEQ=3167588316 ACK=3598442 WINDOW=5840 RES=0x00
ACK FIN URGP=0
Nov 22 11:33:18 firewall kernel: bloq_forward_intadm:IN=eth2 OUT=eth0
SRC=172.16.1.2 DST=10.0.0.39 LEN=1500 TOS=0x00 PREC=0x00 TTL=63 ID=62904 DF
PROTO=TCP SPT=110 DPT=1109 SEQ=4150259894 ACK=4539767 WINDOW=5840 RES=0x00
ACK URGP=0
[root@firewall log]#

    eth0 is my internal network and eth2 is my DMZ network, where my mail
server is hosted. According to the log, these packets do NOT have the SYN
bit on.

    Why I think it shouldnt being blocked ??? Because it's only being
blocked in one or two connections a day. This is a very busy server. Almost
all the connections works fine, but once or twice I got these logs.

    Rules that matters are:

[root@firewall log]# iptables -nL FORWARD -v
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
[ ...... ]
  930 54630 forward_dmz_internaadm  all  --  eth2   eth0    0.0.0.0/0
0.0.0.0/0
[ ..... ]
[root@firewall log]#



(the state INVALID,RELATED,ESTABLISHED,UNTRACKED is translated from 'state !
NEW' from iptables command)
[root@firewall log]# iptables -nL forward_dmz_internaadm -v
Chain forward_dmz_internaadm (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     tcp  --  *      *       172.16.1.2
0.0.0.0/0           tcp spt:25 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     tcp  --  *      *       172.16.1.2
0.0.0.0/0           tcp spt:80 state INVALID,RELATED,ESTABLISHED,UNTRACKED
  930 54630 ACCEPT     tcp  --  *      *       172.16.1.2
0.0.0.0/0           tcp spt:110 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     tcp  --  *      *       172.16.1.2
0.0.0.0/0           tcp spt:443 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     udp  --  *      *       172.16.1.2
0.0.0.0/0           udp spt:53 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     tcp  --  *      *       172.16.1.2
0.0.0.0/0           tcp spt:53 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     tcp  --  *      *       172.16.1.3
0.0.0.0/0           tcp spt:80 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     tcp  --  *      *       172.16.1.3
0.0.0.0/0           tcp spt:443 state INVALID,RELATED,ESTABLISHED,UNTRACKED
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED
    0     0 forward_bloqueado_interna_adm  all  --  *      *       0.0.0.0/0
0.0.0.0/0
[root@firewall log]#


[root@firewall log]# iptables -V
iptables v1.2.9
[root@firewall log]#


    As you can notice, I restarted the firewall to apply some changes and
the counter are somehow low. There's, for example, no hit on
'forward_bloqueado_interna_adm' rule, which is the one that produces the log
I sent in the beggining of the message. Also notice that these drops were
logged when firewall was working normally, that means, NOT during a firewall
restart.


    The dropped and logged packet should have been allowed according to the
rules, but it wasnt. If I wasnt using the 'state ! NEW' clause, it would
have been allowed for sure, because source port/source address/destination
address matchs the rule. Do you have any idea of what can be happening here
? Any hint ? Any clue ? Any new patch ? Any patch that I shouldnt have
applied from patch-o-matic ??? Should I stop using state module in these
rules ?


    Sincerily,
    Leonardo Rodrigues



