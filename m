From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 12:14:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01f501c47fbe$58db0900$a900a8c0@cybergeneration.com>
References: <D5C9032B2B09C64EA2409D6214E91AC905126C@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_01F2_01C47F9C.D18C38F0"
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
To: Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_01F2_01C47F9C.D18C38F0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Thanks for reply,
    here are some more details :

simple NAT device which has
eth0 on LAN 192.168.0.x
eth1 on WAN (dedicated ethernet link with static IP)

[root@natasha /]# iptables -V
iptables v1.2.9

[root@natasha /]# uname -a
Linux natasha.cybergeneration.com 2.4.20-16.9 #1 Thu May 22 18:22:56 EDT
2003 i686 i686 i386 GNU/Linux

I attached output of iptables, y.y.y. is my WAN IP range and x.x.x. is a
range
outside. Problematic REJECT rule can be found in FORWARD chain.

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, August 11, 2004 11:44 AM
Subject: RE: Question about REJECT in FORWARD rule


> What I'd like to do is something like :
> $IPTABLES -A FORWARD -i $LAN_IFACE -p tcp --dport 445 --dst
sql.se.rv.er -j
> REJECT --reject-with tcp-reset
>
> My problem :
> Packet seems OK (iptables change source ip and port) and is
> TCP RST, but it is sent to the external interface, and my LAN
> hosts do not get the reply and must wait for a timeout to occur
> (since another firewall protects the SQL Server and drops TCP 445)
>
> Is there any way to force an interface for the REJECT rule ?
>
> Is there any configuration that could cause this to happen ?

there is something wrong with your configuration.  post the output of
"iptables -vnL; iptables -vnL -t nat; iptables -vnL -t mangle" and clue us
in as to which interface is inside, outside, dmz, etc...

-j

------=_NextPart_000_01F2_01C47F9C.D18C38F0
Content-Type: text/plain;
	name="iptables_nvL_mangle.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables_nvL_mangle.txt"

Chain PREROUTING (policy ACCEPT 1898 packets, 337K bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
   69  4892 TOS        udp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:53 TOS set 0x10=20
    0     0 TOS        tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp spt:22 TOS set 0x10=20
   63 74359 TOS        tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp spt:80 TOS set 0x08=20

Chain INPUT (policy ACCEPT 335 packets, 23221 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20

Chain FORWARD (policy ACCEPT 1559 packets, 313K bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20

Chain OUTPUT (policy ACCEPT 197 packets, 17553 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20

Chain POSTROUTING (policy ACCEPT 1741 packets, 328K bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20

------=_NextPart_000_01F2_01C47F9C.D18C38F0
Content-Type: text/plain;
	name="iptables_nvL_nat.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables_nvL_nat.txt"

Chain PREROUTING (policy ACCEPT 112 packets, 10305 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
   21  1126 MASQUERADE  all  --  *      eth1    192.168.0.0/24       =
0.0.0.0/0          =20

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20

------=_NextPart_000_01F2_01C47F9C.D18C38F0
Content-Type: text/plain;
	name="iptables_nvL.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables_nvL.txt"

Chain INPUT (policy DROP 1 packets, 40 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    3   268 ACCEPT     all  --  lo     *       0.0.0.0/0            =
0.0.0.0/0          =20
  134  8046 CHECK_BANNED_IPS_IN  all  --  *      *       0.0.0.0/0       =
     0.0.0.0/0          =20
  134  8046 IN_FIREWALL  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::INPUT '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain FORWARD (policy DROP 1 packets, 58 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0            =
sql.se.rv.er      tcp dpt:445 reject-with tcp-reset=20
  291  105K IN_NAT     all  --  eth1   eth0    0.0.0.0/0            =
0.0.0.0/0          =20
  232 23807 OUT_NAT    all  --  eth0   eth1    0.0.0.0/0            =
0.0.0.0/0          =20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain OUTPUT (policy DROP 10 packets, 2892 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    3   268 ACCEPT     all  --  *      lo      0.0.0.0/0            =
0.0.0.0/0          =20
   78  6361 OUT_FIREWALL  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::OUTPUT '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain BAD_IP (22 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::BAD_IP '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain BAD_STATE (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::BAD_STATE '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain BAD_TCP_FLAGS (11 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::BAD_TCP_FLAGS =
'=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain BANNED_IP (2 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::BANNED_IP '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain CHECK_BAD_IPS_IN (2 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/8            =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       10.0.0.0/8           =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       127.0.0.0/8          =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       169.254.0.0/16       =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       172.16.0.0/12        =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       192.0.0.0/24         =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       224.0.0.0/4          =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       240.0.0.0/5          =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  *      *       255.255.255.255      =
0.0.0.0/0          =20

Chain CHECK_BAD_IPS_OUT (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
0.0.0.0/8          =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
10.0.0.0/8         =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
127.0.0.0/8        =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
169.254.0.0/16     =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
172.16.0.0/12      =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
192.0.0.0/24       =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
224.0.0.0/4        =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
240.0.0.0/5        =20
    0     0 BAD_IP     all  --  *      *       0.0.0.0/0            =
255.255.255.255    =20

Chain CHECK_BAD_STATE (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 BAD_STATE  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state INVALID=20

Chain CHECK_BANNED_IPS_IN (2 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 BANNED_IP  all  --  *      *       1.1.1.1              =
0.0.0.0/0          =20

Chain CHECK_BANNED_IPS_OUT (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 BANNED_IP  all  --  *      *       0.0.0.0/0            =
1.1.1.1            =20

Chain CHECK_TCP_FLAGS (2 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x11/0x01=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x18/0x08=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x30/0x20=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x05/0x05=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x03/0x03=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x06/0x06=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x3F/0x3F=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x3F/0x00=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x3F/0x29=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x3F/0x2B=20
    0     0 BAD_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp flags:0x3F/0x37=20

Chain CHECK_TCP_SYN_FLOOD (0 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 RETURN     all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           limit: avg 5/sec burst 10=20
    0     0 TCP_SYN_FLOOD  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain IN_FIREWALL (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
  134  8046 CHECK_BAD_STATE  all  --  *      *       0.0.0.0/0           =
 0.0.0.0/0          =20
  134  8046 IN_IP_CHECK  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20
    0     0 IN_FIREWALL_ICMP  icmp --  *      *       0.0.0.0/0          =
  0.0.0.0/0          =20
  107  5699 CHECK_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0          =20
    0     0 ACCEPT     tcp  --  *      *       192.168.0.0/24       =
0.0.0.0/0           tcp dpt:22 state NEW=20
  109  5947 ACCEPT     all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 DROP       udp  --  eth0   *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:67=20
    0     0 DROP       udp  --  eth0   *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:68=20
    0     0 DROP       udp  --  eth0   *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:135=20
   22  1716 DROP       udp  --  eth0   *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:137=20
    1   229 DROP       udp  --  eth0   *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:138=20
    0     0 DROP       udp  --  eth0   *       0.0.0.0/0            =
0.0.0.0/0           udp dpt:1900=20
    2   154 DROP       udp  --  eth1   *       y.y.y.209        =
0.0.0.0/0           udp dpt:712=20
    0     0 DROP       udp  --  eth1   *       x.x.x.1         0.0.0.0/0 =
          udp dpt:520=20
    0     0 DROP       udp  --  eth1   *       y.y.y.193        =
0.0.0.0/0           udp dpt:520=20
    0     0 DROP       2    --  eth0   *       192.168.0.200        =
224.0.0.1          =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::IN_FIREWALL '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain IN_FIREWALL_ICMP (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 ACCEPT     icmp --  *      *       192.168.0.0/24       =
0.0.0.0/0           icmp type 8=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           icmp type 3=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           icmp type 4=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           icmp type 11=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           icmp type 12=20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix =
`firewall::IN_FIREWALL_ICMP '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain IN_IP_CHECK (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
  134  8046 CHECK_BAD_IPS_IN  all  --  *      *       0.0.0.0/0          =
  0.0.0.0/0          =20
    0     0 BAD_IP     all  --  eth0   *       192.168.0.1          =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  eth0   *       y.y.y.195        =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  eth1   *       192.168.0.0/24       =
0.0.0.0/0          =20
    0     0 BAD_IP     all  --  eth1   *       y.y.y.195        =
0.0.0.0/0          =20

Chain IN_NAT (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
  291  105K CHECK_BANNED_IPS_IN  all  --  *      *       0.0.0.0/0       =
     0.0.0.0/0          =20
  291  105K CHECK_BAD_IPS_IN  all  --  *      *       0.0.0.0/0          =
  0.0.0.0/0          =20
  272  102K ACCEPT     tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
   19  2588 ACCEPT     udp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 ACCEPT     47   --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::IN_NAT '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain OUT_FIREWALL (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
   78  6361 OUT_IP_CHECK  all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20
   76  6215 CHECK_TCP_FLAGS  tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0          =20
   78  6361 ACCEPT     all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            =
192.168.0.3         udp dpt:53=20
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            =
192.168.0.5         udp dpt:53=20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            =
x.x.x.33       tcp dpt:3306=20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            =
x.x.x.33       tcp dpt:21=20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::OUT_FIREWALL ' =

    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain OUT_IP_CHECK (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
   78  6361 CHECK_BAD_IPS_OUT  all  --  *      *       0.0.0.0/0         =
   0.0.0.0/0          =20
   76  5922 RETURN     all  --  *      eth0    192.168.0.1          =
0.0.0.0/0          =20
    2   439 RETURN     all  --  *      eth1    y.y.y.195        =
0.0.0.0/0          =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::OUT_IP_CHECK ' =

    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain OUT_NAT (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
  232 23807 CHECK_BANNED_IPS_OUT  all  --  *      *       0.0.0.0/0      =
      0.0.0.0/0          =20
    3   156 ACCEPT     tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state NEW=20
   14  1052 ACCEPT     udp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state NEW=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           state NEW=20
    0     0 ACCEPT     47   --  *      *       0.0.0.0/0            =
0.0.0.0/0           state NEW=20
  199 21475 ACCEPT     tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
   16  1124 ACCEPT     udp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 ACCEPT     47   --  *      *       0.0.0.0/0            =
0.0.0.0/0           state RELATED,ESTABLISHED=20
    0     0 LOG        tcp  --  *      *       0.0.0.0/0            =
0.0.0.0/0           tcp dpt:23456 LOG flags 0 level 7 prefix =
`firewall::OUT_NAT '=20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::OUT_NAT '=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

Chain TCP_SYN_FLOOD (1 references)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0           LOG flags 0 level 7 prefix `firewall::TCP_SYN_FLOOD =
'=20
    0     0 DROP       all  --  *      *       0.0.0.0/0            =
0.0.0.0/0          =20

------=_NextPart_000_01F2_01C47F9C.D18C38F0--


