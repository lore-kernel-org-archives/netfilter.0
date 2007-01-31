From: Matteo Cisilino <matteo@cisilino.com>
Subject: advanced routing policies
Date: Wed, 31 Jan 2007 09:54:27 +0100
Message-ID: <200701310954.28105.matteo@cisilino.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi all, i hope that this question is posted in the right place.

I need to reach a network from 2 netwroks sources

A firewall with DMZ 

Green : 172.X.1/16
Orange :172.Y.1/16
RED : xxx.xxx
openvpn

B firewall dedicated to ipsec 

green 172.X.2/16
red : xxx.xxx
ipsec

I need that the two networks 172.X and 172.Y reach 192.168/20 that's in the 
other side of the two vpns but, the Y network must reach the other side 
directly via the firewall A.

The firewall A has a static route to 192.168 ( and must stay that way ) via 
firewall B.

Not i'm out of mind how to mark the traffic from the source, to selec wich 
gateway to use.

Hope this can be easy to understand , bcouse it's not so simple to explain 
( my English is quite basic )

Regards
Matteo C.

