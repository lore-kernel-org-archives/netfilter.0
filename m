From: "Philippe Dhont   (Sea-ro)" <Philippe.Dhont@searo.be>
Subject: Could it be this ?
Date: Thu, 10 Apr 2003 12:57:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B5747F3DB39FD411884B00B0D07808CCB6CA0A@server10>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

=20
Hi, sorry to disturb you again but could the reason that my pings don't =
go
via the SNAT rule because if firewall script is down that then the
ip_forwarding takes over ?
And that in this case the ARP table or whatever hangs to the =
ip_forwarding ?
It seems -still testing- that when i stop the script, start it and then =
wait
a few seconds for pinging, and then i ping after a few seconds, the =
SNAT
rule is working.
Any experience with this ?

Regards,

	--tronstr@xsomic--


-----Original Message-----
From: Philippe Dhont (Sea-ro)=20
Sent: donderdag 10 april 2003 12:31
To: netfilter@lists.netfilter.org

Hi,

1) Yesterday everything worked with the SNAT rule and today i moved the
firewall to it's new location, changed the ip-address and added some =
routes.
I test with a NT4 on the side of eth0 that pings to a location on the =
eth1
side.
now, sometimes i can see that it works, via tcpdump i see that the SNAT =
rule
works and when i then flush my tables and restart the firewall script, =
it's
not working anymore ?????
and then i can see via tcpdump that the firewall is just trying the
ip_forwarding ?????
So this means that the packet is not even coming to the SNAT rule ??? =
and
then sometimes it is, how is this possible ??

2) my ip_forwarding is enabled in the kernel but this should not be a
problem. yesterday everything worked on my test location.

3) do i need ip_forwarding for NATing ?

thnx for the help!

regards,

	--tronstr@xsomic--







Le mer 09/04/2003 =E0 11:51, Philippe Dhont (Sea-ro) a =E9crit :
> I added
> $IPTABLES -t nat -A POSTROUTING -j SNAT --to-source 10.165.165.165 =
Now=20
> when i ping from 10.51.13.13 on eth0 side to 10.165.1.60 then i can=20
> see via tcpdump that on eth1 the 10.165.1.60 is seeking the=20
> 10.165.165.165 "arp who-has 10.165.165.165 tell 10.165.1.60" is what =
i
get.
> So i guess that this means that iptables changed the address ?

As far as I understand your configuration, eth0's side is NATed when =
talking
to eth1's side.

If so, yes, Netfilter as already changed the address. That's obvious.
Your echo request has crossed the box, and has been source NATed to
10.165.165.165. Then 10.165.1.60 receive it and tries to reply. It =
replies
to 10.165.165.165. Nothing special in there, everything's normal.

But on eth1's side, nobody answers ARP requests for 10.165.165.165. So =
you
did not configured your firewall to answer them. That's the issue.

> So the firewall doesn't knows that it converted the ip number before=20
> and can't send a reply to the correct ip address where it originally=20
> came from

He knows about this. But it is not its job to answer ARP requests. It's =
your
job to configure it as such.

> How can i make this work so that if i ping to 10.165.1.60 that i can=20
> get a reply ?

	ip addr add 10.165.165.165 dev eth1

So your firewall answers ARP requests for 10.165.165.165.

> AND that the NAT thing did its work ?

It did it well.


