From: Travis Crook <travis@visionsbeyond.com>
Subject: Forwarding traffic to smtp server
Date: Tue, 02 Mar 2004 15:16:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078265760.2567.94.camel@linsaidin.visionsbeyond.mindtrip>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi All,
	I have a question for you.  These are my current rules for sending
traffic on port 25 to my mail server.  I'm running kernel 2.4.

$IPTABLES -A FORWARD -i $EXTERNALIF -o $INTERNALIF -p tcp --dport 25 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -t nat -A PREROUTING -i $EXTERNALIF -p tcp --dport 25 -d
$MYADDR -j DNAT --to-destination 192.168.2.254:25

$IPTABLES -t nat -A POSTROUTING -o $EXTERNALIF -p tcp --dport 25 -d
192.168.2.254 -j SNAT --to-source 192.168.2.250

where $EXTERNAL is my external interface (eth0), $INTERNALIF is my
internal interface (eth1), and $MYADDR is my IP address: 12.42.147.158.


They seem to work other than my mail server views all packets as coming
from the firewall and not from external IP addresses.  Is there a way to
get the originating IP address to my mail server?

Thanks!

Travis Crook
Visions Beyond


