From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Re: Route packets from an interface to another
Date: Sun, 11 Sep 2005 17:58:51 -0400
Message-ID: <65aa6af905091114587474ea98@mail.gmail.com>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<200509091636.37287.rob0@gmx.co.uk>
	<2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>
	<200509092345.40386.rob0@gmx.co.uk> <43258442.4000009@wildcash.com>
	<65aa6af905091114314108597e@mail.gmail.com>
	<65aa6af90509111432525f4bd6@mail.gmail.com>
	<4325933E.1070902@wildcash.com>
	<65aa6af9050911145833fa12fd@mail.gmail.com>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af9050911145833fa12fd@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I always forget to send the mail no the netfilter list. I'm sorry for
that, guys... I'll try not to repeat the same mistake again.

---------- Forwarded message ----------
From: Edmundo Carmona <eantoranz@gmail.com>
Date: Sep 11, 2005 5:58 PM
Subject: Re: Fwd: Route packets from an interface to another
To: Rudi Starcevic <tech@wildcash.com>


mmmmmmmm......... ok.... rob0 made a master class from your email....
but I'm willing to help you anyway. :-D

mmmmmmmmm........... I guess it just feels like a normal router
connected to the internet.

I will assume you want to be able to have traffic between your two lans, ri=
ght?

I will delete your routing tables.

I will flush all routing from the default table.

Set eth0 and eth1:
ifconfig eth0 blah blah
ifconfig eth1 blah blah

set the default gw
ip route add default via gwIP

let's enable forward between both interfaces:
echo "1" > /proc/blah/blah/ip_forward

I don't remember if eth0 is the lan with the internet router... or eth1

I will assume it's eth1 for this next paragraph.

here's a thing you have to consider. If the boxes in the eth1 lan know
how to reach the boxes in eth0 lan (that means, they know they have to
use you as the router for that network), then you have to do nothing
else. You will have traffic traversing between both networks. If they
don't, then masquerade traffic going out eth1.

There are a couple of aditional details.... but I guess that's the
"core" of the problem.

Is that of any help?


On 9/12/05, Rudi Starcevic <tech@wildcash.com> wrote:
> Hi,
>
> > What is it you want to achieve?
>
> eth0 -> 192.168.2.0/24
> eth1 -> 192.168.3.0/34
>
> I want to achieve two seperate networks.
>
> I want traffic from eth1 to go via eth0
> which will link the two LANS and provide
> Internet access.
>
> > I don't see any firewall configuration at all....
> > your route is wide open... so to speak.
>
> Yes, I have not added any firewalling yet.
> This is for my 3 machines at home.
>
> After I am happy with my routing I intend to add
> Firewalling rules, VPN and learn about bandwith shaping.
>
> > In case you want to enable forwarding from the lan boxes to internet,
> > just enable forward, masquerade output and that's it.
>
> It would be this simple if there was just one LAN.
>
> > Creating two separate routing tables is not a must.
>
> The issue here is how to route packets from one NIC to another.
> Deciding on which networks to use and why is another question.
>
> > Once the network interfaces
> > come up, they set the route.... just make sure the default gateway is
> > set as well.
>
> Won't the default route for eth0 be 192.168.2.6 and won't the default
> route for eth1 be 192.168.3.6 ?
>
> I fail to see how "Once the network interfaces come up,
> they set the route" will make packets from eth1 will
> auto-magiclly go out eth0 as eth1 default route is not eth0 by default.
>
> Regards,
> Rudi.
>
>
>

