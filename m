From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: arptables ruleset not working when compiling on  fedora6,7,8/centos
 5/redhat 5
Date: Mon, 29 Jun 2009 20:47:14 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0906292043050.5445@fbirervta.pbzchgretzou.qr>
References: <b2d58cb80906290712k33c1ebbvfc8e661cb34c502c@mail.gmail.com>  <56378e320906290721i63f969edm90aed19619decf71@mail.gmail.com> <b2d58cb80906290751j7fb3976bx9d04fed852c8b451@mail.gmail.com> <4A48D6AD.4010005@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4A48D6AD.4010005@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Nishit Shah <nsshah.82@gmail.com>, Richard Horton <arimus.uk@googlemail.com>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org


On Monday 2009-06-29 16:58, Patrick McHardy wrote:
> Nishit Shah wrote:
>> On Mon, Jun 29, 2009 at 7:51 PM, Richard Horton<arimus.uk@googlemail.com>
>> wrote:
>>> 2009/6/29 Nishit Shah <nsshah.82@gmail.com>:
>>>> Hi,
>>>>        I am compiling arptables-v0.0.3-3/arptables-v0.0.3-2 on
>>>> fedora6,7,8/centos 5/redhat 5. Module is compiled successfully.
>>>> Following are the simple steps.
>
> Which kernel versions (the lowest) are these running?

FWIW, this is reproducable on 2.6.29.5-i386 openSUSE 11.1 arptables_jf-0.0.8
glibc-kernel-headers-2.6.27, so this seems something kernel-related.
