From: "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Subject: forwarding groupwise live remote services
Date: Mon, 23 Sep 2002 08:56:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8F3994.5050308@ucdavis.edu>
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

Hi all, I am having a problem forwarding groupwise live remote services 
from my firewall->groupwise mta.

The setup:

remoteuser -> Firewall:1678 -> Groupwiseserver:1679
Groupwiseserver:1679 -> MASQ -> remoteuser

Here is what I have so far:
<snip>

$IPTABLES -t nat -A POSTROUTING -o eth0  -s 192.168.0.0/16 -j SNAT 
--to-source $EXTIP

# Port Forward - Send port 1678 to grpws-server:1679 for Groupwise Live 
Remote Services
$IPTABLES -t nat -A PREROUTING  -p tcp   --destination-port 1678 -j DNAT 
--to-destination 192.168.1.254:1679

$IPTABLES -A OUTPUT -p tcp -m multiport --destination-ports 
8080,25,465,22,80,443,515,1679,1678 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -p tcp -m multiport --destination-ports 
8080,25,465,22,80,443,515,1679,1678 -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -p tcp -m multiport --destination-ports 
8080,25,465,22,80,443,515,1679,1678 -m state --state NEW -j ACCEPT
<snip>

What am I missing?

-- 
Stephen Lawrence Jr. - Programmer
slawrence@ucdavis.edu
California Animal Health & Food Safety Laboratory System, UC Davis 
(530)-752-4614



