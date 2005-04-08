From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Redirecting mail
Date: Fri, 8 Apr 2005 14:06:15 +0200
Message-ID: <MS_LEU1npC2AyrEuWRO000007f2@smtp.ttp.nl>
References: <001701c53c2f$6f97dc80$648045ac@sneak>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
In-Reply-To: <001701c53c2f$6f97dc80$648045ac@sneak>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> > There is no need to use multiport because you only DNAT 1=20
> port : smtp.
> > But that should not be a problem.
> >
> > iptables -t nat -A OUTPUT -p tcp --dports smtp \ -j DNAT=20
> > --to-destination 192.168.12.56
>=20
>=20
> if I try it without the multiport option i get the following
> error..
>=20
> [root@posjia0h01 root]# iptables -t nat -A OUTPUT -p tcp=20
> --dports smtp -j DNAT --to-destination 192.168.12.56 iptables=20
> v1.2.5: Unknown arg `--dports'
> Try `iptables -h' or 'iptables --help' for more information.

Sorry, that should be "--dport", not "--dports".

> this is strange...
>=20
>=20
> Ive got another mailserver 172.24.128.56 ..
> now if I put that rule in
>=20
>  iptables -t nat -A OUTPUT -p tcp -m multiport --dports smtp =20
> -j DNAT --to-destination 192.168.12.56
>=20
> and if I try telnet to any mail server on the internet , i connect to
> 192.168.12.56 (Which should happen on 172.20.128.56)

So if the rule works on 172.24.128.56, it should also be correct for
172.20.128.56.

> [root@poscpt0h01 root]# telnet 196.31.155.18 25 Trying=20
> 196.31.155.18...
> Connected to 196.31.155.18.
> Escape character is '^]'.
> 220 c ESMTP Sendmail 8.12.8/8.12.8;=20
> Fri, 8 Apr 2005
> 17:30:45 +0200

prxsaa0z02.ipnetwork.co.za is 192.168.12.56 I suppose ?

> is there noway to make it connect directly to 196.31.155.18,=20
> but using 192.168.12.56 as a gateway

I think you'd need a smtp proxy to do that (right now you're using
192.168.12.56 as a mail-gateway because it forwards mail from other
mailservers.)
Perhaps if you run a smtp proxy on port 26 or so, and forward other
mailservers to that port (192.168.12.56 is already running a mailserver
on port 25) :

iptables -t nat -A OUTPUT -p tcp --dport smtp \
  -j DNAT --to 192.168.12.56:26
And let the smtp proxy connect to an internet MTA on port 25. But this
way you still don't connect directly to the receiving MTA.


Gr,
Rob




********* DISCLAIMER *********=20
De informatie in dit E-mail bericht is uitsluitend bestemd voor de =
geadresseerde. Verstrekking aan en gebruik door anderen is niet =
toegestaan.
Door de elektronische verzending van het bericht kunnen er geen rechten =
worden ontleend aan de informatie. TTP staat niet in voor de juiste en =
volledige overbrenging van de inhoud van een verzonden E-mail, noch voor =
tijdige ontvangst daarvan.=20


