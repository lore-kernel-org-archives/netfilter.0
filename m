From: "crux crux" <cruxam@gmail.com>
Subject: Re: Forwarding packets on iptables firewall
Date: Sat, 21 Apr 2007 20:07:41 +0200
Message-ID: <4fccc36f0704211107x3242a319qc1b564ea0cab1dc5@mail.gmail.com>
References: <4fccc36f0704210525md4c677frcb2d508c12655894@mail.gmail.com>
	<20070421123200.GB30659@torres.zugschlus.de>
	<4fccc36f0704210556k38ee42cfofd1d671e87c819a0@mail.gmail.com>
	<20070421145145.GD30659@torres.zugschlus.de>
	<4fccc36f0704211018m5cc2c267u8ad66ea1f1ec662a@mail.gmail.com>
	<20070421174526.GA2706@torres.zugschlus.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=EFieeaZ8aXIUl2HADpfXTMqJwl3VsofCeIuas9MVbOjLsnmse+vJnXaKvR4UvGOH9EGKKbNe04xINAD6z1AhjJ/TjzgklokZO1fPe4f7gnE0lBG/1ydQMhdvbLt5Qke/YRAFrhETlOHsuBemHFQ+3Sk/cabGJ5oQMVxolhatwzw=
In-Reply-To: <20070421174526.GA2706@torres.zugschlus.de>
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

I made it. I applied rules as I stated on firewall box, and added
addresses to win machines, but before I forgot to add default gw for
machine on subnet 10.1.1.0 Adding 10.1.1.1 as default gateway for host
10.1.1.2 made it possible to ping from 192.168.1.2 to 10.1.1.2 and
vice versa.

Thank you very much for your help.

Best wishes and regards

On 4/21/07, Marc Haber <mh+netfilter@zugschlus.de> wrote:
> On Sat, Apr 21, 2007 at 07:18:47PM +0200, crux crux wrote:
> > No, it is my fault, I forgot to add " reply to all " sorry people .
> >
> > I mistyped eth1 ( there sholud be eth2 ) in first post.
> >
> > iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
> > iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
> >
> > echo 1 > /proc/sys/net/ipv4/ip_forward
> >
> > does not  ( I still do not know why ) forward packets from eth2 to
> > eth1 and vica versa.
> >
> > And yes, I have implemented only above two rules
>
> Please show the output of iptables -nvL.
>
> Please give the output of ipconfig /all on the windows boxes.
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
>

