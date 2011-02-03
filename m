From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Thu, 3 Feb 2011 18:01:18 -0200
Message-ID: <20110203180118.62970fb1@pulsar.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296759048.7587.3.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Thu, 03 Feb 2011 18:50:48 +0000
Andrew Beverley <andy@andybev.com> wrote:

> On Thu, 2011-02-03 at 15:29 -0200, Ethy H. Brito wrote:
> > On Thu, 3 Feb 2011 16:46:53 +0100
> > Marek Kierdelewicz <marek@piasta.pl> wrote:
> > 
> > > >Hi All
> > > 
> > > Hi,
> > > 
> > > >I can see the counters increase (tc -s ...) for classid 1:2345
> > > >(eth0) but they are zero for classid 2:2345 (eth1 - which the vlans
> > > >are attached in)
> > > 
> > > Are you seeing any traffic on root class on eth1? 
> > 
> > Yes I am.
> > 
> 
> Are you sure you are marking packets correctly *both* ways? Just because
> they are being marked in one direction, doesn't mean that they are being
> marked in the other direction.

Andrew 

If you see my first post you will find the filter rule I use to insert the
packet in each flowid according to its IPMARK. 

The marks is performed by these four lines:

/usr/sbin/iptables -t mangle -A POSTROUTING -o eth0 -m mark ! --mark 0 \
	-j IPMARK --addr dst --and-mask 0xffff --or-mask 0x20000
/usr/sbin/iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 0 \
	-j IPMARK --addr dst --and-mask 0xffff --or-mask 0x0
/usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark ! --mark 2 \
	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x0
/usr/sbin/iptables -t mangle -A POSTROUTING -o eth1 -m mark --mark 2 \
	-j IPMARK --addr src --and-mask 0xffff --or-mask 0x40000

and since it is working for eth0 I assume they are correct for both
interfaces.

The script does the same thing to both eth0 and eth1 interfaces.

One extra detail is: this setup was working (just as it is for eth0) until
two weeks ago when then we created the vlans and splited the traffic among
them.

> 
> If you add an iptables rule to LOG your traffic on that interface, then
> you will be able to see the mark value.

This is a problem! 

If I run: iptables -I FORWARD -o eth1 -j LOG
I see NO traffic at all!! Nothing!!

But: iptables -I FORWARD -o vlan+ -j LOG
gives me tons of logs!!

iptables only see the traffic through vlans and not through eth1.

The same for tcpdump!!

BTW "mark 2" is there in the iptable LOG.
IN=eth0 OUT=vlan3 SRC=...blablabla ... ACK PSH URGP=0 MARK=0x2

But where can I find IPMARK??

> Otherwise, if you're seeing traffic in the root class but not in the
> leaf class, then that would imply that there is something wrong with the
> filter.

I believe that. I just can not see what is wrong!!

Ethy
