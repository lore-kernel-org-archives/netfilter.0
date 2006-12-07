From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: load balacing with https home banking
Date: Thu, 7 Dec 2006 15:08:00 +0100
Message-ID: <BAY103-DAV15AB5602B35808C59F7111B2DC0@phx.gbl>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello everybody.
I'm running linux 2.6.19 with nth match to
alternatively snat outgoing connections to
two different ip addresses.
Here is:

$IPTABLES -t nat -A POSTROUTING -s my_ip --protocol tcp -m
multiport --dports 80,443 -m statistic --mode nth --every 2 -j SNAT --to
adslA
$IPTABLES -t nat -A POSTROUTING -s my_ip --protocol tcp -m
multiport --dports 80,443 -j SNAT --to adslB

Things are working pretty good, but some
applications (home banking for example),
don't work correctly. Is there a way to
tell iptables to snat always with the same
source ip for the same destination host?



