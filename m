From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering in PREROUTING --- Some random thoughts / points...
Date: Thu, 18 Jan 2007 08:57:59 -0600
Message-ID: <45AF8AF7.5070207@riverviewtech.net>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169069905.10134.18.camel@len.t-t-l.co.uk>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

george wrote:
> I've seen a few places telling me that you shouldn't filter in the
> mangle table.  However, it seems sensible to me to drop junk packets in
> PREROUTING rather than have to duplicate those rules in both INPUT and
> FORWARD.

(Just some random thoughts / points for this discussion thread.)

  - If you put most (all) of your rules (that you can) in the 
mangle:PREROUTING chain, you will need to optimize the order of the 
rules to make sure your traffic passes through as few rules as possible.

  - In the mangle:PREROUTING chain, you can not use the -o flag to 
specify the output interface for forwarded traffic.  This means that any 
traffic that is not forwarded will still have to pass through the rules 
just for forwarded traffic.  Sure, you can add other options to the rule 
that will help decide what traffic needs to be parsed by the rule(s). 
If you use the other (what I'll call) more appropriate tables / chains 
to filter in you will have some inherent separation of which traffic 
will enter a given table / chain.

  - Locally generated packets do not traverse the mangle:PREROUTING 
chain, thus can not be filtered there.

  - You can generate a sub chain (with in a table) that can be called 
from multiple other chains.  I.e. create a small chain that filters for 
NetBEUI traffic and jump to it from filter:INPUT / filter:FORWARD / 
filter:OUTPUT.  I.e.

iptables -N Drop_NetBEUI
iptables -A Drop_NetBEUI -p tcp --sport 137 -j DROP
iptables -A Drop_NetBEUI -p udp --sport 137 -j DROP
iptables -A Drop_NetBEUI -p tcp --sport 138 -j DROP
iptables -A Drop_NetBEUI -p udp --sport 138 -j DROP
iptables -A Drop_NetBEUI -p tcp --sport 139 -j DROP
iptables -A Drop_NetBEUI -p udp --sport 139 -j DROP
iptables -A Drop_NetBEUI -p tcp --sport 445 -j DROP
iptables -A Drop_NetBEUI -p udp --sport 445 -j DROP
iptables -A Drop_NetBEUI -p tcp --dport 137 -j DROP
iptables -A Drop_NetBEUI -p udp --dport 137 -j DROP
iptables -A Drop_NetBEUI -p tcp --dport 138 -j DROP
iptables -A Drop_NetBEUI -p udp --dport 138 -j DROP
iptables -A Drop_NetBEUI -p tcp --dport 139 -j DROP
iptables -A Drop_NetBEUI -p udp --dport 139 -j DROP
iptables -A Drop_NetBEUI -p tcp --dport 445 -j DROP
iptables -A Drop_NetBEUI -p udp --dport 445 -j DROP
iptables -A Drop_NetBEUI -j RETURN

Then just jump to the chain from any where with in the filter table that 
you want to.  I.e.

iptables -A INPUT -j Drop_NetBEUI
iptables -A FORWARD -j Drop_NetBEUI
iptables -A OUTPUT -j Drop_NetBEUI



Grant. . . .

