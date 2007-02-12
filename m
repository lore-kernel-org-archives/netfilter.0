From: "howard chen" <howachen@gmail.com>
Subject: Can iptables or other firewall solutions can do this for me?
Date: Mon, 12 Feb 2007 23:16:23 +0800
Message-ID: <b66ddc900702120716p6c9f1d5dibb6ad85ea4fc8df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Let me tell the background first...

We have a web server, recently received a lot of requests from oversea
proxy. The requests are to spam our applications (i.e. leave
comments). They don't success, since they never get the correct
captacha.

But the problem is: They are doing requests & requests forever (even
with no success). This lead to:

1. Waste of CPU time of our web server
2. Waste of oversea bandwidth


Can iptables or related tools or packages can do this for me?

p.s. Since they are changing proxy all the time, so might be need a
automatic solutions,

e.g.

If a client request the server too frequent in the past 15 minutes,
block the client for 1 hour, sth like that



Thanks for any comments...

