From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Port Knocking with default hooks/modules
Date: Mon, 17 May 2010 07:51:51 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005170749450.24718@obet.zrqbmnf.qr>
References: <AANLkTikI4u4ZXG6jxCGYj-Ig5HLc47mF7Mey9sHh9tNu@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikI4u4ZXG6jxCGYj-Ig5HLc47mF7Mey9sHh9tNu@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: netfilter@vger.kernel.org

On Monday 2010-05-17 02:09, Curby wrote:

>Hello, I want to implement port knocking on a dual-homed router.
>After the router receives the correct knocking sequence, it will allow
>SSH connections to be forwarded into the internal SSH server.  While I
>can see the knocking sequence work, the actual SSH attempt never goes
>through.  Below are the relevant rules from iptables-save complete
>with counters showing that everything works besides the last step,
>which doesn't match.  Can you see what's wrong?

It doesn't use the much simpler -m pknock from Xtables-addons ;)

>[...]
>I find it interesting that searching the archives for port knocking
>doesn't bring up anything more recent than 2008.  Going mildly off
>topic, is port knocking now considered an ill-advised solution for
>obscuring an oft-attacked service from view?  If so, why?

"You must look beyond what you see" - the netfilter-devel list should
have a fair amount of xt_pknock exchange from 2009.
