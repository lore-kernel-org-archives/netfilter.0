From: Kirk Hoganson <kirk@lenderlab.com>
Subject: Syn Acks now considered Invalid State
Date: Fri, 04 Aug 2006 15:33:02 -0600
Message-ID: <44D3BD0E.1010505@lenderlab.com>
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

I'm having a strange issue with one of my web servers.

During the course of troubleshooting a different issue the subnet mask, 
and broadcast were altered using ifconfig.  When they were set back, 
they host could no longer respond to requests from outside the firewall 
(iptables).  All syn ack packets from the web server on it's primay 
interface are caught by our INVALID state rule:

$IPTABLES -A KPSTATE -m state --state INVALID             -j LOG 
--log-prefix "STAT_D "
$IPTABLES -A KPSTATE -m state --state INVALID             -j DROP

The only change made to this system was changing the netmask and 
broadcast, and changing them back.  The web server has been restarted 
completely several times and reloaded it's original configuration.  We 
even switched over to a secondary firewall, which is still catching 
these packets and dropping them.

To further complicate the issue, requests to virtual addresses ie. 
eth0:1, eth0:2, etc. are not dropped.  Only connections to the primary 
eth0 interface.

Can someone provide me with some information that might get me looking 
in the right direction?

Log example:
Aug  4 15:39:58 STAT_D eth2    10.70.60.20    80 T  A  S  eth0 
6.60.171.86  3311
Aug  4 15:39:58 STAT_D eth2    10.70.60.20    22 T  A  S  eth0 
10.70.156.138 36749
Aug  4 15:39:58 STAT_D eth2    10.70.60.20    80 T  A  S  eth0 
6.60.171.86  3308
Aug  4 15:39:59 STAT_D eth2    10.70.60.20    80 T  A  S  eth0 
2.110.9.239  2075

