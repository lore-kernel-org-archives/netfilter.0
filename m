From: "Richard" <richard@o-matrix.org>
Subject: port translation
Date: Tue, 4 Jan 2005 22:23:07 -1000
Message-ID: <EINSTEINdGuysj7L2Sg00000bb4@einstein.systemmetrics.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I am trying to work on port translation. One inside host with source port
xxx would always have the same port yyy after nat. Even after the conntrack
expires, I still want outside incoming packet to port yyy be able to map to
the same host and port. This is what I did,

Assume inside 192.168.25.150:5000 maps to outside 66.1.2.3:60150 on
interface vlan1,

# allow outside traffic to come in
iptables -t nat -I PREROUTING -p udp -i vlan1 -d 66.1.2.3 --dport 60150 -j
DNAT --to-destination 192.168.25.150:5000

# allow outside traffic to go through the router
iptables -t filter -I FORWARD -p udp -i vlan1 --dport 5060 -j ACCEPT

# allow inside traffic to go out
iptables -t nat -I POSTROUTING -p udp -s 192.168.25.150 --sport 5000 -j SNAT
-o vlan1 --to-source 66.1.2.3:60150

Can someone please confirm that this is the right way to do it?

Also if I have multiple internal hosts, for example, one hundred host
192.168.25.1xy:5000 maps to 66.1.2.3:601xy, is there a quick way to do it
instead of 100 blocks of iptables statements?

Thanks,
Richard




