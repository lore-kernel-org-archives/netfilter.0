From: gofers@poczta.onet.pl
Subject: ULOG flush timeout problem, please help!
Date: Mon, 21 Feb 2005 01:41:23 +0100
Message-ID: <20050221004129Z152219-21852+726@kps1.test.onet.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hi,

I'm developing an application which uses the ULOG target as a manner of copying packets from the FORWARD chain (in filter table) to the userspace . One of the goals of the application is to store received packets as soon as they arrive from the network.  Unfortunately I found annoying problem with the timeout of a netlink queue. I set the ulog-qthreshold parameter of the ULOG target to the lowest possible value (1). When new packets are not arriving, the last received packet is not being passed to the userspace but stays in buffer for about 10 seconds. During this time my application doesn't know anything about it and therefore it doesn't work correctly. It just waits assuming there are no new packets.

The questions are:
 - is there any patch available which corrects this annoying behavior ?
 - how can I change the buffer flush timeout without recompiling kernel or iptables ?
 - what is the lowest possible buffer flush timeout in ULOG ?

I'd like NOT to download and compile any newest kernel source, because I'm using a POTS modem. I would be grateful if anybody can help me. It's urgent, because I have to have my app working till Thursday.

I'm using:
 - Linux kernel 2.4.23-bk16
 - iptables 1.2.9
 - libipulog.c 1.11, libipulog.h 1.7
 - glibc 2.2.4
 - gcc 2.95.3 / gcc 3.3.3

