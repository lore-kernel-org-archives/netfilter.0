From: "crux crux" <cruxam@gmail.com>
Subject: Re: Forwarding packets on iptables firewall
Date: Sat, 21 Apr 2007 19:18:47 +0200
Message-ID: <4fccc36f0704211018m5cc2c267u8ad66ea1f1ec662a@mail.gmail.com>
References: <4fccc36f0704210525md4c677frcb2d508c12655894@mail.gmail.com>
	<20070421123200.GB30659@torres.zugschlus.de>
	<4fccc36f0704210556k38ee42cfofd1d671e87c819a0@mail.gmail.com>
	<20070421145145.GD30659@torres.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=idyq+2PbCoeA43mO9Ca5mFa14J/rn8QDjBcQn7nnRcslJ13wUf7pVoK3EDqU2Iw/hSVWa14Kq0rVTLdLhJQcQBXBnHcQkw6BcUDvSv5nPzOebBqT4nW9taAlbAQP1HK2Zj78VFS2vvIIwc7zHNNwU5kg2bgYWXbp19LlopTWF/M=
In-Reply-To: <20070421145145.GD30659@torres.zugschlus.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

No, it is my fault, I forgot to add " reply to all " sorry people .

I mistyped eth1 ( there sholud be eth2 ) in first post.

iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

does not  ( I still do not know why ) forward packets from eth2 to
eth1 and vica versa.

And yes, I have implemented only above two rules

Regards


On 4/21/07, Marc Haber <mh+netfilter@zugschlus.de> wrote:
> Did you take this correspondence off-list deliberately by answering in
> private?
>
> On Sat, Apr 21, 2007 at 02:56:09PM +0200, crux crux wrote:
> > 2: eth0: <BROADCAST,MULTICAST,UP,10000> mtu 1500 qdisc pfifo_fast qlen 1000
> >    link/ether 00:30:05:0d:db:b4 brd ff:ff:ff:ff:ff:ff
> >    inet 192.168.1.1/24 brd 192.168.1.255 scope global eth0
> >    inet6 fe80::230:5ff:fe0d:dbb4/64 scope link
> >       valid_lft forever preferred_lft forever
> > 3: eth1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop qlen 1000
> >    link/ether 00:02:b3:8c:d2:eb brd ff:ff:ff:ff:ff:ff
> > 4: eth2: <BROADCAST,MULTICAST,UP,10000> mtu 1500 qdisc pfifo_fast qlen 1000
> >    link/ether 00:02:b3:f0:37:05 brd ff:ff:ff:ff:ff:ff
> >    inet 10.1.1.1/24 brd 10.1.1.255 scope global eth2
> >    inet6 fe80::202:b3ff:fef0:3705/64 scope link
> >       valid_lft forever preferred_lft forever
>
> You have configured eth0 and eth2, while allowing traffic to flow
> between eth0 and eth1 in the firewall config. Presumably, you have a
> DROP policy in place, and traffic to and from eth2 is blocked.
>
> Greetings
> Marc
>
> --
> -----------------------------------------------------------------------------
> Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
> Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
> Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221 2323190
>

