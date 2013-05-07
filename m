From: jack seth <bird_112@hotmail.com>
Subject: RE: How to isolate wireless clients from each other
Date: Tue, 7 May 2013 15:35:11 +0000
Message-ID: <SNT134-W48DA80A0AEDA4067881B97BFBA0@phx.gbl>
References: <SNT134-W45C322454357AF0D27D06EBFB90@phx.gbl>,<20130507121720.GL3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130507121720.GL3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

----------------------------------------
> Date: Tue, 7 May 2013 07:17:20 -0500
> From: rob0@gmx.co.uk
> To: netfilter@vger.kernel.org
> Subject: Re: How to isolate wireless clients from each other
>
> On Mon, May 06, 2013 at 06:36:52PM +0000, jack seth wrote:
> > Does anyone know how to totally isolate wireless clients from
> > each other that are on a hotspot/guest WLAN?  I thought ebtables
> > might be the way but I can't figure it out.  Thanks!
>
> If CONFIG_BRIDGE_NETFILTER=3Dy you should be able to filter this in
> your FORWARD chain, e.g., for an unbridged wlan0:
>
> -A FORWARD -i wlan0 -o wlan0 -j DROP
>
> (You might want to use a user chain with appropriate REJECT rules for
> the protocol in question.)
>
> If CONFIG_BRIDGE_NETFILTER=3Dy and wlan0 is part of a bridge, you wou=
ld
> need the physdev match:
>
> -A FORWARD -i br0 -o br0 -m physdev --physdev-in wlan0 --physdev-out =
wlan0 -j DROP
>
> However, do note that 802.11, being radio traffic, can be sniffed by
> any receiver. You cannot prevent that.
> --
> http://rob0.nodns4.us/ -- system administration and consulting
> Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

=46irst, thanks for the response.=A0 I'm not sure what 'CONFIG_BRIDGE_N=
ETFILTER=3Dy' is.=A0 Is this 'setting' and the rules you posted for ipt=
ables or ebtables?=A0 Let me provide some additional information.=A0 Th=
is is on my router.=A0 The clients are on 'wl0.1' interface.=A0 This in=
terface is inside 'br1' bridge.=A0 Another question I have is what inte=
rface is the router on in this scenario?=A0 The 2.4ghz wireless interfa=
ce is 'eth1' for this router but 'brctl show' doesn't show that interfa=
ce in the bridge.=A0 Is the router somehow on 'wl0.1' also?=A0 I am won=
dering what interface the router is on because I want to block the clie=
nts from the router also except what is necessary for internet to work.=
 		 	   		  