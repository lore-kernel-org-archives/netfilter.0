From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: transparent proxy
Date: Sat, 13 Mar 2010 10:41:08 -0600
Message-ID: <20100313164108.GB10986@minipax>
References: <21B7BA85E0A248919216BC6546842EFB@sence>
 <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz>
 <4B9B4B03.7000708@chello.at>
 <20100313100504.GA10986@minipax>
 <4B9B804D.7070702@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B9B804D.7070702@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sat, Mar 13, 2010 at 01:08:45PM +0100, Mart Frauenlob wrote:
> On 13.03.2010 11:05, netfilter-owner@vger.kernel.org wrote:

NB, your MUA is changing the attribution to the envelope sender.
Please don't blame the list owner for what I said! :) In a list
reply, the attribution should be the header From: address, not the
SMTP envelope sender address.

> > On Sat, Mar 13, 2010 at 09:21:23AM +0100, Mart Frauenlob wrote:
> >> Amos Jeffries:
> >>> Please read the Squid FAQ examples of how to configure policy 
> >>> routing ...
> >>>
> >>> Router:
> >>>  http://wiki.squid-cache.org/ConfigExamples/Intercept/IptablesPolicyRoute
> >>>
> >>> Squid box:
> >>>  http://wiki.squid-cache.org/ConfigExamples/Intercept/LinuxDnat
> >>
> >> I'd like to ask, if in the above examples, the ACCEPT
> >> rules need to be placed in the mangle table?
> >> Is there a specific reason, couldn't it be done in the
> >> filter table?
> >> As that would be the intended/preferred use for filtering?
> >> If so, don't the examples teach people 'bad manners'?
> > 
> > I think Mart is misunderstanding the effect of ACCEPT in mangle.
> > It does not override nor bypass the filter table. It merely
> > means, "we are done mangling this packet."
> 
> ACCEPT in mangle differs from ACCEPT in filter?

Strictly speaking, no, ACCEPT is ACCEPT. Look at no more rules,
disregard the chain's policy, pass Go, collect $200.

> Where is that documented?
> So you have to ACCEPT it twice? In mangle and in filter table?

And raw, and nat ... the packet hits all relevant chains/tables. Any
of these could change a packet's fate. However, IIUC support for the
DROP target in nat and mangle has been removed.

> > The MARK target is one of those sneaky non-terminating targets.
> > A mark is applied, and the packet continues in that particular
> > chain. Further -j MARK rules could be applied. The ACCEPT rule
> > prevents this.
> 
> Don't we use the RETURN target for that? But yes, that implies a
> problem, if you RETURN from a user-defined chain.

RETURN in a built-in means "go to the policy." In a user chain it
means "go to the next rule in the calling chain". As you point out,
there could be issues with that as the example. ACCEPT works. The
only minor nitpick I can think of is that the example used -A,
whereas -I would have covered more cases of crazy mangle rulesets.

But, -I would fall into the "bad manners" category you were asking
about originally. :) If someone has crazy mangle rules, let's hope
they understand those rules, because if they don't, they'll have
other problems beyond getting their squid working. :)
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
