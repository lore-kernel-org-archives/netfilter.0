From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: A word about bridgeing to the wise...
Date: Tue, 12 Dec 2006 21:47:01 -0600
Message-ID: <457F77B5.9060206@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>
Cc: Mail List - Linux Advanced Routing and Traffic Control <lartc@mailman.ds9a.nl>

I have seen and responded to many different bridging related firewalling 
questions as of late.  There seems to be a common assumption that 
IPTables does not and / or can not see bridged traffic.  This is not the 
case.

If you enable the "Bridged IP/ARP packets filtering" 
(CONFIG_BRIDGE_NETFILTER) option IPTables can see and act on bridged 
traffic.  If this is turned on and you have a default filter:FORWARD 
policy of DENY, or a catch all rule of DENY, you will need to explicitly 
allow bridged traffic to be forwarded.

(excerpt from menuconfig) "Enabling this option will let arptables resp. 
iptables see bridged ARP resp. IP traffic. If you want a bridging 
firewall, you probably want this option enabled."

I hope this helps others avoid problems in the future.



Grant. . . .

