From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: CONFIG_BRIDGE_NETFILTER stops any traffic on wireless
 interface
Date: Fri, 4 Jun 2010 08:53:41 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006040850570.19959@obet.zrqbmnf.qr>
References: <F24C979D1AFD4E4292B911441CBA242407FCFB@2putt.int.lantronix.com> <AANLkTikBjPz7zSp7KpAsnhbyfP94TwsGrbIcXdjP2r6z@mail.gmail.com> <F24C979D1AFD4E4292B911441CBA242407FCFE@2putt.int.lantronix.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F24C979D1AFD4E4292B911441CBA242407FCFE@2putt.int.lantronix.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Umar Qureshey <umar.qureshey@lantronix.com>
Cc: agashi shipora <gashipo@gmail.com>, netfilter@vger.kernel.org


On Friday 2010-06-04 00:31, Umar Qureshey wrote:

>My research has narrowed down the issue to the
>br_filter.c code (this is included in the build by the CONFIG_BRIDGE_NETFILTER
>define). When I remove this object code from my build, radio is fine (but to
>remove this br_filter.c's code, I had to modify Kconfig as stated above so
>I'll still have ebtables support). My guess is maybe some default setting of
>this bridge code is rejecting all packets on the radio interface.

You have not yet posted

 * brctl showstp br0
 * ebtables-save
 * ip addr
 * ip route show table all
..
