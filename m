From: "Eric J. Marang" <list05@sigridco.com>
Subject: Transfer,
	(forward) all traffic bound for PublicIP-A to PublicIP-B. Is
	iptables the right tool?
Date: Thu, 30 Nov 2006 06:59:34 -0500
Message-ID: <45788489b1b6603375ae0638c7d5ac97@sigridco.com>
Mime-Version: 1.0 (Apple Message framework v624)
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

Netfilter list readers,

I'm looking to transfer or redirect all traffic bound for one public 
addresses to another public address at a different geographic location.

I have been working with Netfilter/iptables but have not met with 
success. I suspect I am overlooking something fundamental either with 
iptables and/or Linux in general. Is iptables the right tool for this?


Location A
Consumer 'router'						Linux Box A
PublicIP A.B.C.D / PrivateIP 192.X.Y.Z    --	192.X.Y.W


Location B
Consumer 'router'						Linux Box B
PublicIP E.F.G.H / PrivateIP 10.X.Y.Z      --		10.X.Y.W


I appreciate your thoughts.

Eric.


