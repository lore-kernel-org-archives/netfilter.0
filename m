From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Redirect my internat web server
Date: Sat, 18 Jan 2003 17:23:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E297F65.1040702@istitutocolli.org>
References: <F60TcZJ8R6BDH5oJTE10000304c@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F60TcZJ8R6BDH5oJTE10000304c@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

iptables -A PREROUTING -t nat -p tcp -d 1.1.1.1 --dport 8000 -j DNAT -to=20
3.3.3.3
iptables -t nat -A POSTROUTING -d 3.3.3.3 --dport 8000 -j SNAT=20
--to-source 1.1.1.1

that should be enough.
regards,
andrea

H=E9lio Dubeux wrote:
> I have a machine with squid + nat with an valid ip (1.1.1.1) and a fals=
e=20
> ip (2.2.2.2) and running apache on port 80, i want to publish another=20
> apache server on port 8000 in a machine with ip (3.3.3.3). how can i do=
=20
> this redirect? I=B4ve already used:
>=20
> iptables -A PREROUTING -t nat -p tcp -d 1.1.1.1 --dport 8000 -j DNAT -t=
o=20
> 3.3.3.3:8000
>=20
> My clients type on their browser http://1.1.1.1:8000 and i wanto to sho=
w=20
> the content of 3.3.3.3:8000
>=20
> Anyone can plz help me?
>=20
>=20
> ----------------------
> H=E9lio Dubeux Neto
>=20
>=20
>=20
>=20
> _________________________________________________________________
> MSN Hotmail, o maior webmail do Brasil. http://www.hotmail.com
>=20
>=20
>=20
>=20


