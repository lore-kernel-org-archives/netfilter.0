From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: RE: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 10:18:22 -0800
Message-ID: <499da285.18068e0a.2a5f.ffffc031@mx.google.com>
References: <499D9292.902@colsmemory.co.uk> <d39744a20902190936u48f082d9p7c0da22a6948e6d8@mail.gmail.com> <499D99F4.2010400@colsmemory.co.uk> <84965006-A4F7-41DD-8C6F-ED62AA82B2F9@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=4mr6wUohgSz++8/fQUA5+G/cVUYz/lUcYGucRpUjU/k=;
        b=nRnI+8qo4GG1cFqFnS/q0y7Da6TCpOqNFdFZzVYmvYxNTiVcwg1UL/J9GRfAKx2JBd
         x3NHLxlRiSnBG+VVmh17NC07CghP9MmTt9Z9q7hsHBjDWfJVN2C+jILRguB3swFG+bGK
         EG4lzq+bJs/ejyF+57bhpDrTDpDqkRpe/2HAc=
In-Reply-To: <84965006-A4F7-41DD-8C6F-ED62AA82B2F9@dancing.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

One thing to note is that you actually delete the exact same rule you added.
There is no built-in method to do that.
I can think of a few ideas how to verify that (with high probability, not
100%) but it really depends on the actual requirements.

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Peter Renzland
> Sent: Thursday, February 19, 2009 9:57 AM
> To: Colin Davis
> Cc: netfilter@vger.kernel.org
> Subject: Re: iptables - how to create a rule that expires automatically
> 
> I would write a simple script "ipoff NN" which takes the same
> arguments as iptables (after NN), converts -I and -A to -D, etc, and
> sleeps NN minutes before doing the cancel.
> 
> Then, after running the command that sets up the rule, I would just
> arrow up and change iptables to ipoff NN.
> That would be *very usable*, IMHO.
> 
> (I most definitely would not use cron or at, since those tools do not
> naturally match the problem at all.)
> 
> 
> Peter
> 
> 
> On 09  Feb 19, at 12:42 , Colin Davis wrote:
> 
> >
> > Thanks Ivan, I was hoping to be able to do this directly using a rule
> > without writing a script / using cron but looks like that's what I'm
> > going
> > to have to do.
> >
> > Colin.
> >
> >
> > Ivan Petrushev wrote:
> >> I'm not sure if that can be done with the netfilter itself.
> >> You could always get a script into crontab to check if the rule is
> >> matched (iptables ... -L -n -v will show you number of packets
> >> matched
> >> by the rule) and set up some sort of a timer.
> >>
> >> Ivan
> >>
> >> On Thu, Feb 19, 2009 at 7:10 PM, Colin Davis <col@colsmemory.co.uk>
> >> wrote:
> >>
> >>> Hi,
> >>>
> >>> Not sure if this is possible. I wish to create a rule that once
> >>> created will
> >>> automatically expire (and be removed) after say 10 minutes.
> >>>
> >>> Please
> >>>
> >>> Many thanks,
> >>> Colin.
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe
> >>> netfilter" in
> >>> the body of a message to majordomo@vger.kernel.org
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>>
> >>>
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter"
> > in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

