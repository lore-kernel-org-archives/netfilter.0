From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless
 interface
Date: Wed, 9 Jun 2010 19:03:59 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006091903040.3409@obet.zrqbmnf.qr>
References: <F24C979D1AFD4E4292B911441CBA242407FCFB@2putt.int.lantronix.com> <AANLkTikBjPz7zSp7KpAsnhbyfP94TwsGrbIcXdjP2r6z@mail.gmail.com> <F24C979D1AFD4E4292B911441CBA242407FCFE@2putt.int.lantronix.com> <alpine.LSU.2.01.1006040850570.19959@obet.zrqbmnf.qr>
 <F24C979D1AFD4E4292B911441CBA242407FD13@2putt.int.lantronix.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F24C979D1AFD4E4292B911441CBA242407FD13@2putt.int.lantronix.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Umar Qureshey <umar.qureshey@lantronix.com>
Cc: agashi shipora <gashipo@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2010-06-09 18:56, Umar Qureshey wrote:

>*brctl showstp br0: I am using busybox version of brctl and it doesn't
>support the showstp parameter.  
>Besides, the wireless connection is dead before I create any bridge.

So it does not look like an ebtables problem. If wireless ain't
working without a bridge,  how is it supposed to with brdiging?
