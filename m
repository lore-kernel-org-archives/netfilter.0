From: Hadmut Danisch <hadmut@danisch.de>
Subject: Filtering encrypted vs. unencrypted packages?
Date: Sat, 30 Oct 2004 23:46:26 +0200
Message-ID: <41840BB2.6020904@danisch.de>
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

Hi,

I was just playing around with 2.6 IPSec and isakmpd and ran into a problem:

In order to have the packets from the peer IPSEC network accepted,
I need to have an entry like

iptables -A INPUT -s 192.168.19.0/24 -j ACCEPT

where 192.168.19.0 is the network behind the ipsec peer.

But if I do this, the machine would also accept unencrypted packages
from the Internet (except for the fact that packets to RFC1918-Adresses 
are not
routed, but assume that the LAN has official addresses).

I can't even distinguish them by the interface, because from an
iptables point of view, the packages are incoming on the external 
interface,
as if they were coming unencrypted.

How do I treat packets from IPSec and unencrypted plain packets from the
Internet differently with iptables?

regards
Hadmut


