From: Yury Bokhoncovich <byg@center-f1.ru>
Subject: Is DIVERT w/o forwarding feasible?
Date: Tue, 10 Sep 2002 08:34:56 +0700 (NOVST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209100834450.3200-100000@panda.center-f1.ru>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello!

I need an advice for this topic: is diverting without forwarding feasible?

 At present time we've managed to work SSL-tunnels via our MAN-provider
for a few several protocols by well-known method "connect this app to
border gateway, it takes care all the rest" and with (essentially!)
forwarding disabled in the kernel at all. But this method fails to meet
challenge of deploying fully-functional VPN with transparent packet
crossing over the MAN. In principle situation can be easily resolved if
there's a way to divert packets to an program on the border gateway
without need to enable forwarding in the kernel.

 I.e. can I change this:
"if the kernel does not have forwarding enabled, or it doesn't know how to
forward the packet, the packet is dropped"
(sorry ,quote from HOWTO) to something like
"if the kernel does not have forwarding enabled AND NO SPECIAL DIVERT
RULES SPECIFIED, or it doesn't know how to forward the packet, the packet
is dropped" ?

-- 
WBR, Yury Bokhoncovich, Senior System Administrator, NOC of F1 Group.
Phone: +7 (3832) 106228, ext.140, E-mail: byg@center-f1.ru.
Unix is like a wigwam -- no Gates, no Windows, and an Apache inside.




