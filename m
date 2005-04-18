From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: DROP
Date: Mon, 18 Apr 2005 07:37:22 +0200
Message-ID: <42634792.2070307@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

I was wondering, if was adviseable to set the default policy for tables 
nat and mangle to DROP.
Current in my ruleset I have it as soo.

$IPT -t nat --policy PREROUTING ACCEPT
$IPT -t nat --policy OUTPUT ACCEPT
$IPT -t nat --policy POSTROUTING ACCEPT
$IPT -t mangle --policy PREROUTING ACCEPT
$IPT -t mangle --policy POSTROUTING ACCEPT

The default policy I have as soo:
$IPT --policy INPUT DROP        #Setting the default policy for INPUT chain
$IPT --policy FORWARD DROP      #Setting the default plicy for FORWARD chain
$IPT --policy OUTPUT DROP       #Setting the default policy for the 
OUTPUT chain

So do i need to need to go the extra mile and set the default policy for 
tables nat and mangle to DROP.

Just something I was thinking.

Kind Regards
Brent Clark

