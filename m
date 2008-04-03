From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 3 Apr 2008 14:30:29 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr>
References: <47F4C8AE.4050801@bgs.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F4C8AE.4050801@bgs.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bgs <bgs@bgs.hu>
Cc: netfilter@vger.kernel.org


On Thursday 2008-04-03 14:08, Bgs wrote:

>
> Greetings,
>
> I tried to compile the above setup but the compilation fails. I've seen this 
> error with 2.6.23/2.6.24 kernels before but used 2.6.22.X in production. Has 
> anything changed in the way to patch it?

pom is pretty much an ancient blob of code, being replaced by 
xtables-addons. connlimit has been merged into mainline, btw.
