From: Cygnus - Flirttown Coder <cygnus@talker.com>
Subject: Re: moving old ips to new ips..forwarding
Date: Fri, 5 Jul 2002 16:28:03 +0000 (UTC)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0207051614570.12797-100000@grabak.talker.com>
References: <200207051440.g65Eex802164@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207051440.g65Eex802164@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Fri, 5 Jul 2002, Antony Stone wrote:

> Don't worry about this.   Netfilter will sort it all out for you.
> 

good good

> The address translation works like this:
> 
> iptables -A PREROUTING -d a.b.c.d -j DNAT --to w.x.y.z
> 
> ie any packets addressed to a.b.c.d are changed so that they go to w.x.y.z 
> instead.
> 

so this is the only rule I need to insert to do said in/out NATing?
no POSTROUTING rules or anything like that.

> 
> By the way, what bandwidth is your Internet link ?   Don't you think it would 
> be a good idea to put an actual firewall in the link so that you can at least 
> provide some filtering on the system ?
> 

we're using about 11MB/s avg.
an actual firewall is planned, yes. i've been here about a month and a 1/2
and the company was basically in disarray. ALL the admins were gone. it
wasn't pretty.

lastly..do you think it would be better if i just put this in between the
Cisco router and the 1st switch.
Put 2 eth. cards in it, eth0 coming in from the router, eth1 from the 
1st switch. Then bind all the gateway ips (there are a bunch) for
the customers as aliases to the eth1 interface; then I wont have to change
the client gateways, because all traffic will be going through the
forwarder no matter what, in pass-through.
If you think this will work better, any good documents to show me the
iptables rules to make this setup work..besides the ones you gave for the
specific NATing, of course.
(and/or nice test/gui interfaces to streamline management of these rules)
I really appreciate this.

Thanx,

-Tony


