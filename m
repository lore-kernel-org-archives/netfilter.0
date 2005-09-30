From: Lore <skizzo82@yahoo.com>
Subject: LibIPQ, Reading the real destination Address in outgoin pkts
Date: Fri, 30 Sep 2005 15:01:16 +0200 (CEST)
Message-ID: <20050930130117.8093.qmail@web52813.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everybody.

I'm having problems trying to read the iphdr->daddr
from a Packet read from the Queue.
Expecting to find the real destination of the packet I
find my own IP address.

The chain I used is 
iptables -t filter -A OUTPUT -j QUEUE
I tryied to use the nat table too but the result is
the same.

Is there any way to avoid header change from iptables
(if it's iptables'fault) or any way to solve the
problem.

Thanks in advance.
bye


		
___________________________________ 
Yahoo! Messenger: chiamate gratuite in tutto il mondo 
http://it.messenger.yahoo.com

