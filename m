From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ip_conntrack: table full, dropping packet.
Date: 26 Sep 2004 22:34:35 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096229131.7416.42.camel@nostromo.bgsecm.com>
References: <e73cec8004092321013f0350be@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e73cec8004092321013f0350be@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 24 de 09 de 2004 a las 06:01, www.piratehosting.net escribi=C3=B3=
:
> ip_conntrack: table full, dropping packet.
>=20
> i have been using
> echo "4008192" > /proc/sys/fs/file-max
> echo 4008192 > /proc/sys/net/ipv4/ip_conntrack_max
> to increase the limits to avoid this dropping of packets.
> can i just clear the list from
> /proc/net/ip_conntrack
> or something
>=20
> some info
> ip_conntrack_ftp       70576  0
> ip_conntrack_irc       70064  0
> ip_conntrack           24968  4
> iptable_nat,ip_conntrack_ftp,ip_conntrack_irc,ipt_state

Yes, you can clear the list using hping2 and sending RST to
both parts of the connection, but it will close the connections
if you do it that way.

The command would be something like this:

hping2 $DSTIP -R -s $SRCPORT -p $DSTPORT -a $SRCIP -k -c 1 -n
hping2 $SRCIP -R -s $DSTPORT -p $SRCPORT -a $DSTIP -k -c 1 -n

I have a script that does just that in my bastion-firewall
program. I can mail it to you if you want it.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



