From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: How to log redirected packets
Date: 09 Sep 2004 18:41:32 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094741177.16110.14.camel@nostromo.bgsecm.com>
References: <AD3C7008DB448D42ABA9346FE715E8340D335D@megisto-e2k.megisto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <AD3C7008DB448D42ABA9346FE715E8340D335D@megisto-e2k.megisto.com>
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

El jue, 09 de 09 de 2004 a las 00:42, Khoa Nguyen escribi=C3=B3:
> Hi,
>=20
> I have the following in the nat table:
>=20
> [root@jungle log]# iptables -t nat -L -v
> Chain PREROUTING (policy ACCEPT 6 packets, 547 bytes)
>  pkts bytes target     prot opt in     out     source
> destination        =20
>     2   120 REDIRECT   tcp  --  any    any     anywhere
> anywhere           tcp dpt:http redir ports 8081=20
>     0     0 REDIRECT   tcp  --  any    any     anywhere
> 172.16.6.5         tcp dpt:rtsp redir ports 8081=20
>     0     0 REDIRECT   tcp  --  any    any     172.16.6.5
> anywhere           tcp spt:rtsp redir ports 8081=20
>     0     0 REDIRECT   tcp  --  any    any     anywhere
> 172.16.6.6         tcp dpt:rtsp redir ports 8081=20
>     0     0 REDIRECT   tcp  --  any    any     172.16.6.6
> anywhere           tcp spt:rtsp redir ports 8081=20
>=20
>=20
> Now I would like to log all redirected packets to a file. How do I do
> that? I did try the following but it didn't work:
>=20
> iptables -t nat -A PREROUTING -j LOG --log-level debug
>=20

Try inserting the rule above the REDIRECT rules.
iptables -t nat -I PREROUTING -j LOG --log-level debug

This will log all your connections, so maybe you can insert
one identical rule for each REDIRECT rule you already have,
that would be better so you just have logs from the rules
you really want.


> It only logged message destined to its local interface.
>=20
> Thanks,
>=20
> Khoa Nguyen
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


