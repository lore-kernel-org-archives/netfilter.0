From: Nicole Haehnel <nicole.haehnel@epost.de>
Subject: Ping and traceroute denied?
Date: Wed, 18 Feb 2004 10:15:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40332D1F.5010806@epost.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I added this rules (with fwbuilder):

$IPTABLES -A FORWARD -p icmp  -m state --state NEW  -j ACCEPT
$IPTABLES -A OUTPUT -p icmp  -m state --state NEW  -j ACCEPT
$IPTABLES -A INPUT -p icmp  -m state --state NEW  -j ACCEPT


Why was ping from an interface of my firewall-host denied?
Traceroute too.

What rule shall I add?

Thanks!

Nicole


