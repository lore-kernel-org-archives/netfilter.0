From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Alternatives to window shaping?
Date: Thu, 30 Aug 2007 14:56:35 -0600
Message-ID: <web-81149085@bk1.webmaillogin.com>
References: <46D69FD7.3000405@expertron.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46D69FD7.3000405@expertron.co.za>
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
To: Justin Schoeman <justin@expertron.co.za>, netfilter@lists.netfilter.org

Justin:

TCP window scaling is an inherent behaviour of the tcp protocol and the=20
parameter can be tunned.

Because you didn't references the devices involved in the problematic link =

is very hard give you an opinion about the cause of the problem.

You mentioned the problem with the ingress shapping. Maybe is a problem wit=
h=20
different mtu crossing the frontier (e.g.: optical fiber to ethernet media)=
=20
or maybe is a problem in the traffic shapping itself (e.g.:bad=20
configuration).

In any event, I think that is not a good option "hacks" the protocol=20
inyecting packets to the tcp sessions.

Having a more information (like a traffic trace when the problem is=20
happening) will give us more elements to answer your question.

Jorge D=E1vila.

On Thu, 30 Aug 2007 12:45:43 +0200
  Justin Schoeman <justin@expertron.co.za> wrote:
> I have posted this before under another thread, but did not get many=20
>replies. So I thought I would post it under a more appropriate subject.
>=20
> OK, so we have a link that has a fair bandwidth, and a high latency. This=
=20
>means that TCP windows get nice and big.
>=20
> Now I have a problem with ingress shaping, because the current=20
>implementation just drops packets.  This means that we have to wait for th=
e=20
>sender to notice the packet drop (OK, or for the receiver to notice at out=
=20
>of order inbound backet). But either of these can take quite a while,=20
>during which the sender is still sending data at a rate higher than what=20
>you want to throttle it to.
>=20
> What I was considering was, instead of just dropping the packet, send out=
=20
>an ACK packet (to the sender of the packet we are dropping), repeating the=
=20
>last ack sequence, as recorded in the conntrack table.
>=20
> This should be the second ack the sender receives, which should=20
>immediately start a 'slow start' procedure, and get the sender to back off.
>=20
> This is still as wastefull as just dropping the packet, but should have a=
=20
>more immediate effect.
>=20
> The problem is, how will the sender and receiver respond? They may now=20
>receive a number of packets in completely unexpected order.
>=20
> Is this practical? Will it work? Will it help?
>=20
> Thanks!
> Justin
>=20
>=20

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

