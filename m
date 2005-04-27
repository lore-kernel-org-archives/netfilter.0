From: Jason Opperisano <opie@817west.com>
Subject: Re: simple question
Date: Wed, 27 Apr 2005 10:21:45 -0400
Message-ID: <20050427142144.GA22455@bender.817west.com>
References: <a0f69e50504270335efe7915@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a0f69e50504270335efe7915@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Apr 27, 2005 at 04:35:15PM +0600, Askar wrote:
> hi list
> 
>         If I put  "iptables --policy FORWARD ACCEPT" , still I need a line i-e 
> 
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

two thoughts:

1) if your last rule in the FORWARD chain is:

     iptables -A FORWARD -j DROP

   then your FORWARD chain POLICY will never be enforced, as all packets
   will be matched and dropped by the last rule.  the only reason i
   bring this up is that i keep seeing rule sets that do this:  POLICY
   set to ACCEPT and last rule set to DROP.

2) performance.  the *vast* majority of packets will match the "-m state
   --state ESTABLISHED,RELATED" rule.  putting it first in your built-in
   chains means that the vast majority of your packets will only have
   to traverse one rule before moving on.  relying on the chain POLICY
   to match these packets means these packets have to traverse *every*
   rule before moving on.  for large rule sets, this is just poor design.

final thought:  setting the default policy of your firewall to ACCEPT
isn't very good "firewalling," IMHO--but that's really more of
philosophical debate than a technical one.  no matter how permissive the
rules end up being, I always start with a default deny, and then allow
specific traffic.

-j

--
"Peter: You know, I oughta just give you some beer. Goes straight
 through you. 
 Stewie: Wonderful. And while we're at it, we can light up a doobie and
 watch porn. 
 Peter: Eh... yeah?"
        --Family Guy

