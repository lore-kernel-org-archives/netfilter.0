From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Strange problem with HTTPS POST (maybe) through router from
 Linux
Date: Tue, 8 Jun 2010 23:36:28 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006082330030.23159@obet.zrqbmnf.qr>
References: <201006082203.22238.tvrtko@ursulin.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201006082203.22238.tvrtko@ursulin.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tvrtko Ursulin <tvrtko@ursulin.net>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-06-08 23:03, Tvrtko Ursulin wrote:
>
>I have a small home network behind a cheap ADSL router and a bizarre problem 
>where I am not getting responses from some web sites in some situations.

 - Select one web page/URL where this has happened, preferably one
   that has a small output (like Apache's ingenious "It works!")
 - Is it 100% reproducible on every page reload?

If yes: check your firewall. Don't block ICMP errors.
Name the URL so that people can confirm.

If not: SACK/DSACK/FACK is broken in 2.6.18 (dunno when it was fixed,
but 2.6.25 looks good), and if either client or server make use
of it, things can hang once SACKs are exchanged.
