From: Zef <zef@fcvnet.net>
Subject: VRF and netfilter
Date: Tue, 23 Aug 2005 10:59:04 +0200
Message-ID: <430AE558.8010805@fcvnet.net>
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

I want to run both ebtables and iptables, do NAT and try the Virtual 
Routing and Forwading ability of linux.
But, if I clearly remember, we cannot have overlapping private subnets 
with the multi-FIB implementation in linux? Am I right?

If this is feasible, how do I play with netfilter in a multi-FIB enabled 
linux kernel?

Zef'

