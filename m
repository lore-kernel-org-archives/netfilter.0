From: "craig e. smith" <csmith@lightbridge.com>
Subject: vrrp question posted on keepalived.org
Date: Wed, 09 Oct 2002 13:45:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA46B48.5070304@lightbridge.com>
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

i am also going to post this here, as it may be a vrrp iptables issue:



i am setting up a redundant firewall solution using keepalived(vrrp) and 
iptables. i use iptables snat to change the source of the traffic from 
the firewall to the vrrp virtual address:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.208.69

my question, why don't the vrrp advertisements get snat'ed? not that i 
want them to, i don't. but by not specifying a protocol in the above 
iptables statement all traffic leaving the box should get snat'ed, 
right? any help with this is appreciated.


