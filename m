From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: old question revisited: can rely in 'iptables-restore' format?
Date: Wed, 22 Aug 2012 12:35:12 -0500
Message-ID: <20120822173512.GO3672@harrier.slackbuilds.org>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl>
 <20530.51137.458307.357243@tree.ty.sabi.co.UK>
 <20120821003026.GD3672@harrier.slackbuilds.org>
 <201208202221.37529.neal.p.murphy@alum.wpi.edu>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201208202221.37529.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Aug 20, 2012 at 10:21:37PM -0400, Neal Murphy wrote:
> On Monday 20 August 2012 20:30:26 /dev/rob0 wrote:
> > The main benefit is that iptables-restore is atomic. All changes
> > are committed in one pass. Any error in the ruleset means your
> > existing ruleset is not replaced.
> 
> [Minor digression]
> By 'atomic', do you mean that all of the changes are made with a 
> single COMMIT, regardless of how many tables are accessed and 
> regardless of how many rules are processed?

I don't know. I was hoping that someone familiar with the source 
would answer.

> It's been my experience that there is an implicit COMMIT at every 
> table change, and there is a ballpark limit of around 20,000 rules 
> per commit. Thus:

>   - if the file you are feeding to iptables-restore references one
>     table only and contains fewer than around 20,000 rules, the
>     operation will be atomic.

>   - if the file you are feeding to iptables-restore references more
>     than one table and contains fewer than around 20,000 rules per
>     table, then only the changes *per table* will be atomic.
>   - If the changes to a table contain more than around 20,000 rules,
>     then that operation will require more than one COMMIT and will
>     NOT be atomic.
> 
> When relatively small change sets are involved, I agree that 
> iptables-restore is atomic. But when very large change sets are 
> involved, I disagree: iptables-restore is *not* necessarily 
> atomic. To be pedantic, it would be correct to say that 
> iptables-restore operates atomically only under certain
> conditions.

Interesting, thanks. I think my post was right in the usual case, 
however, and that your examples of >20K rules might be better
handled by ipset(8).
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
