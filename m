From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: GRE protocol .
Date: Thu, 06 May 2010 17:05:59 +0200
Message-ID: <4BE2DAD7.1050802@plouf.fr.eu.org>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>	 <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>	 <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com> <AANLkTimp13f0iEwb9QAg0CTGu5cQGMN8wsrGneEcFtD9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimp13f0iEwb9QAg0CTGu5cQGMN8wsrGneEcFtD9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

ratheesh k a =E9crit :
>>> iptable rules configured in my gateway machine (which act as a rout=
er)
>>> has no rule to allow GRE packet coming from wan side to pass thru.
>>> There is no ALGs loaded. Still i am able to establish a pptp
>>> connection. I can see GRE packet reached client machine using a
>>> wireshark .

This is probably because the GRE connection is created from inside by
the client machine. In PPTP, GRE encapsulation is used to transport PPP
packets ; PPP is a peer-to-peer protocol, not a client-server protocol,
so both ends may send packets at the same time. If the first GRE packet
is sent by the PPTP client it is allowed in by your ruleset and creates
the connection, so the subsequent GRE packets from the server are in th=
e
ESTABLISHED state and accepted. If the first GRE packet is sent by the
PPTP server, it is dropped by your ruleset but it does not matter,
because the connection will be created anyway when the client sends its
first GRE packet (see above case), and the server will eventuellaly
retransmit the dropped packets.

Note that if your router does masquerading, this works for only one PPT=
P
connection to the same server. For simultaneous connections from severa=
l
internal clients to the same server, you must use the PPTP helper, so
the router knows which client the return GRE packets are to be forwarde=
d to.

> pptp pass thru works because gre connection tracking  module was buil=
t
> as part of kernel in my linux machine. I thought pptp_connection
> tracking module is the ALG for pptp connection.

Yes it is (actually the module is named nf_conntrack_pptp, which uses
nf_conntrack_proto_gre).

> But without
> pptp_connection tracking also , pptp pass thru works fine .

Not in all situations, as I wrote above.

> Then, why we need pptp_connection_tracking  module ?

=46or instance you need it when several clients behind the same
masquerading router connect simulaneously to the same server, or when
the iptables ruleset does not allow any NEW packet out, so you must kno=
w
that a GRE packet is RELATED to an existing PPTP connection.
