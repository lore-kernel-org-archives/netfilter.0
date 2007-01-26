From: "Andy B." <globi@hot.lu>
Subject: RE: port forwarding through localhost
Date: Fri, 26 Jan 2007 23:29:49 +0100
Message-ID: <000301c74199$7db871f0$0d01a8c0@Mobi>
References: <000001c74194$d484d9b0$0d01a8c0@Mobi>
	<45BA7E51.40505@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45BA7E51.40505@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Sorry about the "3333", it was a typo. Of course I meant 3306.

My rules are working when we are talking about the external interfaces
(eth0), and the SQL Server is responding when talking directly to =
10.0.0.100

My complete ruleset looks like this:

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -F     =20
iptables -X
iptables -Z
iptables --table nat --flush
iptables --delete-chain=20
iptables --table nat --delete-chain

iptables --table nat --append POSTROUTING --out-interface eth0 -j =
MASQUERADE
iptables --table nat --append POSTROUTING --out-interface eth1 -j =
MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 3306 -j DNAT --to
10.0.0.100
iptables -t nat -A OUTPUT -o lo -p tcp --dport 3306 -j DNAT --to
10.0.0.100:3306

The last rule is causing trouble, and it is the most important one, in =
order
to not bother my customers to change their settings :-/

Andy

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Pascal =
Hambourg
Sent: Friday, January 26, 2007 23:19
To: netfilter@lists.netfilter.org
Subject: Re: port forwarding through localhost

Hello,

Andy B. a =E9crit :
>=20
> Webserver that uses many many mySQL connections to 127.0.0.1 (Port =
3306).
>=20
> Now I would like to put the mySQL server onto a dedicated machine =
without
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

> I figured out the prerouting is no good for localhost and changed it =
into:
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
What is the kernel version ? Since 2.6.11, DNAT in the OUTPUT chain does =

not mangle the source address any more. But 127.0.0.1 is an invalid=20
address for external communication and is rejected by the re-routing=20
decision.



