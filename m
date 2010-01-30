From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: multiple external IP's - virtual NIC - DNAT problems
Date: Sat, 30 Jan 2010 14:22:16 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001301414410.16952@aurora.sdinet.de>
References: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>    <4B62F4B7.80701@mailinator.com> <62981.81.165.168.224.1264785772.squirrel@webmail.priorweb.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <62981.81.165.168.224.1264785772.squirrel@webmail.priorweb.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: koen.news@koca.be
Cc: netfilter@vger.kernel.org

On Fri, 29 Jan 2010, koen.news@koca.be wrote:

> > The command you seek is "ip".  Here's an example of adding an address to
> > an interface:  "ip address add 1.2.3.4/8 dev eth4".
> >
> > Happy hacking!
> > Mike Wright
> >
> Thx for the reply. That's indeed what I seek!
> 
> I guess I can put that command (or the debian variant) in the pre-up
> command for the interface?

Not pre-up, put them in up / post-up

You can also use eth0:1 eth0:2 interface definitions in debian 
/etc/network/interfaces and use "-i eth0 -d $ip" in your firewall 
config.

The eth0:X interfaces are not really network interfaces, they are just 
secondary ip addresses on the base interface with a different label 
attached to them for ifconfig backward compatibility.

Example:
	ifconfig eth2:2 192.168.19.123 up
	ip addr show dev eth2
	-> inet 192.168.19.123/24 brd 192.168.19.255 scope global secondary eth2:2

	ip addr add 192.168.19.124/24 dev eth2
	ip addr show dev eth2
	-> inet 192.168.19.123/24 brd 192.168.19.255 scope global secondary eth2:2
	-> inet 192.168.19.124/24 scope global secondary eth2


c'ya
sven

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
