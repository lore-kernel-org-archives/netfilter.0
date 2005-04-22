From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: DROP vs. REJECT...
Date: Fri, 22 Apr 2005 13:54:39 -0500
Message-ID: <4269486F.2040508@riverviewtech.net>
References: <426911FC.7060807@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426911FC.7060807@riverviewtech.net>
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

One possible solution to rejecting with the source IP of the "ICMP Host Unreachable" packet being the host that you are trying to hide would be to SNAT the packet as it goes out the system you are trying to hide on it's way back to the original sender.  You would want to SNAT the packet to IP of the far side of your upstream router.  In doing this you would have to make sure that your upstream router would not block suck packets with any thing like a reverse path filter.



Grant. . . .

