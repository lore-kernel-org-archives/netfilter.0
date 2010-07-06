From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirecting a Pre-existing SSH Session
Date: Tue, 6 Jul 2010 13:31:52 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007061331300.11025@obet.zrqbmnf.qr>
References: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTil-BzqRmzGX951pWLLkVqeO8Y_vwywQOD8z2Drj@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wade Gasior <wadegasior@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-07-06 13:28, Wade Gasior wrote:

>At a point in time, I want to forward all incoming traffic to be
>served by .160 instead.
>I have accomplished this using these commands (on .150):
>
>iptables -t nat -A PREROUTING -j DNAT --to 192.168.1.160
>iptables -t nat -I POSTROUTING -j MASQUERADE

That isn't forwarding, it's address rewriting.

