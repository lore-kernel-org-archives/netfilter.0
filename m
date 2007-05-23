From: trellmor@freewlan.info
Subject: Rules to block traffic form an interface to a netblock
Date: Wed, 23 May 2007 11:22:16 +0200 (CEST)
Message-ID: <20070523092216.A3B1320A8CB7@server11.web4a.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello!

I tried to create a rule to block all traffic from a interface (ath1) to
a netblock (192.168.0.0/16).
The device is a WLAN router and the ath1 interface is unencrypted,
allowing visitors to login. But i want to restrict access to my private
lan (192.168.0.0/16). The router performs nat between the ath1 and the
ath0. So forwared packets need to reach the next hop (192.168.0.1),
allowing visitors to access the internet. The router itself (and other
interfaces on the router) should still be able to reach 192.168.0.0/16.

I tried to come up with a rule for that, but my solutions doesn't seem
to work. I hope anyone can give me a solution for this problem, or at
least an idea how to solve it.

-- Yours truly
Daniel Triendl
trellmor@freewlan.info
http://dani.tac-ops.net




