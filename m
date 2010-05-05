From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: what is atomicity of iptables packet processing?
Date: Wed, 5 May 2010 20:37:52 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005052035480.15673@obet.zrqbmnf.qr>
References: <h2u2d6a9f6f1005050856pc4d54582z7ccb7f79cb71991c@mail.gmail.com>  <alpine.LSU.2.01.1005051843340.2592@obet.zrqbmnf.qr> <AANLkTinImt-RX4BBQaf641sH3lekA81pC_tsdKEgMGho@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinImt-RX4BBQaf641sH3lekA81pC_tsdKEgMGho@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Bill Bogstad <bogstad@pobox.com>, Netfilter mailing list <netfilter@vger.kernel.org>

On Wednesday 2010-05-05 19:57, ratheesh k wrote:

> > On Wednesday 2010-05-05 17:56, Bill Bogstad wrote:
>>Since incoming packets may not be synchronized with outgoing
>packets, there is the possibility that the INPUT chain rules might be
>modifying the connection marking at the same time that the OUTPUT
>chain rules are using the mark to modify the packet.
>
>I am a little bit confused .
>My understanding is pkts will traverse thru various HOOKs one by one .
>PREROUTING -> INPUT etc . So how come ,the same pkt will be marked and
>processed at different hooks at same time  ?

It's about _DIFFERENT_ packets belonging to the same connection.

