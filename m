From: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Subject: DNAT - again (minor fault .. i hope ;) )
Date: Mon, 12 Jul 2004 13:54:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <519AD2BA94FC6E4DB5DE078B2E37CB10B6ED05@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hello gurus,

if I try to telnet from my 172 network to my host 172.25.239.212
(DNAT'ed 11.0.0.48), he gives me no login. A ping on the other hand is
working.=20
I have the feeling that the "new" packets arrive, but the syn,ack is
somewhere lost. Check also out the log.
Like you see I opened everything, to exclude it from my problem. Any
other advice you can give me (what to drop?, all by default ?)

Do you have any ideas ?

the problem :

Pinging 172.25.239.212 with 32 bytes of data:
Reply from 172.25.239.212: bytes=3D32 time=3D5ms TTL=3D63

I can "connect" myself to the telnet port, but I get a blank screen (no
login). (escape character cntr-] works)
Not only the telnet is the problem, things like ftp, http give relativly
the same issue.

the script :

ifconfig eth1:2 172.25.239.212 netmask 255.255.255.224 broadcast
255.255.255.223 up
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -N RULE_0
echo 1 > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t nat -A PREROUTING -p tcp -d 172.25.239.212 -j DNAT
--to-destination 11.0.0.48
$IPTABLES -A FORWARD -p tcp -d 172.25.239.212 -m state --state
ESTABLISHED,RELATED -j RULE_0
$IPTABLES -t nat -A POSTROUTING -p tcp -d 11.0.0.48 -j SNAT --to-source
172.25.239.212
$IPTABLES -A RULE_0 -j LOG  --log-level info --log-prefix "RULE 0 --
ACCEPT "
$IPTABLES -A RULE_0 -j ACCEPT

this what I find in the log :
Jul 12 12:43:38 linuxrouter kernel: RULE 0 -- ACCEPT IN=3Deth0 =
OUT=3Deth0
SRC=3D172.25.204.80 DST=3D11.0.0.48 LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D126
ID=3D21950 DF PROTO=3DTCP SPT=3D1175 DPT=3D23 WINDOW=3D0 RES=3D0x00 RST =
URGP=3D0=20
Jul 12 12:43:38 linuxrouter kernel: RULE 0 -- ACCEPT IN=3Deth0 =
OUT=3Deth0
SRC=3D172.25.204.80 DST=3D11.0.0.48 LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D126
ID=3D21951 PROTO=3DTCP SPT=3D1175 DPT=3D23 WINDOW=3D0 RES=3D0x00 RST =
URGP=3D0=20
Jul 12 12:59:19 linuxrouter kernel: RULE 0 -- ACCEPT IN=3Deth0 =
OUT=3Deth0
SRC=3D172.25.204.80 DST=3D11.0.0.48 LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D126
ID=3D26640 DF PROTO=3DTCP SPT=3D1218 DPT=3D23 WINDOW=3D17640 RES=3D0x00 =
ACK URGP=3D0=20
Jul 12 12:59:22 linuxrouter kernel: RULE 0 -- ACCEPT IN=3Deth0 =
OUT=3Deth0
SRC=3D172.25.204.80 DST=3D11.0.0.48 LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D126
ID=3D26651 DF PROTO=3DTCP SPT=3D1218 DPT=3D23 WINDOW=3D17640 RES=3D0x00 =
ACK FIN
URGP=3D0=20


[root@linuxrouter root]# iptables -t nat -L -nvx
Chain PREROUTING (policy ACCEPT 26961 packets, 1495151 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       1       48 DNAT       tcp  --  *      *       0.0.0.0/0
172.25.239.212     to:11.0.0.48=20

Chain POSTROUTING (policy ACCEPT 9866 packets, 474179 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       1       48 SNAT       all  --  *      *       0.0.0.0/0
11.0.0.48          to:172.25.239.212=20

Chain OUTPUT (policy ACCEPT 30 packets, 2068 bytes)
    pkts      bytes target     prot opt in     out     source
destination =20


=20
[root@linuxrouter root]# iptables -L -nvx
Chain INPUT (policy ACCEPT 21 packets, 1008 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
      76     6800 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20

Chain FORWARD (policy ACCEPT 13 packets, 584 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0        0 RULE_0     tcp  --  *      *       0.0.0.0/0
172.25.239.212     state NEW,RELATED,ESTABLISHED=20

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
destination        =20
      74     6396 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED=20

Chain RULE_0 (1 references)
    pkts      bytes target     prot opt in     out     source
destination        =20
       0        0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 6 prefix `RULE 0 -- ACCEPT '=20
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0    =20


