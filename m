From: <menonrr@adelphia.net>
Subject: Forward state
Date: Thu, 14 Oct 2004 21:48:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015014814.LWKR15118.mta13.adelphia.net@mail.adelphia.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


10/14

Hello,

I am a new user of IPtables.

I have a Redhat 9 gateway that masquerades traffic between private network and the internet that are directly connectecd to it. The gateway also forwards traffic between another #internal# network (not directly connected) and the internet.

The input chain has rule that allows only ESTABLISHED and RELATED connections to the external interface from internet. 

The Output chain has rule allowing NEW, ESTABLISHED, and RELATED connections from inside.

The FORWARD chain allows all connections from inside and outside. (NEW,ESTABLISHED or RELATED *not* specified)

The Queries:

1) Does the state in INPUT cause NEW connections not be forwarded (as specified in Forward Chain)? I have no state in Forward chain. I want free flow of traffic between the internet and the #internal# network.

2) To allow all connections IN and OUT to be forwarded, should I explicitly say NEW in Forward chain?

Thank You.
Menon


