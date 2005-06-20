From: Luca Abeni <lucabe72@email.it>
Subject: How to use ip_queue without linking libipq?
Date: Mon, 20 Jun 2005 12:29:53 +0200
Message-ID: <1119263393.1985.10.camel@labeni.mm.mbigroup.it>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I've been asked to develop a user-space application receiving packets
from the ip_queue module. I know the simplest solution would be to use
libipq, but unfortunately the application cannot be released under GPL
(because it also uses some proprietary code).

So, I am thinking about directly interacting with the ip_queue module by
using netlink. However, I know how to open a netlink socket, but I've
not been able to find any documentation about how to use a netlink
socket to communicate with ipqueue...

I think that looking at libipq code for understanding how to use ipqueue
would be a license violation (I would end up with a code too similiar to
libipq), right?

Is some documentation about directly using ipqueue available somewhere?
Can anyone help me?

			Thanks,
				Luca

(P.S.: please cc me because I am not subscribed to the mailing list)
-- 
_____________________________________________________________________________
Copy this in your signature, if you think it is important:
                               N O    W A R ! ! !


