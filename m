From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: RE: Redirecting ports in a bridge
Date: Wed, 23 Apr 2008 17:25:12 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804231724290.13697@fbirervta.pbzchgretzou.qr>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es>
 <9376B7D1C2D4834285B48542AECC46F113FADC@faraday.rad.nd.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9376B7D1C2D4834285B48542AECC46F113FADC@faraday.rad.nd.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Cozzi <cozzi@hertz.rad.nd.edu>
Cc: =?UTF-8?Q?Javier_Prieto_Mart=C3=ADnez?= <javier.prieto.ext@juntadeandalucia.es>, netfilter@vger.kernel.org


On Friday 2008-04-18 14:26, Marc Cozzi wrote:
>
>Can I ask what you are using for traffic logging
>on your bridge? I am in need of fairly decent accounting
>software for all traffic passing through the bridge.

I suppose LOG/ULOG/NFLOG for the typical things, and tcpdump
or a specially crafted logging target if you want the actual
layer-7 data.
