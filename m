From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: How to isolate wireless clients from each other
Date: Tue, 7 May 2013 07:17:20 -0500
Message-ID: <20130507121720.GL3672@harrier.slackbuilds.org>
References: <SNT134-W45C322454357AF0D27D06EBFB90@phx.gbl>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SNT134-W45C322454357AF0D27D06EBFB90@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, May 06, 2013 at 06:36:52PM +0000, jack seth wrote:
> Does anyone know how to totally isolate wireless clients from
> each other that are on a hotspot/guest WLAN?=A0 I thought ebtables
> might be the way but I can't figure it out.=A0 Thanks!

If CONFIG_BRIDGE_NETFILTER=3Dy you should be able to filter this in=20
your FORWARD chain, e.g., for an unbridged wlan0:

-A FORWARD -i wlan0 -o wlan0 -j DROP

(You might want to use a user chain with appropriate REJECT rules for=20
the protocol in question.)

If CONFIG_BRIDGE_NETFILTER=3Dy and wlan0 is part of a bridge, you would=
=20
need the physdev match:

-A FORWARD -i br0 -o br0 -m physdev --physdev-in wlan0 --physdev-out wl=
an0 -j DROP

However, do note that 802.11, being radio traffic, can be sniffed by=20
any receiver. You cannot prevent that.
--=20
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
