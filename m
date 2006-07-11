From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: is this possible (multiple sources, replies go to proper source)
Date: Tue, 11 Jul 2006 13:12:48 +0200 (CEST)
Message-ID: <33713.0275824622$1152619589@news.gmane.org>
References: <Pine.LNX.4.63.0607101300410.12501@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0607101300410.12501@qynat.qvtvafvgr.pbz>
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
To: David Lang <dlang@digitalinsight.com>
Cc: netfilter@lists.netfilter.org

<citaat van="David Lang">
> In trying to figure out a LVS configuration to load balance firewallsI
> have
> gotten stuck with one problem.
>
> the scenerio below is drasticly simplified, I can go into more detail if
> people
> think it would help.
>
> inbound traffic to a box can arrive through either box B or box C
> (depending on
> factors outside this problem)
>
> B   C
>   \ /
>    A
>    |
>    D
>
> box A routes the traffic on to box D
>
> box D replies to the connection (sending the packets to box A)
>
> box A needs to figure out which box (B or C) the connection came through
> in the
> first place and use that as the gateway for the reply packets.
>
> the nearest thing I can think of to a solution would be for box A to
> remember
> the MAC address that started the connection and then use it as the gateway
> for
> reply packets that are part of that connections. I don't know how to do
> this
> (or even if it's possible)

Use CONNMARK to remember which connection came from which gateway, use the
ROUTE target to correctly route the replies.

HTH,
M4

