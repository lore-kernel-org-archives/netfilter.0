From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Tue, 29 Jun 2010 14:29:39 -0500
Message-ID: <4C2A49A3.1030600@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>	<4C262DA2.1040103@riverviewtech.net>	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>	<4C2805A3.4070801@riverviewtech.net>	<AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>	<4C2909D9.8010506@riverviewtech.net> <AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/29/10 13:15, Anatoly Muliarski wrote:
> Session may be not fully correct word - more precisely it should 
> understand as IP traffic flows specified by address:port pairs to 
> dump the traffic.

So you are wanting to mirror specific flows that are passing through 
your system to VLAN 9.

What interfaces are these flows being passed through?  The bridge and 
another (virtual) interface?  In other words, what would be an example 
of an incoming interface and an out going interface?  Or is this traffic 
making it to your system because it is multicast / flooded on each VLAN?

> Your explanation is correct BUT in current bridging model there would 
> be a hundred attempts to flood ALL broadcast/multicast traffic 
> received from every bridge port. Yes, I can filter them out by using 
> ebtables rules, but this unnecessary attempts will waste CPU time.

Ok.  Just my opinion, but if this system is being designed to do this 
(presuming there are not other options) I'd make sure that the CPU was 
scaled to function with the amount of traffic.

> Writing "to limit traffic direction between bridge devices" I meant 
> there is no support to exclude attempts of flood to ALL ports by 
> limiting a direction of flooding in the description of a bridge 
> device.

Ok...  Now it sounds like you are wanting some more advanced features 
(read things that purposefully break standards in some situations) like 
broadcast storm protection.

> OK bridging will work, but I am afraid to meet performance issues 
> afterwards as I stated above.

Maybe, maybe not.

> Very interesting.

*nod*

> Thank you for your advise, It worth to employ ebtables in solving my 
> tasks. And I have met the same problem with MACs in other project and 
> I had to generate different source MACs for different VLANs and 
> eventually I had to replace the switch to cope with the problem of 
> matching destination MACs for different VLANs.

I'm starting to wonder if your system isn't being used as a traditional 
piece of network infrastructure equipment (router / switch / bridge). 
Rather if you are trying to make a utility that will ""extend a 
monitoring package that is designed to monitor one VLAN in such a way 
that it can monitor multiple VLANs.  Or at least bridge the traffic you 
want to monitor from multiple VLANs down to one VLAN that your 
application can monitor.

If this is the case, and you are using separate VLANs to avoid network 
congestion problems, I agree that bridging might not be the best option 
here.

In this case, I'd look at doing something that will cause your system to 
receive the traffic you are interested in and pass on to the monitoring 
application.  -  I'm guessing that an application layer gateway would 
probably be best at doing this.

The simple fact that you have the amount of incoming traffic that you 
want to filter and forward a subset of implies that there will be CPU 
time spent analyzing which traffic to forward.



Grant. . . .
