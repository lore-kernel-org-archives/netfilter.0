From: "Britt Tabor" <btabor@edgeaccess.net>
Subject: ip_conntrack_ftp
Date: Mon, 13 Oct 2003 17:22:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDF3100EBB9E3A47B84F816A10D9A4E5A8E3@eai-exchange.edgeaccess.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

I'm having a problem with ftp. My ftp-data is not passing through my =
firewall. I have configured the firewall for MASQ and ALL policys are =
set to ACCEPT (I know unsecure Im just trying to get it to work first). =
Anyway, I have ip_conntrack_ftp loaded and I can connect through the =
firewall and pwd but of course when I ls or data transfer I get errors. =
ftp client error Illegal PORT command or data connection refused. And =
dmesg says max number of expected connections.  My iptables lists looks =
like this

bash-2.05# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere          =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20
bash-2.05# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SNAT       all  --  anywhere             anywhere           to:x.x.x.x

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination =20


lsmod:
bash-2.05# lsmod
Module                  Size  Used by
ip_conntrack_ftp        3856   0  (unused)
vhub                    9664   0  (unused)
iptable_nat            14432   1  (autoclean)
ip_conntrack           16656   2  (autoclean) [ip_conntrack_ftp =
iptable_nat]
iptable_filter          1760   1  (autoclean)
via-rhine              12768   1=20
eepro100               18432   1=20
mii                     2160   0  [via-rhine eepro100]
pcmcia_core            40608   0=20
doc                   146464   1

why does my ftp data still get block/dropped ???

if I switch the ftp client to passive it works fine but I need it to =
work both ways...

=A0
=A0
Britt Tabor
Edge Access, Inc.
btabor@edgeaccess.net
http://www.edgeaccess.net
813.594.6142 Voice
813.249.1126 Fax
=A0
=A0
=A0


