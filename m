From: Sam Halliday <fommil@yahoo.ie>
Subject: Re: firewall bother
Date: Sat, 22 Feb 2003 21:41:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030222214107.66acc315.fommil@yahoo.ie>
References: <20030222202147.196de8dc.fommil@yahoo.ie>
	<20030222204627.GC16712@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030222204627.GC16712@miggy.org>
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

Athan wrote:
> > i am having trouble viewing one particular website under my current
> > firewall setup... (www.talk21.com)
>    My first thought would be this is an ECN problem.  Indeed, without
> changes I get connection refused as well.  With this rule it works:
<snip>

thankyou so much! now THAT is more support than any commerical firewall
product i have ever heard about! this webpage is now working for me :-D

> Be aware that current released kernel don't have this working.  You'll
> need a patch:
thanks, applied with fuzz (as always!)
at least it made me do a long-overdue kernel recompile with FreeBSD
partition support :-/

one small problem with these ECN modules however... i cannot unload
them! even when i have cleared my iptables chain list and all other
clean-able modules, i am unable to unload these kernel modules (which in
turn blocks me from unloading mangle, etc etc). On the same lines i have
always had trouble unloading the modules ipt_state and ip_conntrack.
ipt_state does not work with 'modprobe -r', but is OK with rmmod,
ip_conntrack however i have never been able to unload. the only other
network modules i ever have loaded are: af_packet, 8139too and mii.

thankyou again so much!
Sam
-- 
The fashionable drawing rooms of London have always been happy to accept
outsiders -- if only on their own, albeit undemanding terms.  That is to
say, artists, so long as they are not too talented, men of humble
birth,so long as they have since amassed several million pounds, and
socialists so long as they are Tories.
-- Christopher Booker

