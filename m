From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: "extensions/libipt_ah.c" iptables 1.4.0 compilation problem
Date: Wed, 4 Jun 2008 21:38:35 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806042136230.4055@fbirervta.pbzchgretzou.qr>
References: <4845C3C9.8000109@zensoluciones.com> <4845CAD9.3090308@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4845CAD9.3090308@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?S=C3=A9bastien_Cramatte?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-06-04 00:51, S?=C3=A9bastien Cramatte wrote:

> I answer to myself !
>
> 1) Next, make the package.
>       % make KERNEL_DIR=3D<<where-you-built-your-kernel>>
> ...
>
> Please update the DOC !

Please try a newer version first! This is fixed in 1.4.0.77
onwards, currently we are at 1.4.1-rc2.
