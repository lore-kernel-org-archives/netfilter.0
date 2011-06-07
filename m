From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipv6 link local address
Date: Tue, 7 Jun 2011 11:04:03 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106071102460.25037@frira.zrqbmnf.qr>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com> <1307429067.7853.1.camel@hakkenden> <4DEDCE11.3090004@arpa.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DEDCE11.3090004@arpa.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Schorr <erik-lists@arpa.org>
Cc: netfilter@vger.kernel.org, "Nikolay S." <nowhere@hakkenden.ath.cx>


On Tuesday 2011-06-07 09:06, Erik Schorr wrote:
>
>> You can turn off ipv6 on interfaces. This should not prevent bridging
>> ipv6, but will remove any ipv6 logic from them.
>
> I wish I'd known this.  Could you give an example of how to remove ipv6
> functionality from an interface?  I think this was the only thing preventing me
> from unloading an accidentally-loaded ipv6.ko module.

There are no accidents. It's your userspace which triggers it loading.
And what is it actually that you are trying to fix? It smells more
like you have a bug in your environment.
