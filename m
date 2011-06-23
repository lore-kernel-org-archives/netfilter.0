From: "Greg Scott" <GregScott@Infrasupport.com>
Subject: RE: Bizarre NAT behavior
Date: Thu, 23 Jun 2011 13:23:40 -0500
Message-ID: <925A849792280C4E80C5461017A4B8A2A0405D@mail733.InfraSupportEtc.com>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com><925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com><925A849792280C4E80C5461017A4B8A2A04055@mail733.InfraSupportEtc.com> <BANLkTinoDyYksg01LfN7W2NBXZnm3+B78g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Payam Chychi <pchychi@gmail.com>, netfilter@vger.kernel.org

Because I want internal users of the website to have the same experience
as external users.  There's an external DNS name, www.{myname}.org and
it translates to a public IP Address.  I want my internal users to
resolve that name from the public, external DNS server, which means
they'll hit the public IP Address.  I know I can reproduce that public
facing DNS zone on a private DNS server using private IP Addresses, but
I would prefer that internal users have an identical experience as the
rest of the world.  And that means I need to do both SNAT and DNAT at
the firewall for these.  

Why do I want the identical experience?  Because this helps with ongoing
website updates and testing.  If the internal experience is even a tiny
bit different, my users could do something to the website and the rest
of the world may see it differently than internal users.  

The technique to do this is documented and worked nicely for several
years.  It still works even now, but only when I watch it with tcpdump.
So I don't see how it could be a problem with my ruleset.  I am even
more worried about what will happen when I upgrade other sites to newer
kernels.  

- Greg Scott


-----Original Message-----
From: Payam Chychi [mailto:pchychi@gmail.com] 
Sent: Thursday, June 23, 2011 12:01 PM
To: Greg Scott; netfilter@vger.kernel.org
Subject: Re: Bizarre NAT behavior

Why are u not natting to internal ip space? Better question, if ur
using NAT why are you not using internal ip inside ur network and
natting to external ip on the egress? Just trying to see why you've
chosen this topology over others.



On 6/23/11, Greg Scott <GregScott@infrasupport.com> wrote:
>> Why would NATing in both PREROUTING and POSTROUTING
>> work  **only**  when I watch it with tcpdump and not work otherwise?
>
> I should be more clear.  The problem is with internal users looking at
> internally hosted web and ftp sites using the public IP Addresses.
The
> way you do this is, DNAT the packet in PREROUTING and then MASQUERADE
> the packet in POSTROUTING.  The technique is documented in a howto
> someplace and I've been doing it for several years at several sites.
>
> At this particular site, all worked fine until I replaced the old
> firewall with a new one.  Now it only works properly when I watch the
> conversation the tcpdump.  I'm not making this up.
>
> - Greg Scott
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Sent from my mobile device

Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer
