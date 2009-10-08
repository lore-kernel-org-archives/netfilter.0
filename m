From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Re: Forward traffic between two interfaces on the same host
Date: Thu, 8 Oct 2009 02:00:26 -0700 (PDT)
Message-ID: <182062.22260.qm@web31604.mail.mud.yahoo.com>
References: <33be4bb30910070924la1d34bco3e18c0b625b5c25@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254992427; bh=8gYviIeXG/qDKpeyUm5Aam0uEI+sndVahZTGXeOZmmY=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=v6y80lGOZZ6mV6sktzNrkZHdNbTzBinzjAR74/7ggaGB3/EwDL9I2Yg8lmk29eVzn18QG4xvEF04t31q+GIkzoE55TfkK+1nMBEy6QxRKSRdG+xh/VCZHbQFIYSB/hbTw1OHo6g1yyAk5/6vsQteOoahKyUMx0fbWUssGYjAf60=
In-Reply-To: <33be4bb30910070924la1d34bco3e18c0b625b5c25@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, Oskar Berggren <oskar.berggren@gmail.com>

Hi all,

thanks a lot for the hints.  Infact there was a typo with eth0 there :)=
=2E  So Oskar you mean that instead of using the 3rd rule to use someth=
ing like:

iptables -A POSTROUTING -t nat -o 3g0 -j MASQUERADE

in case that the ip of the 3g interface is not static, right?

Thanks a lot again for the tips !=20

--- On Wed, 10/7/09, Oskar Berggren <oskar.berggren@gmail.com> wrote:

> From: Oskar Berggren <oskar.berggren@gmail.com>
> Subject: Re: Forward traffic between two interfaces on the same host
> To: "Kostas Pelechrinis" <kpele_ntua@yahoo.com>, netfilter@vger.kerne=
l.org
> Date: Wednesday, October 7, 2009, 12:24 PM
> 2009/10/7 Richard Horton <richard.horton@solstans.co.uk>:
> > 2009/10/7 Kostas Pelechrinis <kpele_ntua@yahoo.com>:
> >> Hi all,
> >>
> >> I am new in using iptables so I would like to do a
> few questions for something that maybe many of you find easy
> :)
> >>
> >> In particular, I have a laptop with two wireless
> interfaces, a Wifi and a 3G. =A0I would like to share the 3G
> broadband connection available on this laptop with other
> machines within my home/internal network through the wifi
> interface. =A0I would like to ask if such functionality is
> possible to be implemented using iptables.
> >>
> >> Even more specific what I need is a 'relay'-like
> functionality. =A0Let's assume that laptop A has the two
> interfaces and laptop B has only a wifi interface.
> =A0Laptop-B will be connected with laptop A through the wifi
> and laptop A needs to serve all the internet requests of
> laptop B through the 3G usb modem interface.
> >>
> >> I think that I need to use rules like the
> following for laptop A :
> >>
> >> (I use the names wifi0 and 3g0 for the
> corresponding interfaces and xxx.yyy.zzz.www for the ip of
> the 3G interface)
> >> iptables -A FORWARD -i wifi0 -o 3g0 -j ACCEPT
> >> iptables -A FORWARD -i 3g0 -o wifi0 -m state
> --state ESTABLISHED,RELATED -j ACCEPT
> >> iptables -A POSTROUTING -t nat -s 192.168.0.0/24
> -o eth0 -j SNAT --to-source xxx.yyy.zzz.www
> >>
> >> Do I miss something here ? =A0Do I need to take
> care of something else as well?
> >
> > Check that forwarding is turned on in the kernel...
> >
> > sysctl net.ipv4.ip_forward should return
> net.ipv4.ip_forward=3D1, if it
> > doesn't execute 'sysctl -w net.ipv4.ip_forward=3D1' to
> enable it.
> >
> > Not sure on the NAT rules as I have very little to do
> with NAT as
> > we're using iptables on a private internal network
> where the address
> > space in the private ranges is more than adequate
> enough (using all 3
> > classes of private addresses)
> >
> >
>=20
>=20
> In addition to Richard's comments: It seems wrong to
> suddenly have
> eth0 on the nat-rule instead of 3g0. Also, if you get a
> dynamic
> ip-address on the 3g-interface, you might want to use
> MASQUERADE
> instead of SNAT.
>=20
> /Oskar
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=A0 http://vger.kernel.org/majordomo-info.html
>=20


     =20
