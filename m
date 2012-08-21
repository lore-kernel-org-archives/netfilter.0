From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: old question revisited: can rely in 'iptables-restore' format?
Date: Mon, 20 Aug 2012 22:21:37 -0400
Message-ID: <201208202221.37529.neal.p.murphy@alum.wpi.edu>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl> <20530.51137.458307.357243@tree.ty.sabi.co.UK> <20120821003026.GD3672@harrier.slackbuilds.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120821003026.GD3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 20 August 2012 20:30:26 /dev/rob0 wrote:
> The main benefit is that iptables-restore is atomic. All changes
> are committed in one pass. Any error in the ruleset means your
> existing ruleset is not replaced.

[Minor digression]
By 'atomic', do you mean that all of the changes are made with a single 
COMMIT, regardless of how many tables are accessed and regardless of how many 
rules are processed?

It's been my experience that there is an implicit COMMIT at every table 
change, and there is a ballpark limit of around 20,000 rules per commit. Thus:
  - if the file you are feeding to iptables-restore references one table only
    and contains fewer than around 20,000 rules, the operation will be atomic.
  - if the file you are feeding to iptables-restore references more than one
    table and contains fewer than around 20,000 rules per table, then only the
    changes *per table* will be atomic.
  - If the changes to a table contain more than around 20,000 rules, then 
    that operation will require more than one COMMIT and will NOT be atomic.

When relatively small change sets are involved, I agree that iptables-restore 
is atomic. But when very large change sets are involved, I disagree: iptables-
restore is *not* necessarily atomic. To be pedantic, it would be correct to 
say that iptables-restore operates atomically only under certain conditions.

N
