From: "Edmund Turner" <eturner@monash.edu.my>
Subject: RE: ICMP floods
Date: Thu, 16 Oct 2003 10:38:09 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02fc01c3938e$8b13de00$de0018ac@admin.monash.edu.my>
References: <Pine.LNX.4.53.0310150920031.15987@simba.math.ucla.edu>
Reply-To: <eturner@monash.edu.my>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0310150920031.15987@simba.math.ucla.edu>
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
To: 'Jim Carter' <jimc@math.ucla.edu>
Cc: netfilter@lists.netfilter.org


Jim, Thanks for the tip!. I just noticed that I missed the 'J'. Ive
rewritten the rules as you advised. 

Regards
edmund

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jim Carter
Sent: Thursday, October 16, 2003 12:36 AM
To: Edmund Turner
Cc: netfilter@lists.netfilter.org
Subject: Re: ICMP floods

On Wed, 15 Oct 2003, Edmund Turner wrote:
> Im tyring to create a proper ICMP chain that will blocked ICMP
flooding
> by Viruses and DOS attacks. Would the ruleset below be sufficient?
> -- snip --
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth2 --limit 1
--limit-burst 10
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth1 --limit 1
--limit-burst 10
> /sbin/iptables -A ICMP -m limit -p ICMP -i eth0 --limit 1
--limit-burst 10

You need "-j SOMETHING" -- the limit module would bypass the -j action
if
it happened too often.  The man page doesn't say the default unit for
 --limit (but it says the default is 3/hour which is kind of
infrequent); I
would put in an explicit unit.  Also I doubt you really need separate
rate
limiting on each interface.  I see you have ACCEPT rules for every
different type of ICMP packet.  Here's a real simple rule which does
almost the same thing:

iptables -t filter -A FORWARD -p ICMP -m limit --limit 2/second \
	--limit-burst 10 -j ACCEPT
iptables -t filter -A FORWARD -p ICMP -m limit --limit 4/minute -j LOG
iptables -t filter -A FORWARD -P ICMP -j DROP

(Or you could put this in a separate chain like your example: probably
just
as efficient if not more so, and more readable.)

Hope this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA
90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for
PGP key)


