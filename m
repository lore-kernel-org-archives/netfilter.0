From: Glen Miner <shaggie76@hotmail.com>
Subject: RE: Stateless NAT with iptables
Date: Fri, 9 Jan 2015 17:35:01 -0500
Message-ID: <SNT152-W606A3E66DAEB02EAB7AD24B8440@phx.gbl>
References: <SNT152-W84CAD14ACDD2F149C65D88B8440@phx.gbl>,<CAKfDRXgQJ8zkyBjdyhLFCgpV7z7yiR497G7XOTubM5y2rYxDMg@mail.gmail.com>,<SNT152-W8102200148E4B5EE0CE5B8B8440@phx.gbl>,<CAKfDRXg33kvVEMRJBsbU=sHF3LZm_SjVcQh=_E7ybvrdpYOKnw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKfDRXg33kvVEMRJBsbU=sHF3LZm_SjVcQh=_E7ybvrdpYOKnw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> Ah, yes, that is true, forgot about that. However, patching RAWDNAT t=
o
> support this should be too much work. You can probably copy most of
> the code from DNAT.

I fired up a clone of the xtables-addons repo and was surprised to find=
 that the RAWNAT module was deleted over a year ago:

<https://sourceforge.net/p/xtables-addons/xtables-addons/ci/c024c6b16ee=
0eeff200b8a020b20ebf9d2a74738/>

I also had trouble getting autoconf to work; even if I were to resurrec=
t the dead I may not be familiar enough with the tools involved to buil=
d and test any changes I might make. I sent the package maintainer a me=
ssage, though; maybe with a little push I might try to help.

-g
=A0 		 	   		  