From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables + access-list
Date: 28 May 2003 09:01:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054105303.692.2.camel@elendil.intranet.cartel-securite.net>
References: <03fd01c324e2$f9e6b0c0$6b0262d4@is.net.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03fd01c324e2$f9e6b0c0$6b0262d4@is.net.tr>
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
To: Burak Sahin <burak.sahin@is.net.tr>
Cc: netfilter@lists.netfilter.org

Le mer 28/05/2003 =E0 08:32, Burak Sahin a =E9crit :
> MY QUESTION is;
> For two networks, A.B.C.D/a.b.c.d and E.F.G.H/e.f.g.h how can I do this=
?
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
> A.B.C.D/a.b.c.d -j REDIRECT --to-port 3128
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
> E.F.G.H/e.f.g.h -j REDIRECT --to-port 3128

	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80
		-d A.B.C.D/a.b.c.d -j ACCEPT
	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80
		-d E.F.G.H/e.f.g.h -j ACCEPT
	iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80
		-j REDIRECT --to-port 3128

My 0.02=A4

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

