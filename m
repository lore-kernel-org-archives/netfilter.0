From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: FTP failed
Date: Sat, 6 Jul 2002 20:40:55 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA25C@JUPITER>
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
To: 'Oskar Andreasson' <blueflux@koffein.net>, 'Mitsuo HAMADA' <mhamada@qwanty.com>, netfilter@lists.samba.org

Beacuse then your not running a firewall, your running a router..

why bother doing that, just don't run any rules at all..

My point is that if a new device is added or dynamically added (ppp+) then
it's automatically assumed ACCEPTED... I prefer it DROPped (-P) and find out
later why than accepted and not find out at all....
ANyway.. he had eth0 ONLY so there was no point putting rules if he's
accepting anything but /dev/lo


-----Original Message-----
From: Oskar Andreasson [mailto:blueflux@koffein.net]
Sent: Friday, 05 July 2002 8:21 PM
To: George Vieira; 'Mitsuo HAMADA'; netfilter@lists.samba.org
Subject: RE: FTP failed



> BTW: Why is it I'm seeing so many people using the ! so much?? I actually
> never use it except for possibly #!/bin/bash and that's it.
>

Because it's simple and timesaving, both for you and the firewall,
basically. For example, why write:

iptables -i eth0 -j ACCEPT
iptables -i eth1 -j ACCEPT
iptables -i eth2 -j ACCEPT
iptables -i eth3 -j ACCEPT
iptables -i tr0 -j ACCEPT
iptables -i ppp0 -j ACCEPT

When you could write:

iptables -i ! lo -j ACCEPT

This is an extremely simple example, of course, but still valid. It puts
less stress on you, as well as cpu cycles.

Have a nice day,

----
Oskar Andreasson
http://iptables-tutorial.haringstad.com
http://people.unix-fu.org/andreasson/
mailto: blueflux@koffein.net

> thanks,
> George Vieira
> Systems Manager
> Citadel Computer Systems P/L
> http://www.citadelcomputer.com.au
>
>
>
>


