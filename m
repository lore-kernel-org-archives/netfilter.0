From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Stateful packet inspection
Date: Thu, 3 Nov 2011 20:29:54 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111032028140.25863@frira.zrqbmnf.qr>
References: <201111031846.pA3IkhbR081886@medusa.blackops.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201111031846.pA3IkhbR081886@medusa.blackops.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: msk@cloudmark.com
Cc: netfilter@vger.kernel.org


On Thursday 2011-11-03 19:46, msk@cloudmark.com wrote:
>
>A connection from outside hits A, which passes it to an application-layer
>policy application that does stateful analysis while packets are also
>relayed between the Internet and B.

- tproxy (squid offers that, for example) using the standard
way of the POSIX socket API,

- nfqueue via libnetfilter_queue library
