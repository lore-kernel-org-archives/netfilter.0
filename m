From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering on bridges
Date: Thu, 22 Dec 2011 00:31:41 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112220028500.22558@frira.zrqbmnf.qr>
References: <4EF1B216.50303@opendium.com> <alpine.LNX.2.01.1112211430010.22587@frira.zrqbmnf.qr> <4EF1E3B0.6080200@opendium.com> <alpine.LNX.2.01.1112211934120.16532@frira.zrqbmnf.qr> <4EF26A14.2070409@opendium.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EF26A14.2070409@opendium.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Hill <steve@opendium.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-12-22 00:21, Steve Hill wrote:

> On 21/12/11 18:36, Jan Engelhardt wrote:
>
>>Yes you do know where it is going; the route is set on FORWARD/OUTPUT
>>(see nf-packet-flow.svg)
>
>I only know it is going to the bridge.  I don't know which member of 
>that bridge it will eventually be sent out of.  In short: I don't know 
>where it is going (in enough detail to be useful).

But the kernel knows, and that's really all that is needed.
