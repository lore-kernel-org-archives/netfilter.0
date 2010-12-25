From: Andrew Beverley <andy@andybev.com>
Subject: Re: Fair queuing with htb
Date: Sat, 25 Dec 2010 00:09:55 +0000
Message-ID: <1293235795.1660.7.camel@andybev>
References: <201012230226.31297.gregoire.leroy@hyperthese.net>
	 <e9bfeb9388be8dfecf83abe056c3d8fc@localhost>
	 <201012231330.06888.gregoire.leroy@hyperthese.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1293235801; bh=wuflMREW+7HeK6yduUxubwYw08mdzoXzNS5e5
	V6cbkM=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=BrAlsiy0
	nECtmOMlueEF7xN5Csy1bZ+Ehxwt/0GAsu6W0yQN0K/DEHb6YVxTAT3OeQ18jkBDtW3
	+g9swesT3RYVJBHOq8QFyEH2UcwsGimSd0+4IAeL0cUFY0+bMYvRFqHa8Szo0YRcTnU
	Wgn7GRPDw33OBfXqGP5qBRJuVAqRs=
In-Reply-To: <201012231330.06888.gregoire.leroy@hyperthese.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Gr=E9goire?= Leroy <gregoire.leroy@hyperthese.net>
Cc: Julien Vehent <julien@linuxwall.info>, netfilter@vger.kernel.org

On Thu, 2010-12-23 at 13:30 +0100, Gr=C3=A9goire Leroy wrote:
> > Try the following filters:
> >=20
> > tc filter add dev $INT parent 1:0 protocol ip prio 1 handle 1 fw fl=
owid
> > 1:10 tc filter add dev $INT parent 1:0 protocol ip prio 2 handle 55=
 fw
> > flowid 1:20
> >=20
> >=20
> > and check your filters and classes with the following commands:
> >=20
> > # tc -s filter show dev eth0
> > # tc -s class show dev eth0
> >=20
>=20
> # tc -s filter show dev eth0
> filter parent 1: protocol ip pref 1 fw=20
> filter parent 1: protocol ip pref 1 fw handle 0x1 classid 1:10=20
> filter parent 1: protocol ip pref 2 fw=20
> filter parent 1: protocol ip pref 2 fw handle 0x37 classid 1:20=20
>=20
> # tc -s class show dev eth0
>=20
> class htb 1:1 root rate 100000Kbit ceil 100000Kbit burst 15337b cburs=
t 1600b=20
>  Sent 908323001 bytes 680443 pkt (dropped 0, overlimits 0 requeues 0)=
=20
>  rate 2976bit 2pps backlog 0b 0p requeues 0=20
>  lended: 38250 borrowed: 0 giants: 0
>  tokens: 19047 ctokens: 1860
>=20
> class htb 1:10 parent 1:1 prio 0 rate 63000bit ceil 1200Kbit burst 15=
Kb cburst=20
> 1599b=20
>  Sent 2769846 bytes 41947 pkt (dropped 0, overlimits 0 requeues 0)=20
>  rate 8bit 0pps backlog 0b 0p requeues 0=20
>  lended: 3697 borrowed: 38250 giants: 0
>  tokens: -56194 ctokens: 144355
>=20
> class htb 1:20 parent 1:1 prio 0 rate 63000bit ceil 63000bit burst 15=
Kb cburst=20
> 1599b=20
>  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)=20
>  rate 0bit 0pps backlog 0b 0p requeues 0=20
>  lended: 0 borrowed: 0 giants: 0
>  tokens: 30476187 ctokens: 3174593
>=20
> class htb 1:30 parent 1:1 prio 0 rate 88000Kbit ceil 88000Kbit burst =
15Kb=20
> cburst 1584b=20
>  Sent 905553155 bytes 638496 pkt (dropped 0, overlimits 0 requeues 0)=
=20
>  rate 2968bit 2pps backlog 0b 0p requeues 0=20
>  lended: 80486 borrowed: 0 giants: 0
>  tokens: 21656 ctokens: 2109
>=20
>=20
> It seems there are packets which pass through the class 1:10.
> However, I've dowloaded a 100Mo file, so it seems that most of packet=
s pass=20
> through the default class...
>=20
> The cause could be my design...
>=20
> I have a pc which downloads a file on a web server, through the proxy=
 server.=20
> They are all on the same network. The proxy server has only one netwo=
rk card=20
> (eth0).
>=20
> They are linked by 100Mbit links. Squid mark packets from my pc and s=
end them=20
> to netfilter.
>=20
> Considering these informations, have I miss something in my tc config=
uration ?=20
> Must I use iptables to mark incoming traffic from the web server ?

I suspect that your packets are not being marked correctly. If some of
the packets are going into the '10' class, but the majority are not,
then for some reason the majority are not being captured.

Please provide some more information on your setup (probably better to
the thread on the Squid list), or maybe do some closer inspection of
your packets MARK value using the LOG target.

Andy



