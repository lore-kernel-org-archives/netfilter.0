From: Patrick Petermair <captain.nuke@gmx.at>
Subject: Strange log entries (again)
Date: Mon, 8 Jul 2002 22:43:35 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207082243.35434.captain.nuke@gmx.at>
Reply-To: captain.nuke@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi!

I have found the following log entry in my firewall log (I'm running RedH=
at=20
7.3 with iptables for firewalling and masquerading):

Jul  8 22:25:11 wormhole kernel: IN=3Dppp0 OUT=3D MAC=3D SRC=3D207.171.16=
9.16=20
DST=3D213.225.41.145 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D49 ID=3D21031 =
DF PROTO=3DTCP=20
SPT=3D80 DPT=3D42111 WINDOW=3D8760 RES=3D0x00 ACK RST URGP=3D0

The thing is that this is an answer from a website (SPT=3D80) I surfed on=
=20
(www.amazon.de) - but my forward chain should detect it as an existing=20
connection and let it through:

#echo "   FWD: Allow all connections OUT and only existing and related on=
es=20
IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,REL=
ATED=20
-j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

I can access this website and everything works fine, I just don't underst=
and=20
why a few packets get blocked at my firewall and not routed through! Is t=
his=20
a bug in the conntrack module?
Btw: What do the ACK and RST flags mean? Where can I find some infos abou=
t the=20
existing flags?

Thnx so far!
Patrick

--=20
http://www.petermair.com

