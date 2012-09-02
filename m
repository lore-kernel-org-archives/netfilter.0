From: Andrew Beverley <andy@andybev.com>
Subject: RE: IPTABLES:Let external address appear as an internal address
Date: Sun, 02 Sep 2012 14:25:24 +0100
Message-ID: <1346592324.2349.35.camel@andrew-desktop>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACcGGLxSfBNPu0OwD65yae8BAAAAAA==@manfbraun.de>
		 <1346434579.2200.4.camel@andylaptop>
		 <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAACyt4OZhXX9Ijc6HtHJdLrMBAAAAAA==@manfbraun.de>
	 <1346512494.2141.16.camel@andylaptop>
	 <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAIzw44VARrtKpE9GM69R+ygBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAIzw44VARrtKpE9GM69R+ygBAAAAAA==@manfbraun.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1346592327;
	bh=rQIKD2xvAz2cV19vWOQCxhu64kERbKEYPf0HU4ztKg0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=EVMJX+nuQwiidB1q4ktcWvjJ/2GeZVmKPwE/jvlHD6lHIO4my0JXLkDgVGNRkj0RD
	 zudamfz8J9DLbmQGQFI7ugy4D8oCZtvIaAKhb3OcvyhlG3RYPeO59oHsgisLUg8o64
	 o/1qLADMXkvbxYAAZhVNnbQ5Y/OWWht+kr+bMHzM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mabra@manfbraun.de
Cc: netfilter@vger.kernel.org

On Sun, 2012-09-02 at 13:48 +0200, mabra@manfbraun.de wrote:
> Ok, configured Outlook to make better replies ;-)

Good stuff, although my previous comment still stands :)

> #from extern to apache [apache using 192.168.2.254]:
> $IPTABLES -t nat -A PREROUTING -i eth1 -d $EXTADDR -p tcp --dport 80 -j DNAT --to-destination $INTADDR
> 
> #from LAN machines [coming from 192.168.2.0/24]:
> $IPTABLES -t nat -A PREROUTING -i eth0  -d $EXTADDR -p tcp --dport 80 -j DNAT --to-destination $INTADDR

Why are you using DNAT here? Does Apache not respond to each IP address
that the server has? Have you set Apache to listen on all interfaces/IP
addresses? (See the "Listen" directive).

> This works fine. But if I am logged onto the firewall machine and use
> iceweasel interactively [on the gnome desktop] and or curl/wget from
> a cron job, this fails. I get a request timeout. This, in turn, may indicate,
> that I am missing a backward rule.

Possibly you are dropping traffic from the local network device. To
check whether this is the case, I recommend temporarily removing *all*
iptables rules (and setting the default policy to ACCEPT). If it then
starts working, you know that the problem is that you are dropping
packets somewhere with netfilter.

The output of "iptables-save" would be useful at this point.

> Thank you for your replies so far!!

No problem.

> > A process running on the same machine that iptables is running on.
> > Packets to/from the local process will go via the INPUT/OUTPUT chains instead
> > of FORWARD.
> 
> From network programming, a process must to bind to an ip-address or
> interface. Does your statement mean, that roting never happens in the
> local machine ?

The packets will still traverse the various parts of the network stack,
but I guess there isn't really routing as such to do, although there's
nothing to stop you forcing routing to a network outside of your
machine.

>  If there is routing, then there is the POSTROUTING's SNAT
> which would help me. I am just thinging about making an additional interface,
> say, "eth0:0=192.168.1.1". In this case, can I have iptables route the
> packet to this interface? Then this would be another network!

I'm not sure I understand. I think you are complicating the problem
unnecessarily. If you want to access local processes via networking on
the local machine, then there is no need for fancy routing or address
translation.

Andy


