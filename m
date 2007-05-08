From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NAT routing issues
Date: Wed, 09 May 2007 01:03:54 +0200
Message-ID: <464101DA.4070102@plouf.fr.eu.org>
References: <4640E893.1010206@bserved.nl>	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>	<4640FAD0.9050301@plouf.fr.eu.org>	<Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>
	<4640FDA9.5000706@bserved.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4640FDA9.5000706@bserved.nl>
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

Bas Verhoeven a =E9crit :
>>
>>> Assuming that the outbound server is the default gateway for the web=20
>>> server and receives the return traffic, of course.
>>
>> You'd be kinda screwed if that was not the case.
>=20
> The webserver has its own gateway, and that's not the outer box.

Don't look further. Here is why it does not work.

> Is there really no solution for this?

Use the outer box as a gateway, if it is in the same network. You do not=20
have to use it as the default gateway for all traffic but at least for=20
the HTTP return traffic. This could be done with iptables and advanced=20
routing on the web server, for instance using the source port 80 to MARK=20
packets or using CONNMARK/connmark.

You could try to use the NOTRACK target on the web server in order to=20
prevent the incoming SYN packets from creating a new connection, so the=20
replies could be SNATed. But I would not bet a euro-cent on such a dirty=20
method. If someone asks who suggested it, don't say it's me. ;-)

