From: Venkatesh Prasad Ranganath <vranganath@cox.net>
Subject: ACCEPT/DROP
Date: Fri, 20 Dec 2002 04:42:54 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E02F42E.3080306@cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: nf@hipac.org

Hi,

I was looking into the iptables implementation and was intrigued about 
how iptables would handle a situation in which we have identical rules 
except for their targets which are contradicting, say ACCEPT and DROP. 
 By looking at ipt_do_table() function it seems that the first 
non-IPT_RETURN  verdict from any standard target will end the traversal 
of a chain of a table, which seems to be a bit odd.  First, such 
conflicting rules must not be allowed.  Even beyond, this fails in the 
situation where you have a dropping rule added after an accepting rule.

For example, a packet from m.n.o.p to a.b.c.d would be accepted at 
a.b.c.d because of the first rule, although it had to be dropped 
according to the second rule.   And this would result because of the 
order in which the rules are added to the table.

iptables -A INPUT -d a.b.c.d -j ACCEPT
iptables -A INPUT -s m.n.o.p -j DROP

Is my understanding correct?  If so, I am curious to know how nf-hipac 
behaves in such situations?

waiting for reply,

-- 

Venkatesh Prasad Ranganath,
Dept. Computing and Information Science,
Kansas State University, US.
web: http://www.cis.ksu.edu/~rvprasad



