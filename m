From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 21:38:52 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804082135360.2229@fbirervta.pbzchgretzou.qr>
References: <fteoq6$ipr$1@ger.gmane.org> <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr> <ftflon$5ns$1@ger.gmane.org> <alpine.LNX.1.10.0804081359450.17722@fbirervta.pbzchgretzou.qr> <ftgcoq$512$1@ger.gmane.org>
 <alpine.LNX.1.10.0804082106570.2229@fbirervta.pbzchgretzou.qr> <ftgh3g$mek$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ftgh3g$mek$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-08 21:28, Eric B. wrote:
>>
>> LOGMARK is an extension I wrote, and it being in the xtables-addons
>> package menas you need kernel 2.6.18 at least (but newer is always
>> better, we are approaching 2.6.25), and the xtables base package.
>
>*sigh* Running enterprise servers precludes me from manually installing 
>those kernels.   Although I'm not quite sure what release 67 of the RH 
>kernel includes as updates to the 2.6.9 kernel...  Might there be any chance 
>of it working on the RH 2.6.9-67 kernel?

Yes, though I suppose hacking up the place in ipt_LOG to print
you the info you need (which is?) would be faster than backporting
the entire xtables. Noting that simple rules like -m conntrack
--ctstate NEW are approaching the debug value of a direct log message
from the modules.

