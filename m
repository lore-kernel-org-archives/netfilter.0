From: Philip Craig <philipc@snapgear.com>
Subject: Re: Conntrack PPTP broken in 2.4.22 ?
Date: Mon, 15 Sep 2003 10:58:04 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F650E9C.4060209@snapgear.com>
References: <000301c3791d$401bc4c0$f901010a@SC2003002>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000301c3791d$401bc4c0$f901010a@SC2003002>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Enrico Demarin <enricod@videotron.ca>
Cc: netfilter@lists.netfilter.org

Enrico Demarin wrote:
> I think at this point I miss the functionality of the pptp_conntrack
> module ? When is it necessary to load it ?

The module basically performs three tasks.

1. NAT of the callid

This ensures that the PPTP callid is unique per client/server pair.
This is only necessary when you have multiple clients that are NATed
to the same source address.  Without it, the server will get confused.

2. Tracking of gre connections

The gre connections are tracked as RELATED connections, which makes
it easy to add a rule to let them through the firewall.

3. NAT of gre connections

This ensures incoming gre packets are forwarded to the correct
internal server/client.

Since you typically only have one internal server, this is just a
convenience which means you don't need to add a gre DNAT rule.

However this is necessary if you have multiple clients that are NATed
to the same source address, so that the firewall knows which client
to forward the gre packet to.

NAT of gre can also be helpful for a single client.  Without it,
packets from the server may be dropped if the client hasn't sent
a packet recently.  This is because you typically don't have a DNAT
rule to forward gre to the client, so the client has to send the gre
packet first to establish the conntrack, and this conntrack will
timeout after 30-180 seconds of inactivity.  You can workaround
this problem by configuring PPP to send LCP echoes to keep the
conntrack active.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


