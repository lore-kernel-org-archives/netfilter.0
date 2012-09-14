From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: preroute raw filter only on some packets possible, why?
Date: Fri, 14 Sep 2012 12:55:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1209141254330.11862@frira.zrqbmnf.qr>
References: <CAH_S8NitmC6nZf859J-CA4Bic_0ep96-ZXrStb3kPDQEVUPzAA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAH_S8NitmC6nZf859J-CA4Bic_0ep96-ZXrStb3kPDQEVUPzAA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sladjan Ri <sladjanri@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2012-09-14 09:55, Sladjan Ri wrote:
>
>I read that the notrack target could be used to save performance. Is
>it really possible to exclude for example packets to a specific port
>from being tracked? How could the target know where the packet would
>go

-j CT --notrack does not need to know where the packet goes.
