From: Eduardo =?ISO-8859-1?Q?Fern=E1ndez?= <eduardo@cmusanjuan.com>
Subject: How to debug nfmarking
Date: Mon, 15 Nov 2004 18:45:26 +0100
Message-ID: <1100540726.2796.23.camel@laserite>
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

Hi all,

i'm trying to debug packet marking like this:

iptables -t mangle -A PREROUTING -p icmp -j MARK --set-mark 0x1
(...)

But I don't know how to check if the packets are really being marked.
ip_conntrack shows all packets with mark=0, and that's not possible.
I've tried logging with netfilter but I don't know which option shows
the nfmark in the log. Any ideas?

Thank you very much in advance.

Eduardo


