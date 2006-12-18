From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Altering connection tracking state with ICMP...
Date: Sun, 17 Dec 2006 21:11:00 -0600
Message-ID: <458606C4.6060105@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

I got to thinking about the article that I cited in my previous post 
"Interesting article about punching holes in firewalls..." 
(https://lists.netfilter.org/pipermail/netfilter/2006-December/067573.html).

Would it be possible to somehow (I leave that up to developers) monitor 
ICMP replies in response to out going packets and alter the connection 
tracking state for the outgoing packet?  I.e. if an ICMP Port / Host 
unreachable packet comes back in response to an outgoing packet then 
alter the connection tracking state for the packet somehow, say to unset 
the RELATED / ESTABLISHED state for the packet?  I would think that this 
would help thwart the problem (re)presented in the article that I cited.

Thoughts / opinions / suggestions / rants are all welcomed and encouraged.



Grant. . . .

