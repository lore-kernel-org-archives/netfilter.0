From: <abcabc@home.nl>
Subject: block uid range in 1 rule with match owner ?
Date: Thu, 20 Jan 2005 22:16:03 +0100
Message-ID: <02df01c4ff35$40031570$0a01a8c0@cc8273a>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

How can I block a range of uid's in 1 rule ?

I tried this, but that gave an error.
iptables -A OUTPUT -p tcp --match owner --uid-owner 1000:2000 -j DROP

Is it at all possible?

