From: Karina <kgs@acabtu.com.mx>
Subject: How to send all packets to a router
Date: Sun, 24 Feb 2002 11:18:17 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3C792059.865B267B@acabtu.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, i have this problem..

I have an iptables-box, that is the default gateway for all my internal
addresses, after this box all the packets are sending to my main router.
But now, I need to send one of my internal Class C to another router
instead of the main one.

I try with this line:

$IPTABLES -T NAT -a PREROUTING -i eth0 -s $THISCLASS -j DNAT --to
other.router.ip

but it seems this is not working.

If i setup a computer and i put as gateway directly the new router ip
all works. But , if i setup this same comptuer and i put as gateway my
iptables-box (all the computers have this settings) this doesn't work.
The packets sent by my other ip addresses are going to main router as
usual, but the other class is not going to the alternate router.

Any ideas ?



