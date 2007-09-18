From: "pankaj jain" <jainp1979@gmail.com>
Subject: DNAT and ICMP
Date: Tue, 18 Sep 2007 17:17:03 +0530
Message-ID: <d41814cf0709180447v68c70ef6h859b8276088c7462@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
I am working with SNAT and DNAT rules.

When I send a packet {[IP1]} out it goes through the SNAT rules and
source field in ip header gets changed.
Now if there is an ICMP response { [IP2][ICMP][IP1] } for this packet,
It goes through DNAT rules. IP2 gets DNATted  but the ip header (IP1)
inside the ICMP packet also gets DNATted.

src {SNAT(169.254.1.1) = 10.10.10.10} ----------> dst {10.10.10.11}
icmp comes from dst.
dst {10.10.10.11} -------------------------> src {DNAT(10.10.10.10) =
169.254.1.1}
the IP packet inside icmp header should have
src = 10.10.10.10 and dst = 10.10.10.11 but it shows src = 169.254.1.1
and dst = 10.10.10.11

means for ICMP responses both ip headers (main ip header and the one
inside icmp packet) are going through DNAT.

Is it the connection tracking or there is special handling done in the kernel?


-- 
Thanks
Pankaj Jain

