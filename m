From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: ICMP floods
Date: Wed, 15 Oct 2003 09:36:05 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310150920031.15987@simba.math.ucla.edu>
References: <01d501c392d0$0a9efbb0$de0018ac@admin.monash.edu.my>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01d501c392d0$0a9efbb0$de0018ac@admin.monash.edu.my>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edmund Turner <eturner@monash.edu.my>
Cc: netfilter@lists.netfilter.org

On Wed, 15 Oct 2003, Edmund Turner wrote:
> Im tyring to create a proper ICMP chain that will blocked ICMP flooding
> by Viruses and DOS attacks. Would the ruleset below be sufficient?
> -- snip --
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth2 --limit 1 --limit-burst 10
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth1 --limit 1 --limit-burst 10
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth0 --limit 1 --limit-burst 10

You need "-j SOMETHING" -- the limit module would bypass the -j action if
it happened too often.  The man page doesn't say the default unit for
 --limit (but it says the default is 3/hour which is kind of infrequent); I
would put in an explicit unit.  Also I doubt you really need separate rate
limiting on each interface.  I see you have ACCEPT rules for every
different type of ICMP packet.  Here's a real simple rule which does
almost the same thing:

iptables -t filter -A FORWARD -p ICMP -m limit --limit 2/second \
	--limit-burst 10 -j ACCEPT
iptables -t filter -A FORWARD -p ICMP -m limit --limit 4/minute -j LOG
iptables -t filter -A FORWARD -P ICMP -j DROP

(Or you could put this in a separate chain like your example: probably just
as efficient if not more so, and more readable.)

Hope this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

