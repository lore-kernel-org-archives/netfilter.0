From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: stateful UDP with unknown source port on INPUT?
Date: Mon, 02 Apr 2007 07:35:07 -0500
Message-ID: <euqt9r$ket$1@sea.gmane.org>
References: <460C4667.1090406@rtij.nl>	<BAY121-F1848947AF48B36B0E9D801A9610@phx.gbl>
	<euq4ar$m1l$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <euq4ar$m1l$1@sea.gmane.org>
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

I wrote:
> noa levy wrote:
> 
>> Thanks!
>> I forgot to mention, though, that my source port for the SNMP informs 
>> is also random, so I can't match against the destination port for the 
>> incoming packet - does the recent target also maintain a port list or 
>> is it IP addresses only?
> 
> 
> How about something like this:
> 
> iptables -t nat -A POSTROUTING -p udp --dport 162 -j SNAT --to-source :29999
> iptables -t mangle -A PREROUTING -p udp --dport 29999 -j MARK --set-mark 99
> iptables -A input -p udp -dport ! 29999 -m mark --mark 99 -j ACCEPT

Which, of course, won't work because de-SNAT won't recognize the reply
packets coming from a random port.  I really shouldn't try to post
something that complex, and untested, late at night.  Sorry.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


