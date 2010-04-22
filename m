From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: libnetfilter_conntrack: notification on established/finished
 connection?
Date: Thu, 22 Apr 2010 09:35:26 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004220934210.27555@obet.zrqbmnf.qr>
References: <201004211915.28436.morgon.j.kanter@dartmouth.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201004211915.28436.morgon.j.kanter@dartmouth.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Morgon J. Kanter" <morgon.j.kanter@dartmouth.edu>
Cc: netfilter@vger.kernel.org


On Thursday 2010-04-22 01:15, Morgon J. Kanter wrote:
>
>I'm in the process of writing an application that requires
>notification when a new TCP connection to a specific destination is
>established, and finished / timed out. [...] I've been investigating
>using libnetfilter_conntrack for this purpose. My question is: is
>this possible to do with this library?

That seems to be the case, as `conntrack -E` builds upon it.
