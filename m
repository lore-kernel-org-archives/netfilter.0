From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Forward internal packets as though they're external
Date: Wed, 26 Oct 2005 23:51:06 -0500
Message-ID: <200510262351.06929.rob0@gmx.co.uk>
References: <436051E9.2050701@jonheese.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436051E9.2050701@jonheese.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 2005-October-26 23:04, Jon Heese wrote:
> straightforward answer to, so here goes.  I have my router/firewall
> running iptables:

Just an aside, FYI, "running iptables" is an inaccurate description. 
iptables(8) is not a daemon process, it merely manipulates netfilter 
rules in the kernel.

> eth0 - 65.9.134.4
> eth1 - 192.168.0.1
>
> Then, say an internal machine, "castor":
>
> eth0 - 192.168.0.100
>
> I'm running a BitTorrent tracker on castor's TCP port 6969, and I'm
> using iptables to forward traffic coming in router's eth0's port 6969
> to castor's 6969 (nat table, PREROUTING chain).  No problem coming in
> from outside.
>
> The problem arises when I want to connect to castor's BitTorrent
> tracker from another machine behind the router (on the 192.168.0.0/24

What is the rule you're using? If as above you're only DNAT'ing from 
eth0, you're not going to match anything coming in on eth1!

> subnet). It's matching the INPUT rule and sending the packet directly
> to router's port 6969, instead of following the FORWARD rule to
> castor's 6969, and while this makes sense to me, I don't want it to
> do it.
>
> So, the simple solution, I say to myself, is to tell iptables to take
> all packets with destination address of 65.9.134.4 and source address
> of 192.168.0.0/24 and dport 6969 to go to castor's 6969.  In English
> I think I have it fine.  Finding the right syntax/logic in

Right.

> iptablesish is where I get tripped up.  I can match the rule fine, I
> just don't know what action/jump I need to specify to make it
> redirect.
>
> The rule is:
>
> /sbin/iptables -A INPUT -d 65.9.134.4 -s 192.168.0.0/24 -p tcp
> --dport 6969

You can't do DNAT in the filter table, ...

> And if I add "-j DROP" or "-j ACCEPT", I get the appropriate action
> in my testing situation.  Now, the question:

... and you can't DNAT with a DROP or ACCEPT rule.

> What do I have to specify after the above rule definition to either
> a) get iptables to redirect this packet to my existing nat/PREROUTING
> chain (which may not be possible), or b) forward it directly to a

Change your DNAT rule to match all the packets you want to match:

iptables -vt nat -A PREROUTING -d 65.9.134.4 -p tcp --dport 6969 \
    -j DNAT --to 192.168.0.100

Although the idea of using BitTorrent over a local network seems quite 
odd to me ... :)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

