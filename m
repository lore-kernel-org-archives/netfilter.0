From: "David Whipp" <Whipp@sou.edu>
Subject: Packet loss when IP precedence bit set by upstream Cisco
	router
Date: Thu, 30 Dec 2004 08:44:57 -0800
Message-ID: <s1d3c014.088@gwdom.sou.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Upstream ISP uses IP precedence bit to classify and rate limit Internet
traffic. We see a 10 - 20% packet loss at our linux firewall when
traffic is high (6-8Mbps traffic with precedence bit set). Testing with
iperf, traffic is not dropped when IP precedence is not set. No TOS or
tc/qdisc has been configured (latest 2.4 kernel and 1.2.11 netfilter).

Tried
iptables -A PREROUTING -t mangle -j TOS --set-tos Normal-Service
Still had packet loss.

Has anyone seen this? Suggestions for fix? 

