From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Questions on DNAT and pre/postrouting...
Date: Tue, 20 Jul 2004 17:23:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090358571.28742.98.camel@localhost>
References: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
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
To: Jeffrey C Albro <jalbro@bu.edu>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-07-20 at 17:02, Jeffrey C Albro wrote:
> I'm trying to wrap my head around some iptables issues with a failover box
> I'm working on.  The failover box has an interface to the outside world, 
> and an interface to each server.  
> 
> I've read every FAQ and HOW-TO I can get my hands on.  I wish the archives 
> of this mailing list was searchable...
> 
> Anyways, I have a few questions:
> 
> I understand how DNAT works in the prerouting change.  You change the
> destination and out the packet goes to the preferred server.  No problemo.  
> But when the packet comes back, the failover box appears to SNAT the
> packet.  I've seen this referred as un-DNATing.  It makes perfect sense
> that due to the client expecting packets back from the address it sent
> them to that this is required behavior, but can this be turned off or
> controlled?  I just found it odd that this happened with no iptables
> rules.
> 
> What's up the the "no filtering" guideline for the PRE and POST routing 
> chains?  I'm doing it right now and it seems to work fine, but WHY is this 
> a problem, and how else would I do it?  It seems that it would result in a 
> longer ruleset if I had to do this in the FORWARD chain.  Is lightning 
> going to strike me down?
<snip>
Your questions are strangely related.  I'm sure someone who knows the
internals of netfilter can give a better explanation but the answer is
that iptables is using connection tracking, i.e., it is stateful.  When
a packet undergoes DNAT, an entry is made in the conntrack table and it
waits for the expected reply to the current state.  When the packet
comes, it is matched in the state table and does not pass through the
tables and chains (except, I believe, the raw table).

That is why packets are un-DNAT'd without iptables rules.  The stateful
inspection engine does all the magic.  That is one reason one does not
want to implement filtering rules in the nat table -- at least I read
that the filter rules may not see all the packets.  I confess to being a
little confused by that statement as, if the packets are accepted in the
nat table because they match the state table and thus bypass the filter
table, then I would think they would not hit the filter rules anyway!!
Perhaps someone with more knowledge of the internals can clarify that.

However, there is a second reason.  What if you want to filter your DNAT
traffic (as you almost certainly want to do)? If it hits the accepting
filtering rule first, it will cease traversing the nat table and never
hit the DNAT rule.  If it hits the DNAT rule and is accepted, it will
cease traversing the nat table and never hit the filter rule.  It will
then pass to the filter table anyway to hit whatever rules you have and,
if you have none, the filter table policy.  I do hope your filter table
policy is to DROP.  I confess a strong preference for DENY all but
explicitly allowed approaches.

Hope this helps a bit - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


