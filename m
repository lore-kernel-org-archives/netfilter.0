From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Help with packet marking
Date: Thu, 29 Mar 2012 10:55:32 -0400
Message-ID: <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
References: <4F74194E.9030608@kickstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=lGMBQ4IPnQVIMaIUKwKxXwgRerNJuk/xjEYaj523uS4=;
        b=qngM2Z9GmgkGGatGSE948jcB6wmTi/ry+01wsy4SADMeMj3CQmalulVEaTmZWYkL5h
         jfLYGZYhBOMynPAdtT68SYRS+WDbH5uatYI+tcHmGA6cuLFC21x5JFrrdzgZ63Qnr1NS
         bYgRD4FKn66QIOC2NfeNE1C3hFZ0WWuteLizMRIaU3y7wQ2YXPAvu1PHQ4FwkIx28lo3
         9BkkUDSq8IubKalPJuGTBp0CsRCAhOJ9y7ANYdZjLSao0DWQU/2vus17brn649HBBoWe
         qtcTLFdbi1Y82mG1NF1mrFTJOSw7IQ1AbAC00ozfgDi6KDKy3Z/z4PyK1p6u7qsdhLrk
         P/6Q==
In-Reply-To: <4F74194E.9030608@kickstone.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Lister <john.lister@kickstone.co.uk>
Cc: netfilter@vger.kernel.org

2012/3/29 John Lister <john.lister@kickstone.co.uk>:
> It seems to be selecting the correct route using the marks as iptables
> reports the correct interface in the log files.
> However the packet then goes out of a different interface.

Show us all firewall and routing rules (at least the main)...
   iptables -t mangle -nL -v
   ip rule ls

> This has always worked before, the default route is in the main table (maybe
> not clear before) and is used so that
> the box can route local packets out. Your example (below) would do the same
> except skip the fwmark rules

Not exactly. In my example, to skip the fwmark process the destination
address must be known by the main table. And you dont need to treat
your essential routes in alternative tables (only default gw). For
this reason,  you couldnt use a default gw in main table (*my
example*).

But, i still not sure why your setup has stopped working.

> Yes, sorry when doing the example missed off the -m state --state NEW bit...
> I still find it strange that recently packets I'd expect to be in the NEW
> state are ESTABLISHED. eg doing
> ping blah
> ping blah
> results in the first outgoing packet being NEW, but the second ping is
> ESTABLISHED, surely this is a bug?

Why you need to work with connection STATEs in firewall MARKs?

Tell me more about your configuration.
I can check your firewall confs if you open your ssh access for me
(send me account in pvt - if you like).
