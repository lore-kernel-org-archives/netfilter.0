From: "SiegeX" <siegex@atozcomp.com>
Subject: Recent Match Questions
Date: Thu, 2 Dec 2004 23:42:14 -0800
Message-ID: <003a01c4d90b$9b3e1020$0701a8c0@skynet>
References: <41AF0514.4030503@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

The following is an excerpt from the recent match help:

recent v1.2.11 options:
[!] --set                       Add source address to list, always matches.
[!] --update                    Match if source address in list, also update 
last-seen time.
[!] --remove                    Match if source address in list, also 
removes that address from list.


My question to you guys is I dont see the point of negating these rules. 
For example. Since --set always matches, ! --set NEVER matches, so whats the 
point?  Similarly ! --update matches if name is not in list and then updates 
the name that is not in the list?  And also ! --remove matches a name not in 
the list and then attempts to remove it?  Perhaps im not reading it right, I 
must be because the way im understanding it just doesnt make any sense.

Also, it would be nice if an option called --hittimer was added that will 
automatically reset the hitcounts after  X number of mintues.  For example

iptables -A INPUT -p tcp --dport $BAD_PORT -m recent --set
iptables -A INPUT -p tcp --dport $BAD_PORT -m recent --rcheck --hitcount 
10 --hittimer 1440 -j DROP

In this ficticous example, after a certain attacker has attempted to connect 
to $BAD_PORT 10 or more times, any further packets to this port will be 
dropped.  However after 1440mins (24 hours) his --hitcount will be cleared 
back to 0, allowing him to send up to 10 more packets.  I see no other way 
doing this with the current fuctionality of the recent match without having 
to resort to flushing the actual rule and reissuing it which is not a very 
clean way of doing things.




