From: ro0ot <ro0ot@phreaker.net>
Subject: destination nat onto the same network
Date: Thu, 17 Jun 2004 20:18:53 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D18C2D.9030700@phreaker.net>
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

Hi all,

I have one webserver inside my LAN but when I try to browse it via the 
hostname (eg. www.example.com) from a workstation inside my LAN, the 
browser can't reach the page.  Why?  From remote (outside), I can browse 
to the website.

Below is a simple diagram of my network: -

INTERNET <-> ROUTER <-> FIREWALL_IPTABLES <-> SWITCH <-> WEBSERVER + 
OTHER_WORKSTATIONS

Here is my simple firewall rules: -

$IPTABLES -P INPUT DROP
$IPTABLES -P FORWARD DROP
$IPTABLES -P OUTPUT DROP

$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

$IPTABLES -t nat -A PREROUTING -i $fwif -p tcp --dport 80 -j DNAT --to 
$webserver_ip

$IPTABLES -t nat -A POSTROUTING -o $fwif -j MASQUERADE

Regards,
ro0ot



