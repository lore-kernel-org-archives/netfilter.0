From: besteinm@phys.ethz.ch (Benoit Steinmetz)
Subject: dhcp weirdness with iptables
Date: Tue, 23 Sep 2003 16:09:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030923140933.GA22498@phys.ethz.ch>
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

hi

i get my ip address from a dhcp server. i have experienced strange behaviour of
my iptables-firewall:

it seems that the dhcp packets seem to be unaffected by the firewall, because,
no matter how restrictive i setup the firewall, the udp packets coming from
port 67 on the dhcp-server and going to the local port 68 pass through. has this
something to do with the linux socket filter (CONFIG_FILTER in the kernel
configuration), which is needed by dhcp to work correctly?

thanks

benoit steinmetz.

