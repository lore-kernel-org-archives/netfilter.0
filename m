From: Martin Skarda <skarda@uni-freiburg.de>
Subject: Problem blocking dhcp discoveries ??
Date: Tue, 14 Mar 2006 21:55:56 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0603142108050.12862@persil.ruf.uni-freiburg.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I'm trying to protect my dhcp server with some rules within iptables 
against DoS with some limits. The limit module works fine, and when the 
burst-limit is reached, I'll see the "hopefully dropped" packages in my 
log target.

But the drop doesn't really work: the packages are still going through my 
firewall to my dhcp server. Even when I remove all rules from my input 
table, concerning/matching any udp traffic.

The dchp server is on the same machine, and I tested this behavior with a 
simple hping burst from a external host. My default policies are all set 
to drop.

here is my rulset concerning dhcp:
**snip**
$IPT -A DHCP -p UDP --sport 68 --dport 67 -m limit \
 	--limit ${DHCP_FLOOD} -j ACCEPT
$IPT -A DHCP -p UDP --sport 68 --dport 67 -m limit \
 	--limit ${LOG_FLOOD} -j LOG --log-level info \
 	--log-prefix "(in): **DHCP-Flood** :"
$IPT -A DHCP -p UDP --sport 68 --dport 67 -j DROP
**snap**

Where is my mistake? Why do I see all the bursts on my dhcp server even if 
the dmesg output and the iptable counters are telling me that the packages 
are dropped?

thanks for your help,
   Martin

