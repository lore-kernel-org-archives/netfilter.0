From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: firewalling
Date: 18 Feb 2003 11:19:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045563571.9150.116.camel@elendil.intranet.cartel-securite.net>
References: <3E5200A1.CDFD3C90@nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E5200A1.CDFD3C90@nerim.net>
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
To: Eric Constantineau <mekanik@nerim.net>
Cc: netfilter@lists.netfilter.org

Le mar 18/02/2003 =E0 10:45, Eric Constantineau a =E9crit :
> I still have problems with FTP, it has to be set with "enable firewall
> access" to be able to run well (I run cuteftp), passive mode or not.  I
> want ftp to be transparent as if there were no firewall at all, so user=
s
> are not annoyed by settings...

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

Then play with state stuff (NEW, ESTABLISHED and RELATED). FTP helper
will handle everything right when you'll authorize TCP port 21.

> Another thing is how could I set up a web server behind my firewall, I
> read a bit about DNAT and SNAT, but still doesnt work from internet.  I=
t
> works inside, in the same LAN, but over the net, the server is
> unreachable...
> See the problem is, all my lan, including the firewall, has the same WA=
N
> IP Address, lets say 1.2.3.4...  So when I connect to 1.2.3.4 with
> destination port 80, with my DNAT settings :
>=20
> iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
> --to-destination 4.3.2.1
> it should redirect all packets to the web server lan ip(4.3.2.1)

Yes it should.
If it does not work, it may be a FORWARD filtering problem. Have you
authorized such traffic through FORWARD rule e.g. :

	iptables -A FORWARD -m state --state ESTABLISHED -p tcp \
			-s 4.3.2.1 --sport 80 -j ACCEPT
	iptables -A FORWARD -m state --state NEW -p tcp -d 4.3.2.1 \
			--dport 80 -j ACCEPT

If not, it won't work.

> then for the connexion within the LAN to this server I still have to ad=
d
> this line :
> iptables -t nat -A POSTROUTING -s 4.3.2.1 -p tcp --sport 80 -j SNAT
> --to-source 1.2.3.4

No, you don't.
Once a connection est established from outside to this server, it is
handled automagicly by Netfilter NAT stuff. This rule will be useful if
your 4.3.2.1 is to established connections to the outside, which does
not seem, regarding your rule, to be the case.

Things you can do are :

	. look at counters to see which rules are matching packets :

		iptables -L -v
		iptables -t nat -L -v

	. add debugging stuff using LOG target to track your packets


Should also read Linux Mag' HS 12, there's an article on Netfilter's
internals that can help you understand the NAT is going ;)))


--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


