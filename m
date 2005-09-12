From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Fwd: Route packets from an interface to another
Date: Mon, 12 Sep 2005 08:06:21 -0700
Message-ID: <4325996D.2070801@wildcash.com>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>	
	<200509091636.37287.rob0@gmx.co.uk>	
	<2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>	
	<200509092345.40386.rob0@gmx.co.uk>
	<43258442.4000009@wildcash.com>	
	<65aa6af905091114314108597e@mail.gmail.com>	
	<65aa6af90509111432525f4bd6@mail.gmail.com>	
	<4325933E.1070902@wildcash.com>
	<65aa6af9050911145833fa12fd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050911145833fa12fd@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Edmundo,


> Is that of any help?
Indeed yes ... many thanks.

> I will assume you want to be able to have traffic between your two lans, right?
Yes. Once that is in place I'm interested in restricting the IPs who
travers the two networks.

> 
> I will delete your routing tables.
> 
> I will flush all routing from the default table.
> 
> Set eth0 and eth1:
> ifconfig eth0 blah blah
> ifconfig eth1 blah blah
> 
> set the default gw
> ip route add default via gwIP
> 
> let's enable forward between both interfaces:
> echo "1" > /proc/blah/blah/ip_forward
> 
> I don't remember if eth0 is the lan with the internet router... or eth1

It's eth0.

> 
> I will assume it's eth1 for this next paragraph.
> 
> here's a thing you have to consider. If the boxes in the eth1 lan know
> how to reach the boxes in eth0 lan (that means, they know they have to
> use you as the router for that network), then you have to do nothing
> else. You will have traffic traversing between both networks. If they
> don't, then masquerade traffic going out eth1.
> 
> There are a couple of aditional details.... but I guess that's the
> "core" of the problem.

Awesome .. thanks again .. just the advice I was hoping to gain.

I hope to build a ruleset that doesn't need Masquerading between
interfaces, but as we know that belongs to the LARTC list.

Regards,
Rudi.




