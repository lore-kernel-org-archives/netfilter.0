From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ipconntrack
Date: 03 Oct 2004 14:10:34 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096805432.32109.2.camel@nostromo.bgsecm.com>
References: <e73cec800410030141797418ff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e73cec800410030141797418ff@mail.gmail.com>
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

El dom, 03 de 10 de 2004 a las 10:41, www.piratehosting.net escribi=C3=B3=
:
> i run 2 irc servers for a small hosting company.
> ip contrack gets full all the time no matter what limits i set=20
> echo 40192 > /proc/sys/net/ipv4/ip_conntrack_max
>=20
> My question is:
> can i safely remove ip conntrack all together?
> rmmod ip_conntrack
> rmmod ip_conntrack_ftp
> rmmod ip_conntrack_irc
> rmmod ip_conntrack
> rmmod ipt_state
>=20
> I dont really understand what it does but the table keep filling up im
> sure its some kinda attact on my servers.
> does it do anything at all i use a simple firewall (apf) and only these=
 rules.
> in
> /etc/sysctl.conf
> net.ipv4.icmp_echo_ignore_broadcasts =3D 1
> net.ipv4.icmp_echo_ignore_all =3D 1
> net.ipv4.tcp_max_syn_backlog =3D 1024
> net.ipv4.icmp_ignore_bogus_error_responses =3D 1
> net.ipv4.tcp_syncookies =3D 1

The more logical way of acting is looking at your logs and
identify the connections that you think are fulling your
ip_conntrack table, surely they are connections to port 445,
135,139 and similars. If you don't need this ports you should
DROP them in your firewall. If you really have so much connections
that you can't really use conntrack, something I find improbable,
then you can deactivate it the way you say, but I advise you not
to do it, better tune your firewall to have less connections.

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


