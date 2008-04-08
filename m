From: "Eric B." <ebenze@hotmail.com>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 15:28:38 -0400
Message-ID: <ftgh3g$mek$1@ger.gmane.org>
References: <fteoq6$ipr$1@ger.gmane.org> <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr> <ftflon$5ns$1@ger.gmane.org> <alpine.LNX.1.10.0804081359450.17722@fbirervta.pbzchgretzou.qr> <ftgcoq$512$1@ger.gmane.org> <alpine.LNX.1.10.0804082106570.2229@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Jan Engelhardt" <jengelh@computergmbh.de> wrote in message 
news:alpine.LNX.1.10.0804082106570.2229@fbirervta.pbzchgretzou.qr...
>
> On Tuesday 2008-04-08 20:15, Eric B. wrote:
>>>>
>>>>Sorry, but what is the LOGMARK target?  I can't seem to find that
>>>>target anywhere in the docs or the man pages.  I've seen the LOG
>>>>target and the MARK target, but not sure what the LOGMARK target
>>>>is.
>>>
>>> Similar to LOG but instead of dumping the packet data, it dumps
>>> the associated Netfilter metastructures.
>>
>>I'm not sure I follow.  I'm using iptables v1.2.11, and I've tried the
>>following command, but as I feared, LOGMARK is an unknown target for my
>>version.  Is there a way to get the logmark target for my version, or do I
>>need to update the entire package?
>
> LOGMARK is an extension I wrote, and it being in the xtables-addons
> package menas you need kernel 2.6.18 at least (but newer is always
> better, we are approaching 2.6.25), and the xtables base package.

*sigh* Running enterprise servers precludes me from manually installing 
those kernels.   Although I'm not quite sure what release 67 of the RH 
kernel includes as updates to the 2.6.9 kernel...  Might there be any chance 
of it working on the RH 2.6.9-67 kernel?

> Oh the joy of enterprise distros...
One of the necessary side effects of running entreprise servers, I guess....

Thanks again,

Eric



