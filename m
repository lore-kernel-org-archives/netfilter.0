From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 12:30:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905126E@asimail2.alphanumeric.com>
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

> I attached output of iptables, y.y.y. is my WAN IP range and x.x.x. is =
a
> range
> outside. Problematic REJECT rule can be found in FORWARD chain.

upon further review--i think you'd be best to only match that rule on =
SYN packets, in addition to specifying the inbound interface.  something =
along the lines of:

  -A FORWARD -i $INTERNAL_IF -p tcp --syn -d $SQL_SERVER --dport 445 -j =
REJECT --reject-with tcp-reset

since the rule you're using according to:

Chain FORWARD (policy DROP 1 packets, 58 bytes)
 pkts bytes target     prot opt in     out     source               =
destination        =20
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0            =
sql.se.rv.er      tcp dpt:445 reject-with tcp-reset

is not narrowing down the interface/source, and is hit before any =
connection tracking occurs.  i've never used "-j REJECT --reject-with =
tcp-reset" without also specifying "--syn" as it could have very odd =
results (and also doesn't make sense from a TCP perspective)...

you should be able to test this from a client on the internal network by =
just typing "telnet <sql.srv.ip.addr> 445" and making sure you get back =
"Connection refused" instead of a timeout.

-j

