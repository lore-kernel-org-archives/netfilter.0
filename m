From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How do you correctly interpret the FORWARD chain interface 
	options?
Date: Tue, 09 Feb 2010 18:00:43 +0200
Message-ID: <1265731243.3930.43.camel@casper.meteor.dp.ua>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
	 <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
	 <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
	 <ac5c74141002090750p412dbce1wc1fb8aa447c51e07@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74141002090750p412dbce1wc1fb8aa447c51e07@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

=F7 =F7=D4=CF, 09/02/2010 =D7 15:50 +0000, paddy joesoap =D0=C9=DB=C5=D4=
:
> On Tue, Feb 9, 2010 at 3:23 PM, paddy joesoap <paddyjoesoap@gmail.com=
> wrote:
> > On Tue, Feb 9, 2010 at 1:25 PM, Richard Horton <arimus.uk@googlemai=
l.com> wrote:
> >> On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> w=
rote:
> >>> Hi All,
> >>>
> >>> How should one interpret the inbound ("-i") and outbound ("-o") o=
f the
> >>> FORWARD chain.
> >>>
> >>
> >>
> >> -i refers to the interface the packet is received on.
> >> -o refers to the interface the packet is routed out on.
> >>
> >>
> >
>=20
> Ignore last email (spotted an error in the example rules).
>=20
> I think I get what Richard is saying now.
>=20
> The following two rules-set are equivalent, it just depends where you
> decide to filter.
>=20
> Am I correct?
>=20
>  iptables -A FORWARD -i eth0 -p tcp -s 0/0 -d webServIP --dport 80 -j=
 ACCEPT
>  iptables -A FORWARD -o eth0 -p tcp -s webServIP --sport 80 -d 0/0 -j=
 ACCEPT
>=20
>  iptables -A FORWARD -o eth1 -p tcp -s 0/0 -d webServIP --dport 80 -j=
 ACCEPT
>  iptables -A FORWARD -i eth1 -p tcp -s webServIP --sport 80 -d 0/0 -j=
 ACCEPT
>=20
> In some sense writing the 4 rules leads to duplication, in that,
> applying just two will suffice.

This is correct.

> > Does this mean that both versions below are equivalent or at least =
do
> > the same job?
> >
> > (1)
> >
> > iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
> > iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT
> >
> > Because a packet will enter eth0 for internal network and a packet
> > will leave eth1 (pushed towards eth0).
> >
> > (2)
> >
> > iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
> > iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT
> >
> > Because a packet will enter eth0 to be forwarded internally and a
> > packet will also enter eth0 when leaving the network.
> >
> >
> >>
> >> --
> >> Richard Horton
> >> Users are like a virus: Each causing a thousand tiny crises until =
the
> >> host finally dies.
> >> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegi=
an Forest Cats
> >> http://www.pbase.com/arimus - My online photogallery
> >>
> >
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

