From: Bastian Bittorf <bittorf@bluebottle.com>
Subject: Re: About using -i with MASQUERADE
Date: Fri, 22 Jan 2016 15:07:27 +0100
Message-ID: <20160122140727.GC27441@medion.lan>
References: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGpfsQ2qF0htCZQ3SmKR15Gs0huWBy=Es3c_5hh4QsRQ_CM3oQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Pedretti <fabio.pedretti@unibs.it>
Cc: netfilter@vger.kernel.org

* Fabio Pedretti <fabio.pedretti@unibs.it> [22.01.2016 13:49]:
> Hi, I would like to do the following:
> -t nat -A POSTROUTING -i eth3 -j MASQUERADE

this explains, why -i is not possible here:
https://en.wikipedia.org/wiki/Netfilter#/media/File:Netfilter-packet-flow.svg

bye, bastian
