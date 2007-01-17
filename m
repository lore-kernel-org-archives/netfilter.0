From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Filtering in PREROUTING
Date: Wed, 17 Jan 2007 16:17:58 -0600
Message-ID: <web-4020726@bk3.webmaillogin.com>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169069905.10134.18.camel@len.t-t-l.co.uk>
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
To: george <gk@t-t-l.co.uk>, netfilter@lists.netfilter.org

George:

I am not an iptables expert but I will try to explain my understanding ab=
out=20
filtering packets in the mangle table.

We knows that all tables have the chains PREROUTING, INPUT, OUTPUT,=20
POSTROUTING, FORWARD.

We knows too that not all packets traverse all chains because that depend=
s=20
on "the path" that packet follows, in other words, we must have in mind i=
f=20
the packet if a packet locally generated (you surfing Internet in the dev=
ice=20
that acts as firewall) or if the packet have as final destination the=20
firewall (supose that the firewall ("the gateway") is acting as a www ser=
ver=20
too and is receiving visits from Internet. The other thing is that packet=
=20
must be forwarded by the device.

Why filter in the mangle table? Internet is wild land. There are many=20
circunstances: an web browser generating anormal traffic because some=20
security hole in the web browser has been sucessfully exploited. A host=20
taken or contamined by a virus. In that circunstances, the tcp/ip traffic=
e=20
generated can have "illegal" headers or the traffice can be an attack to=20
some other device in our networks or to a device in remote network.

Inspecting the packets headers in the mangle table and dropping the anorm=
al=20
traffic must be another mechanic for the "sanity" of the protected networ=
ks.

I hope that my few paragraphs gives you some help to understand why filte=
r=20
in the mangle table. Of course, you must decide in what chain inside the=20
mangle put your rules to protect your networks.

Best regards,

Jorge D=C3=A1vila.


On Wed, 17 Jan 2007 21:38:24 +0000
  george <gk@t-t-l.co.uk> wrote:
> I've seen a few places telling me that you shouldn't filter in the
> mangle table.  However, it seems sensible to me to drop junk packets in
> PREROUTING rather than have to duplicate those rules in both INPUT and
>FORWARD.
>=20
> Having done this, I'm seeing packets dropped as invalid when I would
> expect them to be OK (but most traffic is behaving as expected).  Befor=
e
> I start digging into this I want to check if filtering in the mangle
> table really is stupid.
>=20
> Can anyone explain this to me, or point me somewhere that will tell me
> please.  I haven't found anything other than a simple statement
> anywhere.
>=20
> Thanks,
> George.
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
davila@nicaraguaopensource.com

