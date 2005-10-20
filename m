From: iptables-user@lists.theorb.net
Subject: how to let recursive nameserver through
Date: Thu, 20 Oct 2005 12:50:38 -0700
Message-ID: <4357F50E.20907@lists.theorb.net>
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

Hi all,

I have a 3-leg router/firewall and would like to run a recursive caching
nameserver (djb's dnscache) on it, but can't figure out how to get it
past the firewall to query upstream nameservers.

eth0 : lan
eth1 : wan which connects to default gateway to internet
eth2 : dmz (10.0.0.1 for 10.0.0.0/24)

dnscache is running on ip 10.0.0.1 on eth2.  If it cannot resolve the
query from a local (inside) authority it must go outside and begin by
querying the root-servers via eth1.  This is where it fails.

If I run dnscache on a machine attached to eth2 requests are FORWARDED
from eth2 to eth1, then via the gateway and all is well; however, when
run ON eth2 outbound traffic is blocked.

Default policies are INPUT:DROP, FORWARD:DROP, OUTPUT:ACCEPT.

I can't even figure out where to try to put a rule for this, or how to
write it.  Since it's an address ON the router it wouldn't be on the
FORWARD chain, right?

I'm totally baffled.  Anybody have any ideas where to begin debugging this?

Thanks for any help.


