From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: stateful UDP with unknown source port on INPUT?
Date: Mon, 02 Apr 2007 00:28:58 -0500
Message-ID: <euq4ar$m1l$1@sea.gmane.org>
References: <460C4667.1090406@rtij.nl>
	<BAY121-F1848947AF48B36B0E9D801A9610@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY121-F1848947AF48B36B0E9D801A9610@phx.gbl>
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

noa levy wrote:
> Thanks!
> I forgot to mention, though, that my source port for the SNMP informs is 
> also random, so I can't match against the destination port for the 
> incoming packet - does the recent target also maintain a port list or is 
> it IP addresses only?

How about something like this:

iptables -t nat -A POSTROUTING -p udp --dport 162 -j SNAT --to-source :29999
iptables -t mangle -A PREROUTING -p udp --dport 29999 -j MARK --set-mark 99
iptables -A input -p udp -dport ! 29999 -m mark --mark 99 -j ACCEPT

That 29999 source port is an arbitrary number outside the bounds set in
/proc/sys/net/ipv4/ip_local_port_range.  The mark number is also arbitrary.
The overall effect is that your SNMP inform packets will all appear to
come from port 29999.  Replies to that port will be marked prior to being
de-SNAT-ed.  Now, in the filter table you can ACCEPT marked packets that
have been recognized by de-SNAT and thus no longer have a destination
port of 29999.  Any bogus packets sent to port 29999 will still contain
that port number when they hit the filter rule, and thus will not be
accepted.

I have no way to test any of the above, so view it all with appropriate
suspicion.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


