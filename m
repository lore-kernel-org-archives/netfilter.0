From: "Andrzej Palczewski" <palczews@uiuc.edu>
Subject: Netfilter Hooks with Queue
Date: Thu, 5 Oct 2006 17:47:07 -0500
Message-ID: <010701c6e8d0$2fa5bb70$cd9a7e82@ASP.COM>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Good afternoon,
	I am trying to measure the time between a packet entering a linux
router's queue and leaving it.  At which points in the Netfilter Packet flow
(http://www.shorewall.net/images/Netfilter.png) should I place my hooks in
order to hook the packet before it is queued by the kernel and hook it after
it leaves?


