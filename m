From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 13:19:20 +0200
Message-ID: <4A192D38.90008@redpill-linpro.com>
References: <4A19235F.4070306@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A19235F.4070306@opendreams.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesse Molina <jesse@opendreams.net>
Cc: netfilter@vger.kernel.org

Hi Jesse,

* Jesse Molina

> What else is there?  Loop interfaces with proxy arping?  I've been
> reading about some functionality for NAT in the ip tool (ip route add
> nat ...) but it looks depreciated.  There also seems to be something
> like "ip rule add nat ..." but I've not figured that out yet.  I had
> read somewhere that "ip route add nat ..." specifically would arp for
> the translated address, but again, the man pages says that's depreciated
> in the 2.6 kernel.

I'd simply route the IP adresses used for NAT to your Linux-based
firewall, if I were you.  That way you'll only need a /30 link network
to be used on the public interface, while the addresses used for NAT do
not have to be local to the firewall in any way.  As an added bonus
you'll get less ARP traffic on the public interface, as the upstream
router only needs to learn the L2-address of the next-hop router (your
firewall, that is).

BR,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
