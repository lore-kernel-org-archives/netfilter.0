From: "riffraff" <riffraff@mail.ev1.net>
Subject: Re: bridging with iptables (was no subject)
Date: Fri, 28 Jun 2002 17:39:38 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206281739.AA386531398@mail.ev1.net>
Reply-To: <riffraff@mail.ev1.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

---------- Original Message ----------------------------------
From: Antony Stone <Antony@Soft-Solutions.co.uk>
Date: Fri, 28 Jun 2002 23:29:48 +0100

>
>In which case.... can anyone here give some advice on combining netfilter 
>with a bridge (which, as Patrick kindly pointed out) doesn't have an IP 
>address on *either* (any?) of its interfaces ?
>
>ie does the standard Linux routing system, and the various netfilter hooks, 
>still work sensibly enough to be able to put netfilter rules onto a bridge ?
>
Yes, look at the bridge-netfilter project:
http://bridge.sourceforge.net/

I use it at work (in my lab at NASA).  You can have an ip address assigned to the bridge, though.  It is just assigned to the bridge interface, and not the individual interfaces that make up the bridge.  Meaning, if you, say, ssh to the ip address of the bridge, it will answer on any interface, not just a specific ethernet card.  You don't have to have an ip address assigned, however.  I filter out all accesses to the bridge from the outside (using netfilter), and only allow ssh from the inside.

>Or is netfilter based so much around routing concepts and interfaces with 
>addresses on them that it doesn't really work properly ?
>
>
>I'm sure I'll find a use for a bridge one day, so it'd be good to know 
>whether I can put netfilter on it when I do.
>
> 
Our main use is wanting to put a firewall in our network (upgrading from Drawbridge, which really wasn't that flexible), and we don't control the router (that is controlled by some other agency on site).  We didn't want to subnet our network (losing addresses, in addition to re-engineering everything), so we put the bridge firewall up in between the router and the main switch.  It is completely transparent to the users.

>
>Antony.
>

-lsd

