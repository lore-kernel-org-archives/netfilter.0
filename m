From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: RE: big table tweaks ?
Date: Thu, 15 Sep 2005 10:23:01 -0400
Message-ID: <1126794181.2624.22.camel@localhost>
References: <201E6F5AC48C274996A5AD8304FAEF860BFCFE@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF860BFCFE@p001ex03.porta.local>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jan Eidtmann <cmak_@arcor.de>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

On Thu, 2005-09-15 at 14:09 +0200, Baake, Matthias wrote:
> hi,
> 
> try to split up your input rules into some custom chains that the packets have 
> not a really long way to traverse your input chain thats what i would do..
> 
> greets
> matthias
> 
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of 
> > Jan Eidtmann
> > Sent: Wednesday, September 14, 2005 2:43 PM
> > To: netfilter@lists.netfilter.org
> > Subject: big table tweaks ?
> > 
> > 
> > hello,
> > 
> > i have one kind of big table with 80.000+ rules. its referenced in
> > INPUT. lookup (when someone wants to connect) is kinda slow and system
> > hangs noticable (desktop usage). i tried preemptive and non_preemptive
> > kernels, its all the same. so, is there anything i could tweak to make
> > this run smooth?
> ><snip>
If you're dealing with something that large, I would suggest you look at
how we handle rule sets in the ISCS network security management project
(http://iscs.sourceforge.net).  There is extensive documentation on how
it works.  You will especially want the document in the devel-docs
directory named PEPPacketFlow.  Since the code is still pre-alpha, we
have included the development docs in the tarball.

ISCS created rule sets are commonly the size you are referring to
because we granularly identify users and the individual resources to
which they need access (e.g., executive and financial staff only need
access to http and https only on the xyz server in New York).

The magic is done through custom chains but we take them a few steps
further.  We separate the evaluation of the question "who has access to
what," that is instead of one rule, we break each access into three
rule, first identify who they are, second find out what they have access
to, third grant or deny access.  This creates more overhead in small
rule sets but, in large rule sets, it gives you the advantage of
modularity and reusability.  In other words, with monolithic rules, I
need a rule to identify every possible combination of who and what.
With modular rules, I only need one rule for each "who" and one rule for
each "what" and then mix and match them as needed.  The result is the
same security with far fewer rules.

We then go further and arrange these rules in dual hierarchical
structures with inheritance, one for Accessors (our word for users) and
the other for Resources (the combination of a server and a service,
basically a socket).  This dramatically reduces the number of rules
required to implement highly granular security and is one of the major
reasons why the time to administer security with ISCS is reduced by
roughly 90% over the major commercial offerings like SolSoft.  Thus, one
can create a single rule which can apply to many different combinations
of users and resources.

We then take all of this and abstract the creation process away from
direct rule creation (who has time to write and maintain 80,000 rules in
a rapidly changing environment) into a small number of powerful, order
independent access control policies.

Even if you do not use ISCS to create your rules (it is still
pre-alpha), you may find understanding the rule creation paradigm very
helpful for your environment. Good luck - John

-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


