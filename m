From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 13:37:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <023001c47fc9$d7d74560$a900a8c0@cybergeneration.com>
References: <D5C9032B2B09C64EA2409D6214E91AC905126E@asimail2.alphanumeric.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <Jopperisano@alphanumeric.com>, netfilter@lists.netfilter.org


Thanks again Jason,
    I totally agree with your points about specify
IN, OUT and SYN

Now with some -j LOG i can see the packet going
into OUTPUT with eth1 as dst interface

Now it gets into my anti-spoof rule :
Aug 11 13:20:17 natasha kernel: firewall::OUT_IP_CHECK IN=3D OUT=3Deth1
SRC=3Dsql.se.rv.er DST=3D192.168.0.149 LEN=3D40 TOS=3D0x00
 PREC=3D0x00 TTL=3D255 ID=3D0 DF PROTO=3DTCP SPT=3D445 DPT=3D3394 WINDOW=3D=
0 RES=3D0x00 ACK
RST URGP=3D0

If i open this rule, i can see the packet adressed to 192.168.0.149
sent on eth1 (WAN) with tcpdump.

Any other ideas ?

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, August 11, 2004 12:30 PM
Subject: RE: Question about REJECT in FORWARD rule


> I attached output of iptables, y.y.y. is my WAN IP range and x.x.x. is a
> range
> outside. Problematic REJECT rule can be found in FORWARD chain.

upon further review--i think you'd be best to only match that rule on SYN
packets, in addition to specifying the inbound interface.  something along
the lines of:

  -A FORWARD -i $INTERNAL_IF -p tcp --syn -d $SQL_SERVER --dport 445 -j
REJECT --reject-with tcp-reset

since the rule you're using according to:

Chain FORWARD (policy DROP 1 packets, 58 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0
sql.se.rv.er      tcp dpt:445 reject-with tcp-reset

is not narrowing down the interface/source, and is hit before any connection
tracking occurs.  i've never used "-j REJECT --reject-with tcp-reset"
without also specifying "--syn" as it could have very odd results (and also
doesn't make sense from a TCP perspective)...

you should be able to test this from a client on the internal network by
just typing "telnet <sql.srv.ip.addr> 445" and making sure you get back
"Connection refused" instead of a timeout.

-j


