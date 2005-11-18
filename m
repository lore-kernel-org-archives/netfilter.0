From: Brent Clark <bclark@eccotours.co.za>
Subject: Bad mac address
Date: Fri, 18 Nov 2005 11:15:38 +0200
Message-ID: <437D9BBA.9020805@eccotours.co.za>
Reply-To: bclark@eccotours.dyndns.org
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi all

I just added this to my FW

$IPT -t nat -A PREROUTING -i eth0 -p tcp -s 1.2.3.4 -m mac --mac-source 00:00:21:41:59:e6:00:13:80:9d:38:82:08:00
--dport 3389 -j DNAT --to 192.168.111.124:3389
$IPT -t filter -A FORWARD -i eth0 -p tcp -s 1.2.3.4 -m mac --mac-source 00:00:21:41:59:e6:00:13:80:9d:38:82:08:00
--dport 3389 -d 192.168.111.124 -j ACCEP

And I keep getting this message

iptables v1.3.3: Bad mac address `00:00:21:41:59:e6:00:13:80:9d:38:82:08:00'

I did a check on the message logs, and I see this in the line for MAC address, the and line matches

[INPUT  ]: IN=eth0 OUT= MAC=00:00:21:41:59:e6:00:13:80:9d:38:82:08:00

If someone would be so kind as to help me understand this, I would be most grateful.
Is it possible to get the mac address for a mac on the internet, line above I thought I could use this.

Kind Regards
Brent Clark


