From: Michael Vallaly <netfilter@nolatency.com>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 17:07:52 -0600
Message-ID: <20110117170752.a10b99de.netfilter@nolatency.com>
References: <4D341710.60509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D341710.60509@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Cc: netfilter@vger.kernel.org


Have you tried the RAWNAT modules from xtables-addons?=20

<snip>
iptables -A OUTPUT -s $ORIG_IP -j RAWSNAT --to-source $NEW_IP
</snip>

I've used RAWSNAT in the past, with fairly good success.

-Mike

On Mon, 17 Jan 2011 11:16:48 +0100
GMail Isaac Gonzalez <isaak.gonzalez@gmail.com> wrote:

> Hi,
>=20
> I need to modify the reply packets of one web server to allow the=20
> connections between a webserver and client using a load balancer.
>=20
> The client connections goes to a load balancer, the load balancer=20
> forwards the connection to a one web server changing the destination =
ip,=20
> the web server anwser the client with it's own ip address without=20
> passing again for the load balancer. In order to stablish the=20
> connection, the client needs to receive the web server answer with th=
e=20
> correct ip address (in this case, the load balancer VIP address), in=20
> other case it receives ACK that it doesn't know about it and the=20
> connections is not ESTABLISHED.
>=20
> I've doing some testing and seems that iptables only do SNAT on NEW=20
> connections, and I need to change the ip address of replied packets.=20
> Anybody know some workaround? If anobody do not know some workaround =
can=20
> you confirm that it's not posible to do this with iptables?
>=20
> I've tried the next ip tables rules and only work when I do NEW=20
> connections from the web server.
>=20
> -A POSTROUTING -o br0 -s WE_SERVER_ADDR -p tcp -m tcp --sport 80 --dp=
ort=20
> 1024:65535 -j SNAT --to-source LOAD_BALANCER_ADDR
>=20
> Thanks in advance.
>=20
> Isaac Gonz=E1lez
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20
Michael Vallaly <mvallaly@nolatency.com>
