From: Andrew Beverley <andy@andybev.com>
Subject: Re: Fair queuing with htb
Date: Sat, 25 Dec 2010 22:46:42 +0000
Message-ID: <1293317202.1617.5.camel@andybev>
References: <201012230226.31297.gregoire.leroy@hyperthese.net>
	 <201012250208.36503.gregoire.leroy@hyperthese.net>
	 <4D155860.6090507@via.ecp.fr>
	 <201012250452.01340.gregoire.leroy@hyperthese.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1293317207; bh=jn5bqDbFMVszkHI4sRlFwrm/SAD/pq3fVR2J+
	co4nDM=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=LLg6JR7U
	Bmex5HhjW3O9y+NxPqNNnTHuaSFWofz6h090xO9dgMULac+/8eRnpzKQ/W87UsUuDhm
	TF4YGgX+u7chdc+Yw473tXjA8tDlCuZknCh8vlxF9nhkzPAX/UM6i7E+HMrGeeGZlU7
	sON1wdIQwuSTvWfSGuuDlKgGjvM+E=
In-Reply-To: <201012250452.01340.gregoire.leroy@hyperthese.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?Gr=E9goire?= Leroy <gregoire.leroy@hyperthese.net>
Cc: Antoine Souques <corum@via.ecp.fr>, Julien Vehent <julien@linuxwall.info>, netfilter@vger.kernel.org, Amos Jeffries <squid3@treenet.co.nz>

On Sat, 2010-12-25 at 04:51 +0100, Gr=C3=A9goire Leroy wrote:
> Le Saturday 25 December 2010 03:35:12, Antoine Souques a =C3=A9crit :
> > > I've attached a graph which explains what are the marked packets.
> >=20
> > Your design is wrong. You mark the upload traffic, when the main ht=
tp
> > traffic is the download traffic. That is why your QoS seems ineffec=
tive
>=20
> In this case I have probably misunderstood the goal of the tcp_outgoi=
ng_mark=20
> squid directive. Andrew, in what purpose is it developped ?
>=20

tcp_outgoing_mark will mark packets going from squid to the webserver.
If you want to mark packets going from squid to your client then you
need to use clientside_mark instead.

> >=20
> > > The general goal is to do a QoS based on user ip. If I had no pro=
xy, it
> > > would be easy. However, since I've a proxy, my firewall sees the =
proxy
> > > ip, not the users IP.
> >=20
> > Where is your firewall ? Between the proxy and the webserver, or th=
e
> > otherside ?
> >=20
>=20
> Yes it is
>=20
> > In the first case, you can only mark the upload traffic (it's to la=
te
> > for the download traffic). You should use the conntrack module to m=
ark a
> > connection, and so, you will be able to mark the download traffic
>=20
> I thank it was the goal of the tcp_outgoing_mark squid directive (aut=
hored by=20
> Andrew).
>=20

If you're going to mark packets on the other side of Squid, then you'll
probably need to move the interface that your HTB qdisc is attached to.

> > Moreover, I don't understand why you don't have access to your user
> > addresses. You use mark, so your firewall and your proxy are runnin=
g on
> > the same box. So, when the download traffic leaves your proxy/firew=
all,
> > the destination adsress is the user address. tc is called when a pa=
cket
> > is send to the network, or when a packet arrive. So you can do IP b=
ased
> > QoS.
>=20
> The problem is if I limit the traffic between the proxy and users, th=
en he=20
> won't any difference between the data downloaded from internet and th=
e data=20
> which was in cache in squid.
>=20
> I want to limit the rate only for non-cached data, so it seems releva=
nt to=20
> apply QoS between proxy server and internet.
>=20

In which case you want qos_flows, as Amos has already pointed out.

Andy



