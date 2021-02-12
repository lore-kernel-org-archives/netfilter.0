From: Balazs Scheidler <bazsi77@gmail.com>
Subject: Re: Unable to create a chain called "trace"
Date: Fri, 12 Feb 2021 19:02:21 +0100
Message-ID: <20210212180221.GA3914830@bzorp>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
 <20210208171444.GH16570@breakpoint.cc>
 <20210209135625.GN3158@orbyte.nwl.cc>
 <20210212000507.GD2766@breakpoint.cc>
 <20210212114042.GZ3158@orbyte.nwl.cc>
 <20210212122007.GE2766@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GQgEcIkoxwTqPRvy9e36k1BAwElKdvgBPKpg2hQjyqE=;
        b=o7vlo6QFlFqsHxUV+hZED5V6DNYDvCzdGZU+E0OaoIwWSWWuutrDkEBb+q0wBPMMAL
         prkJi9bs1JPCG9GYJrdlcDXxkiBZc3Uwe7/NdpvwvJFao3UXCYdq4i26q2QbFcqB129m
         1kxeU2LOW4o10DtRk7iIW7bqOBLpZWKWZZRIBZgvh8O+Sek2+zIFFMmLFjENHp3tTHKL
         r9Oh2IrE5X3IKxlqKo6Jsjc9wfyNSCRIbM+ihbCRBQYaCurPo+XVHC+NPsvhHNKdy30T
         ja7IgkonjRZlxLnaqY5M0mrvJNnmAe3pR7woVdJR8JFr4K8dIkSwH4VPRGsu1qEpxHbb
         fipg==
Content-Disposition: inline
In-Reply-To: <20210212122007.GE2766@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>, Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

On Fri, Feb 12, 2021 at 01:20:07PM +0100, Florian Westphal wrote:
> Phil Sutter <phil@nwl.cc> wrote:
> > I didn't find a better way to conditionally parse two following args as
> > strings instead of just a single one. Basically I miss an explicit end
> > condition from which to call BEGIN(0).
> 
> Yes, thats part of the problem.
> 
> > > Seems we need allow "{" for "*" and then count the {} nests so
> > > we can pop off a scanner state stack once we make it back to the
> > > same } level that we had at the last state switch.
> > 
> > What is the problem?
> 
> Detect when we need to exit the current start condition.
> 
> We may not even be able to do BEGIN(0) if we have multiple, nested
> start conditionals. flex supports start condition stacks, but that
> still leaves the exit/closure issue.
> 
> Example:
> 
> table chain {
>  chain bla {  /* should start to recognize rules, but
> 		 we did not see 'rule' keyword */
> 	ip saddr { ... } /* can't exit rule start condition on } ... */
> 	ip daddr { ... }
>  }  /* should disable rule keywords again */
> 
>  chain dynamic { /* so 'dynamic' is a string here ... */
>  }
> }
> 
> I don't see a solution, perhaps add dummy bison rule(s)
> to explicitly signal closure of e.g. a rule context?

You can always push/pop the flexer state from bison code blocks, maybe
that's what you mean on "dummy bison rules".

Trigger the state from bison and make sure it ends.

Something like this:

diff --git a/src/parser_bison.y b/src/parser_bison.y
index 11e899ff..d8107181 100644
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -2397,7 +2397,10 @@ chain_policy             :       ACCEPT          { $$ = NF_ACCEPT; }
 identifier             :       STRING
                        ;
 
-string                 :       STRING
+string                 :       { yy_push_state(scanner, STRING); } __string { yy_pop_state(scanner); }
+                       ;
+
+__string               :       STRING
                        |       QUOTED_STRING
                        |       ASTERISK_STRING
                        ;

-- 
Bazsi
