From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: A netfilter 'if possible' question
Date: Wed, 26 Jul 2006 12:37:04 +0200
Message-ID: <44C745D0.3070302@plouf.fr.eu.org>
References: <5bdb1aa70607260229h5742562djf4065dfb70dfbb6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5bdb1aa70607260229h5742562djf4065dfb70dfbb6c@mail.gmail.com>
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

Simon a =E9crit :
>=20
> I understand NAT to the level that i currently use it, to send certain
> ports from our DSL link to various different servers within our
> internal network.

This is "port forwarding", which is a common application of Destination=20
NAT (DNAT).

> Is it possible to do this to an outside IP address.

Yes, but...

> eg. zzz.zzz.zzz.zzz sends http requests to port 80 and 443 on
> xxx.xxx.xxx.xxx, then have netfilter NAT those requests thru to port
> 80/443 on yyy.yyy.yyy.yyy, both x and y being different real world IP
> addresses and on different subnets? (physically seperate servers).

... one condition for this to work as expected is "symmetric" routing. I=20
explain. Forward packets go from the client to the NAT box, then from=20
the NAT box to the server. Return packets *must* go from the server back=20
to the NAT box, then from the NAT box back to the client. Else they=20
would come back directly to the client with the wrong source address,=20
that is the server address instead of the NAT box address expected by=20
the client. This is basically the same problem as port redirection to a=20
server which is on the same LAN as the client.

In a controlled network, the symmetric routing condition can be met by=20
the routing topology. But if both the client and the server are anywhere=20
on the real internet, this condition is not true. So, to force return=20
packets to go back to the NAT box, you must do Source NAT (SNAT) to=20
masquerade the client address with the NAT box address. See=20
<http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html>.

Be aware that because of SNAT the server will only see the NAT box=20
address as the source of the redirected connections ; it will not see=20
the real client address. In case of abuse, the only address in the=20
server logs will be the NAT box address.

