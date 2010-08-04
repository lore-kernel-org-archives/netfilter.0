From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables PREROUTING -drop
Date: Wed, 4 Aug 2010 13:43:53 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008041343200.32671@obet.zrqbmnf.qr>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>

On Wednesday 2010-08-04 13:05, ratheesh k wrote:

>I  googled and  understood that "If we  DROP a packet at BROUTER chain
>, it will be passed to upper layer  and netfilter subsystem will
>process those packets .
>
>What will happen,  if we drop a packet at PREROUTING chain  of ebtables ?

Depends on the table you are referring to.
