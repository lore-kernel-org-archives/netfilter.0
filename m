From: Larry LeBlanc <leblanc@inmotiontechnology.com>
Subject: RTSP/NAT query
Date: Fri, 05 Nov 2004 16:09:14 -0800
Message-ID: <418C162A.7060707@inmotiontechnology.com>
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

Hello,

I'm trying to determine whether or not I need the rtsp_conntrack module.
I seem to be able to run RTSP through a masquerading gateway without it;
is this just a fluke or are there specific scenarios that rtsp_conntrack
is intended to address? (eg simultaneous users, etc). My testing to date
has been to use Real Player 10 to play video clips off of the Real
Networks website using UDP as the underlying transport. I'm using
iptables 1.2.10 and the following nat/conntrack modules are in place:

iptables
iptable_nat
ip_nat_proto_gre
ip_nat_pptp
ip_conntrack
ip_conntrack_pptp
ip_conntrack_proto_gre
ip_conntrack_mms

Thanks,

Larry




