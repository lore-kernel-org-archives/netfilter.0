From: Samuele Giovanni Tonon <samu@mclink.it>
Subject: nat and multicast over ipv4
Date: Sun, 27 Jul 2003 23:57:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030727215742.GA23685@linuxasylum.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

hi,
after trying some configuration i didn't come with a solution for the 
following problem: 

a Linux box with two eths is acting as a gateway that nat a private
lan to go to the internet.
The ISP use multicast, and all the isp routers are capable of forwardin
multicast traffic.
i would like to make it possible to join to multicast group from the inside
lan.
So the linux box has to forward/nat (i read igmp nat is in the TODO of
netfilter) igmp announcement, and after the join
it has to forward udp traffic that comes from 224/4.
What are the steps to do that with iptables ?
Does the linux box has to have Multicast Routing options in the kernel 
enable ? (looking to the help from the kernel it doesn't look it has to
be enable) .

Multicast-HOWTO is rather old, and it doesn't have any hint, also
mrouted is needed only when you want to tunnel the multicast traffic
from a lan to an another that is multicast capable, but that's not
the examples 'cause the isp after the linux box can "understand" multicast.

Any hint, suggestion, resource for this problem ? 

Thanks
Samuele 



-- 
When all the network has eyes, even if we were to send out minds turned into
light or electrons...  
It is a time when "one" is not able to make a "solid", a complex, into 
data yet...

