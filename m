From: Dave Cinege <dcinege-mlists-dated-1115488236.9c4d41@psychosis.com>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Mon, 2 May 2005 13:50:32 -0400
Message-ID: <200505021350.32836.dcinege-mlists@psychosis.com>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: "Taylor, Grant" <gtaylor@riverviewtech.net>

> > Yes. In my last example of the slow browing to an attached linksys, I w=
as
> > using Firefox on XP. Previously I had thought it was all IE, but it's
> > not.
>
> Am I reading this correctly? =A0Are you experiencing slow downs in
> connections to a Linksys's (device) management web page that is connected
> to the same network on the same subnet? =A0Translated are you experiencing
> slow downs in connections to a equipment when the traffic is not passing
> through your router?

No. To get very specific:

Local net
    eth0: 192.168.1.1 - net/mask 192.168.1.0/24
Configuration network (special type of network in my appliance)
    eth1: 172.27.1.2 - net/mask 172.27.0.0/30

The configuration network Masq's:
/sbin/iptables -t nat -I POSTROUTING -o eth1 -d 172.27.0.2/255.255.255.252 \
  -j SNAT --to-source 172.27.0.2

The SNAT to configration networks is to simplify life, as we don't have to=
=20
deal with playing with routes back to the local network in the external=20
devices, (wifi bridges, satellite terminals, etc)

And we normally browse to these devices via IP not hostname.

So to clarify my situtation:
 Depending on what mood Windows is in, browering from a 192.168.1.0/24 host=
 to=20
172.27.1.1 (linksys bridge in this case) or browsing to 192.168.1.1 (the=20
appliance itself, running Zope) will become ungodly slow. SOMETIMES it is=20
just fine.

I am also seeing zope deadlock, which I now believe is related to this=20
performance problem. When zope locks all other processes are fine, and the=
=20
box pings.=20

To expand further on the zope issue:
A few months ago I was remotly ssh'ed in to an appliance with my partner on=
=20
site. Zope had locked. I restarted the process. He connected a few times an=
d=20
it locked again. I could not get a head reply back when it locked.=20
   (telnet 127.0.0.1 < HEAD / HTTP/1.0)
We restarted it a dozen times with the same thing. It did not stop locking=
=20
until we rebooted the machine. All of this was via SSL.=20

It was at this point I figured it was SSL in zope. I turned off SSL access.=
=20
Seemed to help but now we're seeing locking, though maybe less frequently.=
=20
I was wondering if it was hardware, IRQ, etc. all but ruled that out. As I=
=20
mentioned, I just saw everything run perfectly with my laptop, then I plug=
=20
the XP machine in, and it dies.

If you can't tell this is really driving us crazy. I've got the simplest of=
=20
networks configs, barely any traffic, and it's running like shit with=20
direclty attached hosts.=20

Dave


