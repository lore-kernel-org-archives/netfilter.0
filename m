From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: Reject non-ipsec traffic
Date: Mon, 25 Jul 2011 02:32:34 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107250229050.14798@frira.zrqbmnf.qr>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com> <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr> <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com> <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
 <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com> <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr> <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com> <slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz>
 <CAM3m09Rf7zEQ4TL5PbfT7NHF5gq24o7E-Pbq_wcwbJ25ym6Dww@mail.gmail.com> <slrnj2i1rb.2tp.petr.pisar@album.ics.muni.cz> <925A849792280C4E80C5461017A4B8A2A0415F@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <925A849792280C4E80C5461017A4B8A2A0415F@mail733.InfraSupportEtc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Scott <GregScott@Infrasupport.com>
Cc: netfilter@vger.kernel.org, Ryan Whelan <rcwhelan@gmail.com>, Petr Pisar <petr.pisar@atlas.cz>

On Monday 2011-07-25 00:40, Greg Scott wrote:

>But wait a minute - something else has gotta be going on here.  The
>original rules had an ACCEPT for UDP and TCP port 500 and then for ESP
>and AH.

Yes, and where was the accept for unencrypted packets that do not 
belong to IKE? That's the whole point.

>And then the DROP all rule.  When the drop all rule is removed,
>then everything comes through[...]
