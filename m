From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: OT - rule based system for a fire wall
Date: Fri, 15 Oct 2004 12:20:15 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097857214.2746.28.camel@localhost>
References: <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Ishwar Rattan <ishwar@pali.cps.cmich.edu>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Fri, 2004-10-15 at 12:16, Ishwar Rattan wrote:
> It is a little off-topic but some one here may
> know something about.
> 
> I have seen an idea being floated:
> 
> - A firewall uses a set of rules to filter packets (a fact)
> 
> - Proposal: possibility of desigaingn a rule based system
>   (call it rule-system) that will insert correct rules in the
>   firewall (sounds ambiguous)
> 
> - Is there such a thing out there? if the propser won't
>   part with any more details, what kind of gusses can be
>   made?
> 
>   1. Rule-system can interact with a user and then insert
>      rules in the firewall -- I think this has already been
>      accomplished??
> 
>   2. Rule-system could look at logged information (firewall
>      logs) and come up with better/new rules?
> 
>   3. Is there any other facet/issue that I am missing here..
> 
> It still bugs me to think of a rule-system that will insert
> rules into another rule based system :-|
> 
> Any feedback will be appreciated.
> 
> -ishwar
I'm not entirely sure I understand you.  Are you looking for something
that will dynamically change a running rule set based upon events or a
user interface to alter an existing rule set?

There are some very good rule configurators available such as fwbuild
(http://www.fwbuilder.org), shorewall (http://www.shorewall.net) and
several other that have been recommended on this list.  For a policy
rather than rules based approach, take a look at ISCS
(http://iscs.sourceforge.net).  Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


