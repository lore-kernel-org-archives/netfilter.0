From: rruegner <robowarp@gmx.de>
Subject: Re: Conntrack helpers for ICQ and MSN Messenger
Date: Sat, 11 Sep 2004 02:19:26 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4142448E.3070609@gmx.de>
References: <20040910210728.7056.qmail@web50206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910210728.7056.qmail@web50206.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Giancarlo Boaron <gboaron@yahoo.com.br>
Cc: netfilter@lists.netfilter.org

Hi,
you dont need helpers for icq it works out of the box
if you want file transfer use somethin like this
#message icq
/usr/sbin/iptables -A INPUT -p udp --dport 4000 -j ACCEPT
#this for  icq file transfer tradittional version
#first user configure icq to use ports 24500:24505 for file transfer
/usr/sbin/iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport=20
24500:24505 -j DNAT --to 10.10.100.50
/usr/sbin/iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport=20
24510:24515 -j DNAT --to 10.10.100.52

configure your icq client using ie tcp 24510:24515 for file transfer


#msn
/usr/sbin/iptables -A INPUT -p tcp --dport 1863 -j ACCEPT

http://reaim.sourceforge.net/
may help you too with msn file transfer

Regards

Giancarlo Boaron schrieb:

> Hello.=20
> I have some clients in my LAN that need to access ICQ
> and MSN Messenger.
> Reading some iptables tutorials, I discovered that ICQ
> and MSN Messenger protocols are some kind of "complex
> protocols" because they send some information about
> openning new connections back inside the payload of
> the packets.
> So, iptables needs some CONNTRACK and/or NAT helpers
> to let this protocols work properly.
> I looked for it on NETFILTER home page but I didn't
> find it. So, I need some help about it!
> Where can I get an how to apply it on my iptables?
> (Do I have to use patch-o-matic?)
> Besides, I want to use the FORWARD chain instead of
> sending this protocols via SQUID or another proxy.
>=20
> Some solution?
>=20
> Regards
> Giancarlo
>=20
>=20
>=20
> =09
> =09
> 	=09
> _______________________________________________________
> Yahoo! Messenger 6.0 - jogos, emoticons sonoros e muita divers=E3o. Insta=
le agora!
> http://br.download.yahoo.com/messenger/
>=20

