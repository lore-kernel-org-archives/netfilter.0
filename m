From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: state matching vrs prerouting.... ???
Date: Fri, 21 Mar 2003 12:37:06 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030321203706.30847.qmail@web40208.mail.yahoo.com>
References: <1048259686.6912.10.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048259686.6912.10.camel@elendil.intranet.cartel-securite.net>
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
Content-Transfer-Encoding: quoted-printable
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

--- Cedric Blancher <blancher@cartel-securite.fr> wrote:
> Le ven 21/03/2003 =E0 15:53, SBlaze a =E9crit :
> > # iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
> > # iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED=
 -j
> > ACCEPT
> >=20
> > # CounterStrike NAT Line
> > #
> > iptables -t nat -A PREROUTING -p udp --dport 27015 -i eth0 -j DNAT
> > --to-destination 192.168.1.25:27015
> >=20
> > Ok the UDP filters physically come before my CounterStrike line. In rea=
ding
> > Oskar's tutorial I as under the impression that the nat tables rules to=
ok
> > precedence before the filter tables....
>=20
> They have. Moreover, there's no filter chain at NF_IP_PRE_ROUTING hook.
>=20
> > However the UDP rules drop the incoming CS requests before they are
> > prerouted... What gives?=20
>=20
> Once your packet has been handled by NAT stuff, it has to be authorized
> by filter stuff. In your ruleset, two things are quite strange to me.
>=20
> First, your filtering rules are in INPUT chain. As far as I understand
> your point, you are trying to nat CS stuff to an internal host. So
> packets will get routed, and so have to be filtered in FORWARD chain.
>=20
> Second, you drop packets with state NEW. If you do so, no one will be
> able to connect.
>=20
>=20
> --=20
> C=E9dric Blancher  <blancher@cartel-securite.fr>
> IT systems and networks security expert  - Cartel S=E9curit=E9
> Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
> PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE
>=20
 That is somewhat correct. What I read in Oskar's tutorial led me to believe
that i could preroute the CS requests so that they would in a sence bypass =
or
not pass through the UDP input filters. I am somewhat confused as to why th=
ey
do?





=3D=3D=3D=3D=3D
"No touchy NO TOUCHY! Emperor Kuzko -=3DEmperor's New Groove=3D-"

__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com

