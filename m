From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Kazaa Ports
Date: Mon, 8 Sep 2003 14:02:28 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030908210228.48729.qmail@web40201.mail.yahoo.com>
References: <3F5CC0D5.9080708@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5CC0D5.9080708@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, netfilter@lists.netfilter.org


--- Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
> 
> 
> SBlaze wrote:
> 
> >--- Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
> >  
> >
> >>Hi All,
> >>
> >>I am trying to provide a modest amount of security for a home LAN using 
> >>NAT and filtering. My family insists on using Kazaa Lite on their 
> >>Windows boxes (aaahhh!!).
> >>
> >>My (other) problem is that Kazaa insists on using sequential source 
> >>ports and seemingly random destination ports to make connections. I 
> >>already have a rule to allow ESTABLISHED,RELATED through, but these 
> >>packets must be new connections (connecting to supernodes maybe?). No 
> >>matter how many ports I open I can't seem to open enough ports to make 
> >>it run.
> >>
> >>I'm rapidly becoming unpopular in my house. Any ideas how I can make 
> >>Kazaa Lite work and still maintain some security? Are these mutually 
> >>exclusive goals?
> >>
> >>Jeff
> >>
> >>
> >>    
> >>
> >
> >Are you using NAT? This is probably your best soloution.
> >  
> >
> I use SNAT. Here is the rule:
> 
> iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP
> 
> My default policy on the filter FORWARD chain is drop, so any required ports
> have to have an ACCEPT rule for in order for services to work. In this case,
> Kazaa expects to have an unknown (large) number of ports open LAN->Net and it
> fails when it finds a blocked port.
> 
> I can make it work if I stop filtering outbound traffic, but I found a worm
> last month by checking unauthorized outbound traffic and I'm reluctant to
> give up that extra security.
> 
> Jeff
> 
> 
> 
Assuming that you are running the Kazza on a Internal windows machine the
POSTROUTING should handle all of the out going of the Kazza Client...

what is probably not making it through is the returning connection attempts of
the Kazza servers? In which case... you shouldn't be using FORWARD lines at all
sinnce these are supposedly destined for the local machine(as in the Linux box
itself and not anything in your lan). What I think is needed here is the
PREROUTING of a range or specific ports. I think this will solve your problem
for Kazza but it offers very little as in the way of security for those ports.

An example of this is when I used to run my Half-Life Deadicated Server on my
internal Windows Machine I used a PREROUTING line such as...

iptables -t nat -A PREROUTING -p udp --dport 27015 -i eth0 -j DNAT
--to-destination 192.168.1.25:27015

While my scenerio was alot simpler than yours it's similar I think. Your
problem will be of course finding the range of ports. I would also say take
note of the use of limiting it to one protocol(if you can). Better to have a
straw open to the world than a big ol sewer pipe!

Hope this helps
SBlaze

=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

