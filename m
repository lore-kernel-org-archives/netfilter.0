From: Lim Boon Ping <syseeker@yahoo.com>
Subject: Setup simple PC-based router using IPTABLES
Date: Wed, 12 Jan 2005 00:53:42 -0800 (PST)
Message-ID: <20050112085342.40592.qmail@web12503.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
 
I need some help on using IPTABLES to setup a simple PC-based router (for LAN usage).
The PC consists of  a 10/100 NIC on eth0, and a gigabit fiber NIC on eth1. The gigabit fiber NIC is connected to another fiber-based port, whereas the 10/100 NIC is connected to a 10/100 hub. Now, for all packets coming from eth0, forward it to eth1, and vice versa. 
Could anyone verify/suggest commands to set for this setting?
# iptables -A FORWARD -i eth0 -o eth1 
# iptables -A FORWARD -i eth1 -o eth0 
 
Is it that's all we need to do? Thanks.
 
Regards,
Jocelyn

		
---------------------------------
Do you Yahoo!?
 Read only the mail you want - Yahoo! Mail SpamGuard.
