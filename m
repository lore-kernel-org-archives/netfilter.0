From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Differences between -j MARK and -j CONNMARK
Date: Fri, 11 Feb 2005 10:52:23 +0100
Message-ID: <009f01c5101f$6302ddd0$910010ac@coco>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi list,

What`s the differences between these two groups of rules.?????
In the first i use MARK --set-mark to mark packets and in the other i =
use CONNMARK --set-mark

1.
    # iptables -I POSTROUTING -t mangle -j CONNMARK --restore-mark
    # iptables -I POSTROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
    # iptables -I POSTROUTING -t mangle -m ipp2p --ipp2p -j MARK =
--set-mark 30
    # iptables -I POSTROUTING -t mangle -m ipp2p --bit -j MARK =
--set-mark 30
    # iptables -I POSTROUTING -t mangle -j CONNMARK --save-mark

2.
    # iptables -I POSTROUTING -t mangle -j CONNMARK --restore-mark
    # iptables -I POSTROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
    # iptables -I POSTROUTING -t mangle -m ipp2p --ipp2p -j CONNMARK =
--set-mark 30
    # iptables -I POSTROUTING -t mangle -m ipp2p --bit -j CONNMARK =
--set-mark 30
    # iptables -I POSTROUTING -t mangle -j CONNMARK --save-mark


Regards.
Thanks
