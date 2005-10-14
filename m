From: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Subject: iptables and FTOS syntax error
Date: Fri, 14 Oct 2005 10:29:55 +0800
Message-ID: <434F1823.7010601@inxsoft.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I have a bizarre problem with iptables when I'm trying to use FTOS:

First, the following works fine using MARK:

iptables -j MARK -A POSTROUTING -t mangle -p udp --dport 123 --set-mark 4

But this one doesn't:

iptables -j FTOS -A POSTROUTING -t mangle -p udp --dport 123 --set-ftos 4

And gives the error message:

iptables: No chain/target/match by that name

A "iptables -j FTOS --help" shows that the FTOS extension was compiled in so 
I'm very confused about the error message.

-------------snip-----------&<----------------
FTOS target options
   --set-ftos value              Set TOS field in packet header to value
                                 This value can be in decimal (ex: 32)
                         or in hex (ex: 0x20)
-------------snap----------->&----------------

Any help greatly appreciated,

Thomas

