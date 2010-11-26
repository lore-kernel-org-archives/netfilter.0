From: Paulo Ricardo Bruck <pauloric@contatogs.com.br>
Subject: Re: raccon+openvpn route problem....
Date: Fri, 26 Nov 2010 10:12:45 -0200 (BRST)
Message-ID: <31179076.14.1290773565163.JavaMail.root@mercurio>
References: <4CEECFCD.2030808@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CEECFCD.2030808@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org


----- Mensagem original -----
> De: "G=C3=A1sp=C3=A1r Lajos" <swifty@freemail.hu>
> Para: "Paulo Ricardo Bruck" <pauloric.contatogs.com.br>
> Cc: netfilter@vger.kernel.org
> Enviadas: Quinta-feira, 25 de Novembro de 2010 19:06:21
> Assunto: Re: raccon+openvpn route problem....
> Hi!
>=20
> Have you tried the "client-to-client" option in the server config?

Yes . the problem its between openvpn and racoon at the same machine...

All branches and Head Quarter using openvpn can talk from each other.
Italy and Head Office in Brazil talk with each other.
I insert a route in openvpn to connect to range xx.xx.xx.xx. in Italy  =
(push "route 10.0.0.0 255.255.255.0")

from another lan at head office in Brazil I can reach Italy ...

thanks in advanced


>=20
> Swifty
>=20
> 2010-11-25 21:05 keltez=C3=A9ssel, Paulo Ricardo Bruck =C3=ADrta:
> > Hi Guys
> >
> > After google and ask help at openvpn's forum I'm still w/ no lucky.
> > Please let me know if there is another forum/email list that could
> > help me.
> >
> > That's what I have :
> >
> > Italy ----------------------Brazil HeadQuarter--------------Brazil
> > branch
> > cisco ipsec debian+racoon+openvpn debian+openvpn
> > LAN 10.0.0.0/24 LAN 10.54.0.0/24 LAN 10.54.1.0/24
> >                                   OPENVPN=3D10.8.0.1 openvpn=3D10.8=
=2E0.2
> >
> > Italy and headquarter in braszil talk w/ each other without problem=
s
> > Headquarter and branch in brazil talk w/ each other without problem=
s
> > branch in Brazil can't talk w/ Italy.
> >
> > using traceroute from branch I get 10.8.0.1 and stop.
> > I'm almost certain that it's a route problem but I dont know how to
> > solve.
> > Any help could be very appreciate.
> >
> > best regards
> >
> > route table at headOffice brazil
> > xx.xx.xx.xx/28 dev eth2 proto kernel scope link src xx.xx.xx.xx
> > 10.8.0.0/24 dev tun0 proto kernel scope link src 10.8.0.1
> > 10.54.0.0/24 dev eth0 proto kernel scope link src 10.54.0.1
> > default via xx.xx.xx.xx dev eth2
> >
> >
> >
> > route table at branch
> > 10.8.0.0/24 dev tun0 proto kernel scope link src 10.8.0.2
> > 10.54.1.0/24 dev eth0 proto kernel scope link src 10.54.1.1
> > 10.0.0.0/24 via 10.8.0.1 dev tun0
> > yy.yy.yy.yy dev eth1 proto kernel scope link src yy.yy.yy.yy
> > default via yy.yy.yy.yy dev eth1
> >
> > ipsec.conf ( HeadOffice Brazil)
> > spdadd 10.54.0.0/16 10.0.0.0/24 any -P out ipsec
> >          esp/tunnel/xx.xx.xx.xx-ww.ww.ww.ww/require;
> >
> > spdadd 10.0.0.0/24 10.54.0.0/16 any -P in ipsec
> >          esp/tunnel/ww.ww.ww.ww-xx.xx.xx.xx/require;
> >
> > PS how can a see route tables inserted by racoon/ipsec?
> >
> >
> > Paulo Ricardo Bruck
> > consultor
> > http://www.contatogs.com.br
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
"
> > in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at http://vger.kernel.org/majordomo-info.html
> >
