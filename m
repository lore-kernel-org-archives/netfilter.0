From: Torsten Luettgert <t.luettgert@pressestimmen.de>
Subject: problems with accouting via ULOG
Date: Tue, 25 Apr 2006 16:10:27 +0200
Message-ID: <1145974227.8032.9.camel@scaramouche.combox.de>
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

I want to setup traffic accounting with ulog-acctd and the ULOG target.
The server I'm using has 2 interfaces, eth1 is connected to the mirror
port of the master switch. I put eth1 promisc up without an address, and
packets are streaming in all right.

But they don't arrive at any netfilter hook (except for multicasts and
broadcasts), so I can't queue them to the accounting daemon. Searching
the docs, I found that "promisc receives" don't enter the netfilter
system at all.

I could now bind the nets I want to account to eth1, but then my box
wouldn't be able to talk to those hosts, and that'd be a bad thing(tm)
especially because it's the name server :-P

Any advice, anyone? I'm feeling quite screwed up right now.

Thanks in advance,
Torsten



