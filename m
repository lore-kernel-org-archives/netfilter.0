From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: port forwarding through localhost
Date: Fri, 26 Jan 2007 23:18:57 +0100
Message-ID: <45BA7E51.40505@plouf.fr.eu.org>
References: <000001c74194$d484d9b0$0d01a8c0@Mobi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c74194$d484d9b0$0d01a8c0@Mobi>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Andy B. a =E9crit :
>=20
> Webserver that uses many many mySQL connections to 127.0.0.1 (Port 3306=
).
>=20
> Now I would like to put the mySQL server onto a dedicated machine witho=
ut
> changing the "127.0.0.1" setting on a few hundred websites.
>=20
> The new mySQL Server listens on 10.0.0.100:3306
>=20
> My first guess was the following ruleset on the webserver:
>=20
> iptables -t nat -A PREROUTING -p tcp -i lo --dport 3306 -j DNAT --to
> 10.0.0.100
>=20
> Then I tried to telnet 127.0.0.1 3306, which failed immediately

Of course. Locally generated packets don't go into the PREROUTING chain.

> I figured out the prerouting is no good for localhost and changed it in=
to:
>=20
> iptables -t nat -A OUTPUT -o lo -p tcp --dport 3306 -j DNAT --to
> 10.0.0.100:3306
>=20
> telnet 127.0.0.1 3306 seems to do something, but not what I expected:
>=20
> $ telnet 127.0.0.1 3333

Why 3333 ?

> Trying 127.0.0.1...
>=20
> <sleeping...... sleeping......>
>=20
> Timeout eventually.

Does connecting directly to the SQL server work (no filtering rule that=20
may block the connection) ?
What is the kernel version ? Since 2.6.11, DNAT in the OUTPUT chain does=20
not mangle the source address any more. But 127.0.0.1 is an invalid=20
address for external communication and is rejected by the re-routing=20
decision.

