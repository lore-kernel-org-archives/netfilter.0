From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: state matching vrs prerouting.... ???
Date: 21 Mar 2003 16:14:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048259686.6912.10.camel@elendil.intranet.cartel-securite.net>
References: <20030321145311.14296.qmail@web40203.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030321145311.14296.qmail@web40203.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le ven 21/03/2003 =E0 15:53, SBlaze a =E9crit :
> # iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
> # iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED=
 -j
> ACCEPT
>=20
> # CounterStrike NAT Line
> #
> iptables -t nat -A PREROUTING -p udp --dport 27015 -i eth0 -j DNAT
> --to-destination 192.168.1.25:27015
>=20
> Ok the UDP filters physically come before my CounterStrike line. In rea=
ding
> Oskar's tutorial I as under the impression that the nat tables rules to=
ok
> precedence before the filter tables....

They have. Moreover, there's no filter chain at NF_IP_PRE_ROUTING hook.

> However the UDP rules drop the incoming CS requests before they are
> prerouted... What gives?=20

Once your packet has been handled by NAT stuff, it has to be authorized
by filter stuff. In your ruleset, two things are quite strange to me.

First, your filtering rules are in INPUT chain. As far as I understand
your point, you are trying to nat CS stuff to an internal host. So
packets will get routed, and so have to be filtered in FORWARD chain.

Second, you drop packets with state NEW. If you do so, no one will be
able to connect.


--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


