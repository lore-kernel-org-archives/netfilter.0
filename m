From: Shaun Savage <savages@cascadiabhc.org>
Subject: conntrack has problems with syn-ack-psh set
Date: Mon, 27 Dec 2004 16:59:52 -0800
Message-ID: <41D0B008.1030400@cascadiabhc.org>
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

I am have a problem getting iptables to work with a bain dead linksys 
printserver.  After is receives a syn packet it send a syn-ack-psh 
packet.  Is psh allowed here?  The conntrack can't find a match and the 
  packet is INVALID.  NO connection.

my firewall looks like this, please forgive wraparound, spelling,...
eth1 net
eth0 local


$IPT -t nat -A PREROUTING -i eth1 -p tcp --dport 9100 -j DNAT --net-dest 
                                                192.168.0.49

$IPT -t nat -A POSTROUTING -o eth1 -j MASQUERADE

$IPT -A FORWARD  -i eth0  state --state INVALID -j DROP


Do I have mangle the packet first to get rid of the push flag? how?
Is this a feature if iptables?

shaun


