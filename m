From: Fox <admin@flshlnk.com>
Subject: OUTPUT chain DNAT problem
Date: Wed, 2 Jul 2003 15:57:08 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4417747639.20030702155708@flshlnk.com>
Reply-To: admin@flshlnk.com
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

Hi.

I'm having problems with rewriting outgoing packets.
I've specified the following rule:
iptables -t nat -A OUTPUT -d 10.0.0.2 -j DNAT --to-destination
192.168.0.2

When I ping 10.0.0.2 i get them rewritten (i check it with tcpdump and
get stats with `iptables -t nat -L -v -n`). But when an application
sends a packet to 10.0.0.2 it's not rewritten. I can't understand why.

I need to to the following thing:

A              B                C
10.0.0.2  ---> 192.168.0.1 ---> 192.168.0.2

A send requests to B and B replies to A. But i want those replies go
to C and only C.

Your help is appreciated.
thanks.
fox


