From: Lucas Diaz <lucasdiaz@eternet.cc>
Subject: port forwarding AND local application consumption...
Date: Wed, 27 Sep 2006 17:55:35 -0300
Message-ID: <451AE547.8090409@eternet.cc>
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
To: netfilter@lists.netfilter.org

I use kernel 2.4.x.
I need to do port forwarding to a remote host AND to
pass these packets to a local application.

I used the DNAT feature in iptables and it does the
port forwarding. But the issue is that these forwarded
packets are unreachable to local application.

Any tips about proper iptables' rules to accomplish both?

Appreciate your help.
-D

