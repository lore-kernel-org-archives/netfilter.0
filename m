From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 21:14:02 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804082106570.2229@fbirervta.pbzchgretzou.qr>
References: <fteoq6$ipr$1@ger.gmane.org> <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr> <ftflon$5ns$1@ger.gmane.org> <alpine.LNX.1.10.0804081359450.17722@fbirervta.pbzchgretzou.qr> <ftgcoq$512$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ftgcoq$512$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-08 20:15, Eric B. wrote:
>>>
>>>Sorry, but what is the LOGMARK target?  I can't seem to find that
>>>target anywhere in the docs or the man pages.  I've seen the LOG
>>>target and the MARK target, but not sure what the LOGMARK target
>>>is.
>>
>> Similar to LOG but instead of dumping the packet data, it dumps
>> the associated Netfilter metastructures.
>
>I'm not sure I follow.  I'm using iptables v1.2.11, and I've tried the
>following command, but as I feared, LOGMARK is an unknown target for my 
>version.  Is there a way to get the logmark target for my version, or do I 
>need to update the entire package?

LOGMARK is an extension I wrote, and it being in the xtables-addons
package menas you need kernel 2.6.18 at least (but newer is always
better, we are approaching 2.6.25), and the xtables base package.

>Does Xtables completely replace the iptables package?

Technically yes. Politically no :)

>Do precompiled binaries exist for it?

I only have for OpenSUSE 10.3.


					Oh the joy of enterprise distros...
