From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 20:02:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401232002.21412.Antony@Soft-Solutions.co.uk>
References: <7A3B4AA360FDEF448F3390421FC8D731014BE940@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731014BE940@coxhpexg.coxhp.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 23 January 2004 7:48 pm, bmcdowell@coxhealthplans.com wrote:

> Are you by any chance referring to the phenomenon where everyone in the
> world uses 192.168.1.0/24 as their internal subnet?  Wherein even if you
> can get the two private subnets linked together routing fails to happen?
>
> If so, I don't think there's a solution.  Or not a good one at any rate.
> If you could guarantee unique addresses at each end, you might be able
> to pull something off with a bridge.  Or, perhaps you could use some
> NAT-magic to add 100 to the foreign IP's while in transit.  (By that I
> mean make .1 equal to .101 on the other network.)  Still though, this is
> a bad idea.  One out-of-scope IP would kill a setup of this type.  And,
> since changing one subnet or the other is probably the first idea people
> get when faced with this, I'd guess you can't control the scopes.
>
> Or, maybe I misunderstood.

I don't think Sven's problem is *quite* as bad as this (although I too could 
be mistaken and not realised that 192.168.X.X in his original diagram could 
in fact mean the same subnets in use at both ends....).

However, I agree with you that when this does turn out to be the case, there 
is no solution which works cleanly other than renumbering at least one of the 
networks (or splitting them into different subnet ranges).

I think we'll find out once he's looked into netcat to see if it will meet his 
needs.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


