From: Del Winiecki <delw@wildapache.net>
Subject: iptables-save display
Date: 14 Feb 2003 14:41:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045258905.17449.93.camel@r1>
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

First, Many thanks to Joel Newkirk, much appreciated. it works like a
champ.

I have a concern. When I display using iptables-save I see that though I
only have one POSTROUTING statement, there are about 22 of them
displayed, all exactly the same. I've tried all kinds of things, but
they always come back each load. Is this a bug with iptables-save or
could all those redundant statements actually be in the kernel tables?

-Del W.



