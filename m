From: james li <shijialeeee@yahoo.ca>
Subject: iptables questions
Date: Tue, 26 Nov 2002 18:33:26 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021126233326.75120.qmail@web14507.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

i am learning iptables through the HOWTO. there is one
command i am not sure. can someone explain it to me
please?

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT

from author  'this rule will allow all traffic from
our $LAN_IFACE to any other interface to flow
freely,in other word,in other words allow all traffic
from our LAN to the Internet'. 

is there a default '-o eth+' in the above command that
is omitted ? should it better be 
$IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -j
ACCEPT

INET_IFACE as (internet_interface)


/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

