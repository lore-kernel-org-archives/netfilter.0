From: "Sebastian" <netfilter@basti79.de>
Subject: ARP Reply with wrong MAC
Date: Tue, 14 Dec 2004 10:27:29 -0000
Message-ID: <twig.1103020049.65314@basti79.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

A Linux box (kernel 2.4.24) with 2 ethernet interfaces connected to the same
physical backbone. eth0 (public IP) and eth1 (10.0.0.1).

Sometime it ocures that an arp-request for 10.0.0.1 is answered with the
mac-address of eth0. (proxy_arp on all interfaces is off)

Did anybody got a same problem and/or a solution?

Greets
  Sebastian.


