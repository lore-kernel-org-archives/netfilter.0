From: Jeremiah Crockett <jrmhcrcktt@gmail.com>
Subject: inadequate NEW, INVALID state definitions
Date: Tue, 1 Jun 2010 23:31:06 +0000 (UTC)
Message-ID: <loom.20100602T012732-376@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've searched the list archives and googled available iptables documentation,
but haven't yet found satisfactory explanations for iptables states, in
particular for "NEW" and "INVALID".  Does there exist a thorough reference,
short of trying to read the code, about states and transitions? 

An iptables tutorial,
<http://www.frozentux.net/iptables-tutorial/iptablestutorial.html#STATEMACHINE>
says: "The INVALID state means that the packet can't be identified or that it
does not have any state" but "does not have any state" isn't very helpful, since
it applies to initial NEW packets as well.  And "can't be identified", which is
almost identical to the manpage definition, is on a par with "UFO" for
non-descriptiveness.  Because of this, I used to think INVALID effectively meant
NOT(NEW|ESTABLISHED|RELATED), a state for packets that didn't match other
states, but I gather it's not so passive a determination as this.  Posts on this
list indicate INVALID can replace flag combination checks for nonsense
combinations, and the existence of booleans like
netfilter.ip_conntrack_tcp_be_liberal, that control whether out-of-window
packets are INVALID or not, together these hint at considerable complexity in
the actual logic.  If this is so, these packets aren't really "unidentified",
they are in fact identified and marked INVALID for a variety of reasons.  WHAT
are those reasons, is it not possible to list or describe them somewhere?
 
The same tutorial says "The NEW state tells us that the packet is the first
packet that we see."  This of course is also totally inadequate to distinguish
from INVALID.  And it goes on to say the syn flag doesn't have to be set, which
"may lead to certain problems in some instances, but it may also be extremely
helpful when we need to pick up lost connections from other firewalls, or when a
connection has already timed out, but in reality is not closed."  Well,
"pick[ing] up lost connections from other firewalls" sounds like such an edge
case.  And what are the "certain problems" that might arise, what exactly are we
letting through by allowing all NEW traffic?   Conversely, what do we break by
allowing only NEW+syn?  

It seems like connection tracking states and transitions are such a fundamental
concept to netfilter, it's hard to believe there is no clear documentation on
these topics.  Thanks for any references or clarification.

Jeremiah

