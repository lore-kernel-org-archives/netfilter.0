From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Repost: CONNMARK restore-mark creates conntrack entry
Date: Fri, 04 Jun 2004 15:11:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086354661.2696.11.camel@axl.seasidesoftware.co.za>
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


If you saw my restore-mark query last week, but thought "I'll answer if
nobody else does", please note that nobody else did. :-)

Here's my query again, in case you've lost the original.

Ciao,
Sheldon.

-----Forwarded Message-----
From: Sheldon Hearn <sheldonh@starjuice.net>
To: netfilter@lists.netfilter.org
Subject: CONNMARK restore-mark creates conntrack entry?
Date: Fri, 28 May 2004 15:55:08 +0200


Hi folks,

It seems that, in linux-2.6.5 w/ CONNMARK from patch-o-matic 20040302,
the CONNMARK --restore-mark modifier causes a conntrack entry to be
created if it doesn't already exist.

I'm using CONNMARK to remember customer-initiated connections and route
them differently from "wild world"-initiated connections.  I don't want
to mark "wild world"-initiated connections, because a SYN flood then
becomes a trivial way to DOS the conntrack table, and thus the firewall.

Any idea how to stop this happening?

Here are the PREROUTING rules in question:

*mangle
:PREROUTING ACCEPT
:setup-mark -
:restore-mark -
//
// IFcic is an interface used to short-circuit the load balanced group
// completely.
//
-A PREROUTING -i IFext -d HOSTself -j RETURN
-A PREROUTING -i IFcic -p tcp --syn -j setup-mark
-A PREROUTING -i IFext -p tcp ! --syn -j restore-mark
//
// How UDP is handled isn't pertinent.
// ...
//
-A PREROUTING -i IFext -p tcp -j MARK --set-mark MARKlvs
//
// The setup-mark chain is responsible for keeping customer-initiated
// connections out of LVS.  The restore-mark chain is responsible for
// routing return traffic for those connections inward.
//
-A setup-mark -j MARK --set-mark MARKint
-A setup-mark -j CONNMARK --save-mark
-A setup-mark -j MARK --set-mark 0
-A setup-mark -j ACCEPT
-A restore-mark -j CONNMARK --restore-mark
-A restore-mark -m mark --mark MARKint -j ACCEPT

So I should end up with packets marked in one of 3 ways:

No mark: route out
MARKint: route in via IFcic
MARKlvs: route in via the load-balanced cluster

This works well.  I just don't want conntrack entries created by the
SYNACK from clients in "wild world"-initiated connections, when the
restore-mark chain is traversed.

Any ideas?

Thanks,
Sheldon.





