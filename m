From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: why can't I DNAT SIP?
Date: Sun, 11 May 2008 16:58:40 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805111658220.19952@fbirervta.pbzchgretzou.qr>
References: <fvtjuu$7i1$1@ger.gmane.org> <48235501.4030608@riverviewtech.net>  <fvvuil$ldh$1@ger.gmane.org> <48245C6B.1090506@riverviewtech.net>  <48245E7E.8080206@trash.net> <c195ebf70805091904w5b728e5gbe0a57ed16b0516@mail.gmail.com>
 <alpine.LNX.1.10.0805101041210.19952@fbirervta.pbzchgretzou.qr> <g0718e$cpl$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <g0718e$cpl$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean darcy <seandarcy2@gmail.com>
Cc: netfilter@vger.kernel.org


On Sunday 2008-05-11 16:53, sean darcy wrote:
>
> I've seen references to nf_nat_sip, but no docs, howto or examples. What does
> it do that simple port forwarding doesn't? and how do you use it?

It modifies the SIP packets to contain the correct address when you
happen to NAT connections.
