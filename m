From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables: hide the real web server from users
Date: Thu, 15 Feb 2007 11:55:20 +0100
Message-ID: <45D43C18.10100@plouf.fr.eu.org>
References: <354862.54159.qm@web33304.mail.mud.yahoo.com>
	<45D32DD7.80006@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45D32DD7.80006@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Grant Taylor a =E9crit :
> Tim Perton wrote:
>=20
>> I want my users to do a request like
>> http://a.b.c.d/1.php and then machine A to make the
>> same request to System B, get the results and send
>> them back to the user transparently.
>=20
> Technically you can do what you are wanting to do.  However there are a=
=20
> few caveats that you need to be aware of when doing such.
>=20
> 1)  System B will see System A as the connecting host, not the real cli=
ent.

This can be avoided. See below.

> 2)  If System B is not ""behind System A (as you have described it to=20
> not be) it will have to send the traffic back to System A which will=20
> then send the traffic back to the client.

This is the reason of the 1). In order for B to send replies to A, A has=20
to SNAT the forwarded connection with its own IP address. Unless you set=20
up some tunnel or VPN between A and B and use it for the forwarded=20
connexions (in both direction, so it may involve some advanced routing=20
on A for return traffic), making B virtually "behind" A.

client ---internet--- system A (NAT) =3D=3D=3Dtunnel=3D=3D=3D system B (s=
erver)

