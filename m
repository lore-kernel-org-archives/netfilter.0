From: Zack Lawson <zack@etecom.com>
Subject: Is it possible to sync ip_conntrack between 2 hosts?
Date: 02 May 2003 15:01:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051912895.26015.49.camel@martin.etecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I am trying to setup up a failover firewall using heartbeat. Everything
seems to work just fine except for the fact that the state of existing
connections is lost when the running firewall is stopped.

Is there any way to share the info in /proc/net/ip_conntrack between
these 2 systems?

If not, does anyone else have any ideas or solutions to this problem?
I know that Cisco firewalls have this capability. I would be surprised
if netfilter couldn't accomplish this as well.

Thank you for your help

-- 
Zack Lawson <zack@etecom.com>
Systems Administrator
Einstein Industries Inc.


