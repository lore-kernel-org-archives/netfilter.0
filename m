From: Josh Nerius <jnerius@gmail.com>
Subject: Redirection using DNAT on transparent bridge.
Date: Mon, 8 Nov 2004 21:23:51 -0600
Message-ID: <4f3930a704110819232a7f8a76@mail.gmail.com>
Reply-To: Josh Nerius <jnerius@gmail.com>
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

Hello,

I am trying to redirect specific traffic, (for example, web traffic on
port 80) as it passes through a transparent bridge. Currently, I have
tried commands like this: (eth1 is external interface, eth0
internal...ths is sitting behind a linux nat router)

iptables -t nat -A PREROUTING -m physdev --physdev-in eth0 -s
192.168.150.222 -p tcp --dport 80 -j DNAT --to
destination.ip.address.here

The trouble I am running into seems to be related to routing I
think...I have an ip address set on the bridge virtual interface and
this communicates with the net just fine. I have been unable to find
documentation on this and would like to know if this is even possible?

Oh yes, I should also mention that if I change the DNAT to a host on
the other side of the bridge that is in the local lan (i.e. the router
or other test boxes I've put on a switch for experimentation) the
redirection seems to work.

Any info is greatly appreciated,

Josh Nerius

-- 
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]

