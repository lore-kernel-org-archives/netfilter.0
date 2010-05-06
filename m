From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: AH and ESP nat-ing
Date: Thu, 6 May 2010 17:06:55 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005061706150.32238@obet.zrqbmnf.qr>
References: <AANLkTikuASq3YbwsJNj8KWrwd7avNYwL9aYYhtjoF-ip@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikuASq3YbwsJNj8KWrwd7avNYwL9aYYhtjoF-ip@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thursday 2010-05-06 16:08, ratheesh k wrote:

>I googled and found that  AH protocol pkt cannot be NATed  , And ESP
>protocol pkt  NATing wont work in  some use cases .
>
>Is this problem is solved in newer kernels ?

This is not a kernel problem.

>Is there any ALG for nating this packets  ?

No, it's cryptographically signed, so any modification would be visible.
