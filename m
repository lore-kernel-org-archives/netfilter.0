From: jack seth <bird_112@hotmail.com>
Subject: RE: How to isolate wireless clients from each other
Date: Fri, 10 May 2013 00:05:45 +0000
Message-ID: <SNT134-W20011F937B4526A1878921BFA50@phx.gbl>
References: <SNT134-W45C322454357AF0D27D06EBFB90@phx.gbl>,<20130507121720.GL3672@harrier.slackbuilds.org>,<SNT134-W48DA80A0AEDA4067881B97BFBA0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <SNT134-W48DA80A0AEDA4067881B97BFBA0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> ----------------------------------------
> > Date: Tue, 7 May 2013 07:17:20 -0500
> > From: rob0@gmx.co.uk
> > To: netfilter@vger.kernel.org
> > Subject: Re: How to isolate wireless clients from each other
> >
> > On Mon, May 06, 2013 at 06:36:52PM +0000, jack seth wrote:
> > > Does anyone know how to totally isolate wireless clients from
> > > each other that are on a hotspot/guest WLAN?  I thought ebtables
> > > might be the way but I can't figure it out.  Thanks!
> >
> > If CONFIG_BRIDGE_NETFILTER=3Dy you should be able to filter this in
> > your FORWARD chain, e.g., for an unbridged wlan0:
> >
> > -A FORWARD -i wlan0 -o wlan0 -j DROP
> >
> > (You might want to use a user chain with appropriate REJECT rules f=
or
> > the protocol in question.)
> >
> > If CONFIG_BRIDGE_NETFILTER=3Dy and wlan0 is part of a bridge, you w=
ould
> > need the physdev match:
> >
> > -A FORWARD -i br0 -o br0 -m physdev --physdev-in wlan0 --physdev-ou=
t wlan0 -j DROP
> >
> > However, do note that 802.11, being radio traffic, can be sniffed b=
y
> > any receiver. You cannot prevent that.
> > --
> > http://rob0.nodns4.us/ -- system administration and consulting
> > Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at http://vger.kernel.org/majordomo-info.html
>=20
=A0First, thanks for the response.=A0 I'm not sure what 'CONFIG_BRIDGE_=
NETFILTER=3Dy' is.=A0 Is this 'setting' and the rules you posted for ip=
tables or ebtables?=A0 Let me provide some additional information.=A0 T=
his is on my router.=A0 The clients are on 'wl0.1' interface.=A0 This i=
nterface is inside 'br1' bridge.=A0 Another question I have is what int=
erface is the router on in this scenario?=A0 The 2.4ghz wireless interf=
ace is 'eth1' for this router but 'brctl show' doesn't show that interf=
ace in the bridge.=A0 Is the router somehow on 'wl0.1' also?=A0 I am wo=
ndering what interface the router is on because I want to block the cli=
ents from the router also except what is necessary for internet to work=
=2E 		 	   		 =20


Can someone help with this? 		 	   		  