From: Norbert Wegener <nw@wegener-net.de>
Subject: advanced routing with iptables
Date: Wed, 25 May 2005 13:40:39 +0200
Message-ID: <20050525114039.GA5238@www.wegener-net.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,
I have a linux gateway with two network cards.
The default route is set via eth0.
When an http request from an arbitrary ipaddres arrives on eth1, the gateway sends the answer out to eth0, as expected.
Is it possible to mark those incoming http requests via iptables or other tools in a way, that the answer gets out via eth1?

Thanks
Norbert


