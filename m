From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: opening a port..
Date: Thu, 9 Jan 2003 11:35:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019AA4@hslex01.hslbz.local>
References: <1042105878.487.40.camel@nirvana>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042105878.487.40.camel@nirvana>
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
Cc: netfilter <netfilter@lists.netfilter.org>


> ok heres my current script, yes its inefficient, but thats 
> not the major problem.. 4662 port :/ I relise that theres 
> more ports available for edonkey to use, but opening ONE port 
> would be a start.
> 
> i added "iptables -A FORWARD -m state --state 
> RELATED,ESTABLISHED -j ACCEPT" without anything happening...
> 

<snip>

> iptables -A FORWARD -o eth1 -p udp --dport 4665 -j ACCEPT 
> iptables -A FORWARD -o eth0 -p udp --dport 4665 -j ACCEPT 
> iptables -A FORWARD -o eth0 -p udp --sport 4665 -j ACCEPT 
> iptables -A FORWARD -o eth1 -p udp --sport 4665 -j ACCEPT 
> iptables -A FORWARD -o eth1 -p tcp --sport 4665 -j ACCEPT 
> iptables -A FORWARD -o eth0 -p tcp --sport 4665 -j ACCEPT
> 

Okay, let's leave these rules alone for a moment.
*IS* your eDonkey server running/listening. If you do a netstat -an *on
the machine that's supposed to be running eDonkey* (you don't need
netcat to do this) then it must report one (or more) ports belonging to
eDonkey as listening .
If not, you can try whatever you want but it won't work ; you will never
connect, not even local. Forwarding is not going to help you then and
AFAIK you can't test if forwarding is working (which doesn't say it's
impossible ; I just don't know how).

Besides, going back to the ruleset, I don't see an "echo 1 >
/proc/sys/net/ipv4/ip_forward". You may have setup the rules correctly
but it's not going to forward anything untill you did the above "echo".


Rob


