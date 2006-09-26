From: Guillaume <silencer@free-4ever.net>
Subject: Re: DNAT doesn't work
Date: Tue, 26 Sep 2006 16:59:58 +0200
Message-ID: <4519406E.4040902@free-4ever.net>
References: <c936c6b70609260745r40491602uba2aef2c6ae9be34@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70609260745r40491602uba2aef2c6ae9be34@mail.gmail.com>
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

Holger Kinkelin a =E9crit :
> Hi everybody!
>=20
> I'm more or less new to netfilter / iptables; so I've got a question=20
> about DNAT.
>=20
> My problem is, that my DNAT won't work. I want to reroute http-pakets
> to server X to my own server running on localhost.
>=20
> The first command I tried was the following:
>=20
>>> iptables -A PREROUTING -t nat -p tcp -d [IP OF X] --dport 80 -j
> DNAT --to-destination 127.0.0.1:80
>=20
> The new rule seems to be added correctly to the nat-table:
>=20
>>> iptables -t nat --list
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       tcp  --  anywhere             X tcp dpt:http to:127.0.0.1:80
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>=20
> But: There is no effect. When I try to open a page hostet on X, the
> page loads from X, not from localhost...
>=20
> So I tried
>=20
>>> iptables -A PREROUTING -t nat -p tcp -d [IP OF X] --dport 80 -j REDIR=
ECT
>=20
> No effect, too
>=20
> Could anybody tell me, what I'm doing wrong?
> I'm using Suse Linux 10.0
>=20
> Regards,
> Holger
>=20

Hi,

The first thing I'm thinking about is that you need a corresponding rule=20
in the "filter" table !

In this example, you should had a rule:
iptables -A INPUT -p tcp --dport 80 -d 127.0.0.1 -j ACCEPT

Of course, it's needed only if you set the default policy to "DROP" in=20
all chains of table "filter".

So to summarize, after DNATing your traffic, you need to allow it in the=20
filter table.

Regards
Guillaume


--=20
Guillaume
E-mail: silencer_<at>_free-4ever_<dot>_net
Blog: http://guillaume.free-4ever.net
----
Site: http://www.free-4ever.net

