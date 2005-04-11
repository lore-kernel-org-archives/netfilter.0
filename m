From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 16:57:11 -0500
Message-ID: <425AF2B7.2050402@riverviewtech.net>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

With out doing further reading (as you are reaching my limited knowledge of the TCP flags) I'm going to sate the following and then follow up after I've done some more reading.  The TCP RST flag looks like it can be sent with out any other flags set in the packet in such a situation where there is no known on going connection as in "Hay buddy you need to stop and think about what you are doing!" which effectively closes any connection that was falsely open on one end or the other.

As to your question as to whether or not it is acceptable for firewalls to drop packets with just the RST packet set inbound to you?  I'd say that you probably should not do that b/c the RST packet is a way to tell your TCP stack that it has done something wrong.  This is akin to blocking ICMP error messages.  But if you choose to do this there is nothing technically wrong with it that I can see, just sort of like shooting your self in the foot or bouncing a bounce email message stating that your email did not make it to John Doe.  So if you would like to do it then by all means do it.  I don't think I would do it unless I had a way to ensure that I was only dropping RST packets coming (back) to me that my firewall had not seen outbound to someone else.  This is where connection tracking comes to mind.  I would probably say something like the following:

iptables -t filter -A FORWARD -i $INet -o $LAN -d $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state INVALID,NEW -m limit ! --limit 1/second -j LOG --log-prefix 'Bogus inbound false TCP packets with RST flag set more than one time per second!'
iptables -t filter -A FORWARD -i $INet -o $LAN -d $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state INVALID,NEW -j DROP
iptables -t filter -A FORWARD -i $INet -o $LAN -d $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state ESTABLISHED,RELATED -j ACCEPT

If I have what I think the states of the connections are correct in my head I would use the above lines to only accept packets with the RST flag set if I had already initiated a connection outbound to the source system.  However if I had not initiated a connection then they should be drooped or rejected depending on your site policy (*1).  Along the same lines I *might* be tempted to do the same thing on an outbound side of my firewall to my internal systems too.  The following rules, very similar to above, would be what I would use to do that.

iptables -t filter -A FORWARD -i $LAN -o $INet -s $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state INVALID,NEW -j DROP
iptables -t filter -A FORWARD -i $LAN -o $INet -s $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state INVALID,NEW -j LOG --log-prefix 'Bogus outbound false TCP packets with the RST flag set!'
iptables -t filter -A FORWARD -i $LAN -o $INet -s $LAN_Subnet -p tcp --tcp-flags RST RST -m state --state ESTABLISHED,REALTED -j ACCEPT

(*1) If your organization would rather REJECT false / incorrect packets that come in to them than DROP then you would replace DROP with REJECT.  This is an institutional political decision as some people feel that rejecting packets in some situations confirms your presence on the net vs just dropping them leaves the possible attacker wondering.  I personally REJECT on the internal LAN and DROP on the INet connection.



Grant. . . . 

Christian Seberino wrote:
> I think RFC 793 requires TCP stacks to send RSTs if they
> get packets not meant for them in some cases.  Anyone know which
> cases?
> 
> For example, I think closed ports must send RSTs if they
> get stuff.
> 
> This is basis for bare FIN and Xmas tree scans IIRC.
> 
> Is this right??
> 
> Even if YES, it seems a firewall could drop any RSTs that
> don't have ACK set without damage right?
> 
> Chris
> 
> 

