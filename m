From: <seldeterre@yahoo.com>
Subject: Multihomed firewall/router
Date: Fri, 30 Jan 2004 06:21:17 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040130142117.66050.qmail@web41209.mail.yahoo.com>
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

I have a firewall/router performing snat.  This is its
configuration.

                        eth1-192.168.1.0/24
                       /
Internet--eth0-firewall-eth2-192.168.2.0/24
                       \
                        eth3-192.168.3.0/24

My iptables setup is successfully blocking connections
from eth0.  However, I need to segregate the internal
subnets from each other because the belong to
different organizations.  No matter what I try I can't
seem to block pings from one subnet to another.  I can
lock it down to only allow input access to the
interface the subnet is directly connected to, but I
need to provide dns access to eth1 and this breaks
when I do this.

The firewall is running a caching dns server(djbdns)
on eth1.  It also provides dhcp leases, and ntp
services on eth1-3.

I have also noticed that when I flush the tables and
delete the chains.  Nat is still provided, i.e. I can
still connect to the internet.

Any pointers or help would be greatly appreciated.

Jeremy Hendrickson

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

