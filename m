From: "Oskar Andreasson" <blueflux@koffein.net>
Subject: RE: FTP failed
Date: Fri, 5 Jul 2002 12:20:41 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <JDEDJDGNHFIOEFENPFELEEBFCMAA.blueflux@koffein.net>
References: <200FAA488DE0D41194F10010B597610D2BA246@JUPITER>
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA246@JUPITER>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Vieira <GeorgeV@citadelcomputer.com.au>, 'Mitsuo HAMADA' <mhamada@qwanty.com>, netfilter@lists.samba.org


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



