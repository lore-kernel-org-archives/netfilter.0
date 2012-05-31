From: Jan Engelhardt <jengelh@inai.de>
Subject: RE: Filter MAC Destination
Date: Thu, 31 May 2012 19:19:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205311918550.13599@frira.zrqbmnf.qr>
References: <F0E5F8699DE1364584CDB894E99713552EEE6946@YRDSB5.YRDSB.YRDSB.NET>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F0E5F8699DE1364584CDB894E99713552EEE6946@YRDSB5.YRDSB.YRDSB.NET>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: "Miller, Shao" <shao.miller@yrdsb.edu.on.ca>
Cc: netfilter@vger.kernel.org

On Thursday 2012-05-31 19:14, Miller, Shao wrote:

>Good day to all.
>
>I would like to filter Spanning-Tree Protocol data units, which have a=
=20
>common destination MAC address.=C2=A0 Is filtering based on a destinat=
ion=20
>MAC address possible, or only based on a source MAC address?

It is indeed possible to check for source and/or destination MAC=20
address for STP packets.
