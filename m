From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: How would this help my LAN / network
Date: Fri, 07 Oct 2005 16:30:05 +0200
Message-ID: <4346866D.8080900@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

HI all

I just came across one of the threads on the LARTC.
In the thread it had this.

So my question is, for the following rules, would these increase my browsing / traffic, and if so, how.

iptables -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK ACK -m length --length 0:128 -j TOS --set-tos Minimize-Delay
iptables -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK ACK -m length --length 128: -j TOS --set-tos Maximize-Throughput
iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 20 -j TOS --set-tos Maximize-Throughput
iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 21 -j TOS --set-tos Minimize-Delay
iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 22 -j TOS --set-tos Minimize-Delay
iptables -t mangle -A PREROUTING -p udp -m udp --sport 53 -j TOS --set-tos Maximize-Throughput
iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 80 -j TOS --set-tos Maximize-Throughput
iptables -t mangle -A PREROUTING -p udp -m udp --sport 123 -j TOS --set-tos Minimize-Delay

If someone would take the time to briefly explain this to me, I would be most grateful.

Kind Regards
Brent Clark

