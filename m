From: Andrej Martchouk <martchouk@yahoo.de>
Subject: Multicast rules problem
Date: Fri, 6 Aug 2004 00:19:38 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040806071941.24804.qmail@web12706.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello everybody,

I'm trying to create the correct rules for Multicast
Traffic across the firewall.
On firewall machine runs the multicast router (pimd).
So I need to enable UDP traffic from outside. 
But I can't see any solution to create a statefull
configuration for Multicast, so that any host from
internal network can subscribe for another group, and
the firewall allows streams for this group adress only
from one sender.
The another question is, how to handle PIM SM traffic?

regards
buslik 


		
__________________________________
Do you Yahoo!?
Yahoo! Mail - Helps protect you from nasty viruses.
http://promotions.yahoo.com/new_mail

