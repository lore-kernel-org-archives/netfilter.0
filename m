From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: (No subject header)
Date: Thu, 29 Jul 2004 23:33:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051210@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: John Black <black@arbbs.net>, netfilter@lists.netfilter.org

> iptables -t nat -A PREROUTING -d X.X.X.X -p tcp --dport 22 -j DNAT \
> -- to 192.168.1.89:2222 (ares)
>
> iptables -t nat -A PREROUTING -d X.X.X.X -p tcp --dport 22 -j DNAT \
> -- to 192.168.1.90:22222 (zeus)

If X.X.X.X in that first rule =3D=3D X.X.X.X in that second rule--the =
second rule will never be matched.

You're giving netfilter 3 pieces of information to use to decide whether =
you have a match:

Protocol =3D TCP
Dest IP =3D X.X.X.X
Dest Port =3D 22

Given those conditions, how will it skip the first rule and make it to =
the second?

I would reverse your theory.  Let the hosts on the inside listen on the =
standard SSH port (TCP 22), and use different ports on the external =
side:

iptables -t nat -A PREROUTING -d X.X.X.X -p tcp --dport 2222 -j DNAT \
 --to 192.168.1.89:22 (ares)

iptables -t nat -A PREROUTING -d X.X.X.X -p tcp --dport 2223 -j DNAT \
 --to 192.168.1.90:22 (zeus)

And then use:	ssh -p 2222 X.X.X.X to connect to ares
And:			ssh -p 2223 X.X.X.X to connect to zeus

-j

