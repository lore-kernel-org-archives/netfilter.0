From: MOUDARIR Mohamed <moudarir@Richbond.ma>
Subject: don't want to use netfilter at msn session
Date: Wed, 24 Sep 2003 15:01:09 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14C5057BC852D611BAC400E0299AA10F02041F@MAILSERV>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello
We have our private lan behind a linux firewall, with iptables 1.2.3 (
Redhat 7.2 ).
We use the kernel patch and patch-omatic to solve the H323 problem without
success.
So i want when some user try to use MSN messenger (Audio conversation) the
linux firewall flush it's rule and become like a simple gateway to route or
Nat packet to the internet for this particular user.
So the rest of rules for other ip adress become intact.
The idea is that the packet from this particular ip adress go throught the
firewall whithout being checked with iptables rules.
If anyone have solution.
Or can i use another script or utilities like H323 proxy or gatekeper
parallel with iptables runing
Thank you .


