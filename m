From: "Robert Allmeroth" <Robert.Allmeroth@epygi.de>
Subject: Conntrack helper problems (patch-o-matic-20030107)
Date: Thu, 27 Feb 2003 17:16:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PIEIIGGHCLEGAPAHFMDOIENNCJAA.Robert.Allmeroth@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

hello,

I try to get a kernel 2.4.18 with patch-o-matic-20030107 running.
But i have some problems with the conntrack helpers. They simply
don't work .. *sigh*

i tried ftp, irc and h323. I compiled as module and kernel included,
same result..

normal masqerade works, i can do passive FTP, irc, http, normal stateful
inspection, etc..

i hope anybody can help me..

-------------

here is what i have / see:

FTP conntrack problem:
bash-2.05# cat /proc/net/ip_conntrack
tcp      6 431573 ESTABLISHED src=3D172.30.255.1 dst=3D10.20.0.17 sport=3D=
1572 dport=3D21 src=3D10.20.0.17 dst=3D10.20.10.197 sport=3D21
dport=3D1572 [ASSURED] use=3D1
EXPECTING: - use=3D1 proto=3D6 src=3D10.20.0.17 dst=3D10.20.10.197 sport=3D=
0 dport=3D1573

The sport=3D0 seems wrong to me..

my system:

bash-2.05# iptables -vnL PreStateful
Chain PreStateful (3 references)
 pkts bytes target     prot opt in     out     source               desti=
nation

  259 66567 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0=
.0/0
     state RELATED,ESTABLISHED
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0=
.0/0
     state INVALID
    0     0 DROP       all  --  eth1   *       0.0.0.0/0            0.0.0=
.0/0

bash-2.05# iptables -vnL -t nat
Chain PREROUTING (policy ACCEPT 476 packets, 60290 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation

Chain POSTROUTING (policy ACCEPT 3 packets, 447 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation

   24 13346 MASQUERADE  all  --  *      eth1    0.0.0.0/0            0.0.=
0.0/0

Chain OUTPUT (policy ACCEPT 7 packets, 1028 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation


Already applied: submitted/01_2.4.19
                 submitted/02_2.4.20
                 submitted/ipt_ULOG-mac_len-fix
                 submitted/ipt_multiport-invfix
                 pending/01_ip_conntrack_proto_tcp-lockfix
                 pending/02_newnat-udp-helper
                 pending/03_REJECT-fwspotting-phrack60-fix
                 pending/04_ftp-conntrack-msg-fix
                 pending/05_ECN-tcpchecksum-littleendian-fix
                 base/IPV4OPTSSTRIP
                 base/mport
                 base/psd
                 extra/eggdrop-conntrack
                 extra/h323-conntrack-nat
                 extra/ip_tables-proc
                 extra/mms-conntrack-nat
                 extra/pptp-conntrack-nat
                 extra/quake3-conntrack
                 extra/string

bash-2.05# cat /proc/net/ip_tables_matches
tcpmss
string
unclean
conntrack
state
ttl
length
esp
ah
dscp
ecn
psd
tos
owner
mport
multiport
pkttype
mac
mark
limit
helper
tcp
udp
icmp

bash-2.05# cat /proc/net/ip_tables_targets
TCPMSS
ULOG
IPV4OPTSSTRIP
LOG
REDIRECT
MASQUERADE
MARK
DSCP
ECN
TOS
MIRROR
REJECT
DNAT
SNAT

ERROR

best regards
  Robert

------------------
Epygi Labs DE           |  Herrenstra=DFe 23
Robert Allmeroth        |  76133 Karlsruhe
Tel: +49 721 20596 43   |  Fax: +49 721 20596 59


