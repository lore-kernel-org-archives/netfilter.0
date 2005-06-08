From: Song Du <freewizard@gmail.com>
Subject: Re: redirect unauthenticated traffic to a registration portal
Date: Wed, 8 Jun 2005 14:25:09 +0800
Message-ID: <49ba2808050607232518af48e9@mail.gmail.com>
References: <Pine.LNX.4.61.0506061504430.23665@students.iiit.ac.in>
Reply-To: Song Du <freewizard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506061504430.23665@students.iiit.ac.in>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Phani Kumar <pkumar@students.iiit.net>
Cc: netfilter@lists.netfilter.org

just like transparent proxy
assume http://AUTH_PORTAL_IP is where user can type password and become aut=
hed.
iptables -t nat -A PREROUTING CONDITIONS_TO_MATCH_AUTHED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to AUTH_PORTAL_IP
iptables -t nat -A PREROUTING -j DROP


2005/6/6, Phani Kumar <pkumar@students.iiit.net>:
> Hi,
>    I have implemented a linux router with 4 interfaces.
>=20
> eth0 -- outside net
> eth1 --
> eth2 --    diff Internal n/ws
> eth3 --
>=20
> Now I had to allow only authenticated traffic to pass through the
> router(i.e through interface eth0).
> I have a list of all authenticated Mac-addresses in a file.
>=20
> All unauthenticated traffic (i.e non-authenticated mac-address traffic)
> had to be redirected to default registration site.
>=20
> Pls can anyone suggest me how to do above task.
> I am able to allow only authenticated traffic by using
>=20
> iptables -t filter -A FORWARD -m --mac-source xx.xx.xx... -i eth0 -j
> ACCEPT
>=20
> and so on for all authenticated users
>=20
> iptables -t filter -A FORWARD -i eth0 -j DROP
>=20
> How do I redirect the unathenticated traffic to a registration portal
> rather than dropping it??
>=20
> Phani
> IIIT-Hyd
>=20
>=20


--=20
freewizard (at) gmail.com=20
http://blog.tsing.org/freewizard/   (in Chinese)

