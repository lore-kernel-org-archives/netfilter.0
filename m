From: Steve <smb23@csufresno.edu>
Subject: Re: Using an device alias?
Date: Mon, 06 Jan 2003 11:56:18 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E19DF62.9000106@csufresno.edu>
References: <b74ecb8788.b8788b74ec@cvip.net>
 <200301032233.47877.netfilter@newkirk.us> <3E19CD4E.2050700@csufresno.edu>
 <3E19DD6B.7070503@csufresno.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

This is a second repost, the first one appears to have disapeared.

Joel Newkirk wrote:

> On Friday 03 January 2003 02:28 pm, Steve M Bibayoff wrote:
>
>> Is it possible to use iptables with a device alias
>> (ex.. eth0:1)? I tries to add a filter rule and got
>> an error:
>> % iptables -t filter -I INPUT -i eth0:1 -j ACCEPT
>> Warning: wierd character in interface `eth0:1' (No
>> aliases, :, ! or *).

> Solution #1:
> Since this is the INPUT chain, then the local machine clearly is the 
> destination.  (unless you are using the REDIRECT target in nat 
> PREROUTING)  I suggest you try something like:

Unfornately, I am doing redirect nat. More specifiacally MASQ

> Solution #2:
> If eth0 is local, then I presume you have two different subnets 
> connected to it, and want it to respond to both.

This won't work either. Both addrsses are on the same subnet, see below.

> Solution #3:
> ... but there's still a possibility, by catching them inbound in 
> mangle PREROUTING and marking them based on destIP, which will still 
> be the 'real' IPs prior to DNAT in nat PREROUTING 


I was hoping for an easier solutions then this, but it does look like 
this is what I'll have to do. I proably should have posted complete 
details(and searched(1) the archives as it seems this questions comes up 
every week). Here are more details and hopefully someone could come up 
with easier (at least for me) solution.



I'm am using an iptables script that was taken from:
http://heimdall.asgardsrealm.net/linux/firewall/
It is a fairly long and appears to be fairly complete script. I'm using 
it to mainly to do masquaring. The network looks something like this:

windows + other boxes   192.168.0.1|------|1.2.3.4/28
192.168.0.0/24 network---------eth1|RH 7.3|eth0---------Internet
                                   |------|

I think the most relevant chain in the script is:
-A POSTROUTING -s 192.168.0.0/255.255.255.0 -j MASQUERADE

The box has only 2 network connections(internal/external). What I need 
to do is produce another real ip (1.2.3.5) that could be directly nat'ed 
to an internal windows(192.168.0.2) machine without any filtering. So 
the new network looks like this:
|------|192.168.0.2   192.168.0.1|------|1.2.3.4/28
|winows|---------------------eth1|RH 7.3|eth0----------------
|------|          /              |      |1.2.3.5/?   /
                 /               |------|eth0:0-----/
rest of network-/

Hopefully this makes some sense. From searching the archive, I've found 
the following ideas:
ip addr add w.x.y.z/bits dev eth0 label eth00
http://lists.netfilter.org/pipermail/netfilter/2002-October/038968.html
This didn't work, kept getting errors after I tried to check the 
interface with 'ifconfig' and 'ip addr list'

I've also tried to just foward the address with this
iptables -A PREROUTING -a nat -d 1.2.3.5 -j DNAT --to 192.168.0.2
iptables -A FORWARD -d 192.168.0.2 -j ACCEPT
http://lists.netfilter.org/pipermail/netfilter/2002-September/038129.html
This appears to be working when I try go from the internal machine to 
the outside, but I can't connect from the outside to inside (tried nmap, 
got the RH 7.3 sig).

If someone knows the script I'm using and knows what hanging me up could 
you please point out my error, if not, I think I'll eventually get it.

TIA

Steve

1) Don't rememeber if was this list or not about search capacity, but I 
use advanced google (ie add "site:lists.netfilter.org" in the search 
field). hth.





