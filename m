From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: FAQ: Cannot port forward/DNAT
Date: Mon, 20 Aug 2012 11:06:47 -0500
Message-ID: <20120820160647.GB3672@harrier.slackbuilds.org>
References: <CAHEKYV5kM-_0GWg1RxDufED=dpaB5yL88qpgZDukB+anzAEhcw@mail.gmail.com>
 <20120808200812.GJ3672@harrier.slackbuilds.org>
 <CAHEKYV6io1PMyw=Q_CKsRmG+Z6mDYsCyoJ70aubodR8f4H-BMA@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHEKYV6io1PMyw=Q_CKsRmG+Z6mDYsCyoJ70aubodR8f4H-BMA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Aug 20, 2012 at 10:03:20AM -0400, Mauricio Tavares wrote:
> On Wed, Aug 8, 2012 at 4:08 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Wed, Aug 08, 2012 at 01:07:59PM -0400, Mauricio Tavares wrote:
> >> This is a trivial question; I have done this many times before, 
> >> but I must be missing something here and just can't see what. 
> >> So, I have a firewall where eth0 faces the external network 
> >> (192.168.42.0/24) and eth1 the internal one (10.0.0.0/24). Now, 
> >
> I apologize for taking so long to reply but I followed you advice
> and spent some time reading

Hehe ... no apology needed, on the contrary, I am pleased that you 
took your time. It DOES take time to absorb all the information you 
need.

> http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html. It
> is working now -- has been for a week -- but I would like to post the
> outcome not only in case might be useful to someone else but also to
> make sure I understand what is going on.

I think you do.

> > First off, you should never NAT from one RFC 1918 network to another.
> > Simply set up proper routing on both sides and enjoy.
> >
>       Could you explain why that is the case?

Basically, NAT exists [mostly] so that RFC 1918 networks can speak to 
the Internet and vice versa. Your own networks do not need it. NAT is 
a crutch and a limiting factor.

Hosts on 10.0.0.0/24 have a default gateway, and if that gateway has 
a route to 192.168.42.0/24, those hosts in 10.0.0.0/24 can make a
direct connection to hosts in 192.168.42.0/24. This must work both 
ways, of course: the gateway for 192.168.42.0/24 must also have a 
route to 10.0.0.0/24.

> You see, this is my test setup which emulates a production 
> environment. That is why in my rules have comments referring to 
> "internet" even though it is a rather enclosed test environment.
> As such, I would like to have the test firewall behave exactly
> as the production one, save of course the addresses of the
> networks involved.

Ah, no, I did not understand that, and in this case that makes good 
sense. Yes, you need to keep the iptables machine in the packet path 
for your DNAT connections, and SNAT is the way to do that. I was 
thinking that you were really linking two RFC 1918 networks, not 
fully understanding that one of them was a placeholder for the real 
Internet.

Note that I wrote the previous section ("Basically, NAT exists ...") 
before understanding your real goal. It's right, but it's not right 
for you.

DNAT works for your typical Linux-based SOHO router because said 
router is already doing SNAT for the LAN-to-Internet traffic.

The rest of this is probably not relevant.

[snip]
> After a while I realized what you meant:
> 
> -A POSTROUTING -d 10.0.0.20/32 -p tcp -m tcp --dport 2424 -j
> SNAT --to-source 10.0.0.1
> 
> And then finally traffic was getting back to 192.168.42.66.
> Thanks!

I'm glad it worked out, and more importantly, that you learned 
how and why! Good job.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
