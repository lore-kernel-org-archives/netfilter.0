From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: how to best limit "rate of rejects"
Date: Wed, 6 Oct 2010 14:45:49 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010061444180.21694@obet.zrqbmnf.qr>
References: <20101006142149.95231l9rz87p044g@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101006142149.95231l9rz87p044g@webmail.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-10-06 14:21, Christoph Anton Mitterer wrote:

> Hi.
>
> Using the same setup as described here
> (http://thread.gmane.org/gmane.comp.security.firewalls.netfilter.general/40849)
> I have one problem:
>
> At least ping (if not limiting with -c), and possibly other service, just goes
> crazy and massively sends ECHO request when the packets are rejected (because
> no IPsec handling would be done).
> This really eats up my CPU ;)
>
>
> Is there some smart way to just limit the rate on those rejects? e.g. something
> like a "wait with sending the reject for a second" target?

-m hashlimit --hashlimit 1/second

> And would that even make sense?

Yes, applications for hashlimiting have been found 
http://jengelh.medozas.de/documents/Chaostables.pdf
