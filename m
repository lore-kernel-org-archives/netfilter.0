From: William Knop <w_knop@hotmail.com>
Subject: Re: iptables routing help
Date: Sun, 25 Jan 2004 00:31:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A9EB4907-4EF7-11D8-A7CD-000A9577164C@hotmail.com>
Mime-Version: 1.0 (Apple Message framework v609)
Content-Type: multipart/alternative; boundary=Apple-Mail-1-64698093
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


--Apple-Mail-1-64698093
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

Say I want to transfer a file from one computer to another in my house. 
Since they are on different subnets, the data is routed out my modem to 
the gateway at my isp, and then back in my modem and to the other 
computer in my house. Ideally (in any reasonable setup), the data 
should not leave the house and flood my dsl modem with local traffic.

So, I want to grab packets destined for the gateway (via a 
firewall/iptables), check if the packet is destined for one of the 
three local subnets, and make the packet go directly to it's 
destination. I'm not sure if this has to do with ethernet frames, 
tcp/ip, or arp or something like that, but I've tried lots of things 
with minimal success.


> im not shure if i can understand the schema, could be more specific?
>
> thanks
>
>
> ----- Original Message -----
> From: "William Knop" <w_knop@hotmail.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Saturday, January 24, 2004 6:25 PM
> Subject: iptables routing help
>
>
> > Hello,
> > My dsl provider has my house on several subnets (ips obtained via 
> dhcp,
> > along with a netmask of 255.255.255.0), so I have had to screw around
> > with each machine to make sure local traffic doesn't flood the dsl
> > modem. To remedy this, I've been trying to set up a firewall box to
> > basically reroute those three subnets as local, but I'm finding it 
> very
> > difficult. It seems like every doc out there only addresses nat, 
> which
> > is definitely not what we want. I'd greatly appreciate some help
> > accomplishing this.
> >
> > Thanks much,
> > William
> >
> >
> >
> >




--Apple-Mail-1-64698093
Content-Transfer-Encoding: 7bit
Content-Type: text/enriched;
	charset=US-ASCII

<fontfamily><param>Courier</param><x-tad-bigger>Say I want to transfer
a file from one computer to another in my house. Since they are on
different subnets, the data is routed out my modem to the gateway at
my isp, and then back in my modem and to the other computer in my
house. Ideally (in any reasonable setup), the data should not leave
the house and flood my dsl modem with local traffic.


So, I want to grab packets destined for the gateway (via a
firewall/iptables), check if the packet is destined for one of the
three local subnets, and make the packet go directly to it's
destination. I'm not sure if this has to do with ethernet frames,
tcp/ip, or arp or something like that, but I've tried lots of things
with minimal success.

</x-tad-bigger></fontfamily>


<excerpt><fontfamily><param>Courier</param><x-tad-bigger>im not shure
if i can understand the schema, could be more specific?


thanks



----- Original Message ----- 

From: "William Knop"
<<</x-tad-bigger><color><param>0000,0000,EEEE</param><x-tad-bigger>w_knop@hotmail.com</x-tad-bigger></color><x-tad-bigger>>

To:
<<</x-tad-bigger><color><param>0000,0000,EEEE</param><x-tad-bigger>netfilter@lists.netfilter.org</x-tad-bigger></color><x-tad-bigger>>

Sent: Saturday, January 24, 2004 6:25 PM

Subject: iptables routing help



></x-tad-bigger><italic><x-tad-bigger> Hello,

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
My dsl provider has my house on several subnets (ips obtained via
dhcp, 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
along with a netmask of 255.255.255.0), so I have had to screw around 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
with each machine to make sure local traffic doesn't flood the dsl 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
modem. To remedy this, I've been trying to set up a firewall box to 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
basically reroute those three subnets as local, but I'm finding it
very 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
difficult. It seems like every doc out there only addresses nat, which 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
is definitely not what we want. I'd greatly appreciate some help 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
accomplishing this.

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
Thanks much,

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger>
William

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> 

</x-tad-bigger></italic><x-tad-bigger>></x-tad-bigger><italic><x-tad-bigger> 

</x-tad-bigger></italic></fontfamily></excerpt><fontfamily><param>Courier</param><x-tad-bigger>



</x-tad-bigger></fontfamily>
--Apple-Mail-1-64698093--



