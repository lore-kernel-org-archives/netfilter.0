From: "malvika joshi" <zenith.of.perfection@gmail.com>
Subject: interaction of iptables userspace tool with kernel
Date: Mon, 2 Oct 2006 23:51:37 +0530
Message-ID: <9157ddef0610021121u74a7c30awd0deb1c5143b8cdc@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I want to find all the possible means by which iptables userspace
program interacts with the kernel.I have found that it does by means
of setsockopt and getsockopt calls in the source code.But there is
also a libipq library with the userspace program which uses netlink
sockets.But any of the functions of the libipq library are not called
from the source code.Is it safe to assume that the only means of
interaction of the userspace program with the kernel is only by means
of set and getsockopt calls?? If so under what circumstances is the
libipq used??

