From: William Knop <w_knop@hotmail.com>
Subject: Re: iptables routing help
Date: Sun, 25 Jan 2004 13:53:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C6E1084C-4F67-11D8-A7CD-000A9577164C@hotmail.com>
Mime-Version: 1.0 (Apple Message framework v609)
Content-Type: multipart/alternative; boundary=Apple-Mail-2-112850314
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--Apple-Mail-2-112850314
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

Okay, the problem is that we don't want to do nat (as I said in my 
original plee for help). We need external ips on all of the machines. 
Additionally, The ISP's DHCP server specifies it's own gateway, so I 
can't do normal routing, without spoofing the gateway's address and 
doing all sorts of ugly stuff (please correct me if I'm wrong).

I was under the impression one could have iptables drop a packet from 
the prerouting or brouting table and it would go through the machine's 
routing table, without being specified on all the lan machines as the 
gateway.

The physical layout we have are a bunch of boxes connected to a switch, 
and the dsl modem connected to the switch's uplink port. I could have 
the modem jack into a firewall box, or something, however the linux 
ethernet bridge seems to do very odd things to arps, and also iptables. 
Would bridging be necessary?


> On January 25, 2004 12:31 am, William Knop wrote:
> > Say I want to transfer a file from one computer to another in my 
> house.
> > Since they are on different subnets, the data is routed out my modem 
> to
> > the gateway at my isp, and then back in my modem and to the other
> > computer in my house. Ideally (in any reasonable setup), the data
> > should not leave the house and flood my dsl modem with local traffic.
> >
> > So, I want to grab packets destined for the gateway (via a
> > firewall/iptables), check if the packet is destined for one of the
> > three local subnets, and make the packet go directly to it's
> > destination. I'm not sure if this has to do with ethernet frames,
> > tcp/ip, or arp or something like that, but I've tried lots of things
> > with minimal success.
> >
> > > im not shure if i can understand the schema, could be more 
> specific?
> > >
> > > thanks
> > >
> > >
>
>         Okay ...you have a LAN inside the DSL modem that has
>         externally routable IPs on different subnets, and you want
>         to setup an internal routing table that knows all of these
>         hosts.
>
>         One question ... what is the physical setup involved?
>
>         i.e. are all the boxes involved connected directly to the DSL 
> modem?
>         is the Linux/Iptables box the only box connected to the DSL 
> modem, and
>         the downstream boxes are connected to a switch/hub off a 
> secondary
>         interface off the firewall box?
>
>         -- I suspect from your description we are looking at  
> DSLmodem/router to
>         separate boxes ...
>
>
>         Alistair

--Apple-Mail-2-112850314
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=US-ASCII

Okay, the problem is that we don't want to do nat (as I said in my
original plee for help). We need external ips on all of the machines.
Additionally, The ISP's DHCP server specifies it's own gateway, so I
can't do normal routing, without spoofing the gateway's address and
doing all sorts of ugly stuff (please correct me if I'm wrong).


I was under the impression one could have iptables drop a packet from
the prerouting or brouting table and it would go through the machine's
routing table, without being specified on all the lan machines as the
gateway.


The physical layout we have are a bunch of boxes connected to a
switch, and the dsl modem connected to the switch's uplink port. I
could have the modem jack into a firewall box, or something, however
the linux ethernet bridge seems to do very odd things to arps, and
also iptables. Would bridging be necessary?



<excerpt><fontfamily><param>Courier</param><x-tad-bigger>On January
25, 2004 12:31 am, William Knop wrote:

></x-tad-bigger><italic><x-tad-bigger> Say I want to transfer a file
from one computer to another in my house.

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
Since they are on different subnets, the data is routed out my modem to

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
the gateway at my isp, and then back in my modem and to the other

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
computer in my house. Ideally (in any reasonable setup), the data

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
should not leave the house and flood my dsl modem with local traffic.

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
So, I want to grab packets destined for the gateway (via a

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
firewall/iptables), check if the packet is destined for one of the

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
three local subnets, and make the packet go directly to it's

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
destination. I'm not sure if this has to do with ethernet frames,

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
tcp/ip, or arp or something like that, but I've tried lots of things

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
with minimal success.

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
> im not shure if i can understand the schema, could be more specific?

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> >

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
> thanks

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> >

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> >

</x-tad-bigger></italic><x-tad-bigger>

        Okay ...you have a LAN inside the DSL modem that has 

        externally routable IPs on different subnets, and you want

        to setup an internal routing table that knows all of these 

        hosts.


        One question ... what is the physical setup involved?


        i.e. are all the boxes involved connected directly to the DSL
modem?

        is the Linux/Iptables box the only box connected to the DSL
modem, and

        the downstream boxes are connected to a switch/hub off a
secondary 

        interface off the firewall box?


        -- I suspect from your description we are looking at 
DSLmodem/router to 

        separate boxes ...



        Alistair

</x-tad-bigger></fontfamily></excerpt>
--Apple-Mail-2-112850314--



