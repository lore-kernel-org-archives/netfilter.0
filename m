From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Re: Redirect my internat web server
Date: 20 Jan 2003 09:01:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043046117.8950.41.camel@bigblue>
References: <F60TcZJ8R6BDH5oJTE10000304c@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?H=E9lio?= Dubeux <hdubeux@hotmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-01-17 at 20:06, H=E9lio Dubeux wrote:
> I have a machine with squid + nat with an valid ip (1.1.1.1) and a false =
ip=20
> (2.2.2.2) and running apache on port 80, i want to publish another apache=
=20
> server on port 8000 in a machine with ip (3.3.3.3). how can i do this=20
> redirect? I=B4ve already used:
>=20
> iptables -A PREROUTING -t nat -p tcp -d 1.1.1.1 --dport 8000 -j DNAT -to=20
> 3.3.3.3:8000
>=20
> My clients type on their browser http://1.1.1.1:8000 and i wanto to show =
the=20
> content of 3.3.3.3:8000
>=20
> Anyone can plz help me?
>=20

The PREROUTING seems fine, just remember to also add a FORWARD rule to
allow the packet to be 'forwarded' to 3.3.3.3

Paulo


