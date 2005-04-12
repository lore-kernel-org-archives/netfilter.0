From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Tue, 12 Apr 2005 02:24:11 -0500
Message-ID: <425B779B.60907@riverviewtech.net>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>	<425AF2B7.2050402@riverviewtech.net>
	<1113266214.2111.46.camel@grendel>	<425B3354.2030807@riverviewtech.net>
	<1113278818.2151.87.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113278818.2151.87.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter <netfilter@lists.netfilter.org>

In short, deciding if the ACK and RST flags to together or not is about like deciphering the English language.

Referencing section 3.9 subsection "Segment Arrives" I've found the following to be true.

Suffice it to say that the logic to this is extremely complex and in depth and thus is rather hard to make a generalized statement about.  Also keep in mind that the RFC is talking about things from the opposite direction.  Thus my determination is as follows:

If you have sent out a packet with the ACK flag set any corresponding packets with RST flags in them will not hav their ACK flag set.  However if you have sent out a packet with out the ACK flag set any corresponding packets with the RST flag in them will have their ACK flag set.

Thus I could argue that you could use the following IPTables rules to drop (or reject with ICMP host unreachable error message(s)) an illegitament TCP packets with the RST flag set.

iptables -t filter -A FORWARD -i $LAN -o $INet -p tcp --tcp-flags ! ACK ACK -m recent --set --rsource --name TCP_ACK_flag_not_set --seconds 60 -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ACK,RST ACK,RST -m recent --rcheck --rdest --name TCP_ACK_flag_not_set -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ACK,RST ACK,RST -j REJECT --reject-with icmp-host-unreachable

iptables -t filter -A FORWARD -i $LAN -o $INet -p tcp --tcp-flags ACK ACK -m recent --set --rsource --name TCP_ACK_flag_not_set --seconds 60 -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ACK,RST RST -m recent --rcheck --rdest --name TCP_ACK_flag_not_set -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --tcp-flags ACK,RST RST -j REJECT --reject-with icmp-host-unreachable

Now what I think these rules are doing is remembering, via recent match --set, packets that are going outbound with out the ACK flag set to allow corresponding packets back in if the ACK and RST flags are set.  Conversely these rules also remember (via recent match --set) packets that are going outbound with the ACK flag set to allow corresponding packets back in if the RST flag is and the ACK flag is not set.  Thus in agreement with what I think I found by reading section 3.9 subsection "Segment Arrives".  This is after many an hour of trying to decipher the ACK, RST flags relation to each other and I am prone to messing things up.  So take it for what it is worth.  This is ALL THEORETICAL and UNTESTED.  I will have to do that at a later point in time.

One additional point of interest is that I tend to jump out of my filter:FORWARD chain in to sub chains to run my tests and execute a RETURN if I match the rule that way I can have what ever default action I want at the bottom of my subchain.  This will also allow me to have much more complex conditionals that have to be meat.  You know what subroutines are for in your programs right?  Well let's do it to our firewall too.  Make a subchain to check source IPs against non routable reserved IPs and the likes for destinations.  It's a simple matter of calling the chains in the proper order to have traffic go where you want with out replication of IPTables rules, code.



Grant. . . .

