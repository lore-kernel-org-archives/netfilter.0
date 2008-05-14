From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Netfiler REAL Rule Match Sequence
Date: Wed, 14 May 2008 23:29:40 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>
References: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?J=C3=BCrgen_Rochol?= <juergen.rox@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-05-14 22:21, J=C3=BCrgen Rochol wrote:
>
>Putting in a simple way, is the packet evaluated under a unique single
>rule list or several rules lists -- one for each chain?

Sieve principle. What has not matched falls through
until it finally matches (and takes a terminating action).
Much like, uh, filters.
