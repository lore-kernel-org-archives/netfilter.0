From: John covici <covici@ccs.covici.com>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 11:21:29 -0400
Message-ID: <18447.21497.299984.726379@ccs.covici.com>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com>
	<480F49BE.60600@solutti.com.br>
	<alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr>
	<480F4CD9.4020006@solutti.com.br>
	<alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr>
Reply-To: covici@ccs.covici.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>, ML netfilter <netfilter@vger.kernel.org>

The normal mailing list for routing related stuff seems to be broke or
moved, anyone know what is going on with that?

on Wednesday 04/23/2008 Jan Engelhardt(jengelh@computergmbh.de) wrote
 >=20
 > On Wednesday 2008-04-23 16:51, Leonardo Rodrigues Magalh=E3es wrote:
 > > Jan Engelhardt escreveu:
 > >> On Wednesday 2008-04-23 16:37, Leonardo Rodrigues Magalh=E3es wro=
te: =20
 > >>  =20
 > >> >   This is not iptables related, this is ROUTING related.
 > >> >
 > >> >   iptables does not route packages.
 > >> >    =20
 > >>
 > >> apt/smart routes packages :p
 > >
 > >   hmmmm i use Fedora, so i'll stick with yum :)
 > >
 > >   sorry for that, i mean 'packets' and not 'packages'.
 > >
 > >   iptables does not route network packets, that's done by kernel b=
ased on the
 > > routing table entries. it's completly NOT iptables related.
 >=20
 > It is not completely not related. By changing things such as
 > nfmark, TOS field, source or destination address, routing can
 > be influenced, so I would not say it's totally unrelated :)
 > --
 > To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
 > the body of a message to majordomo@vger.kernel.org
 > More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Your life is like a penny.  You're going to lose it.  The question is:
How do
you spend it?

         John Covici
         covici@ccs.covici.com
