From: "Rimas" <rmocius@auste.elnet.lt>
Subject: Re: Two ISP and NAT
Date: Tue, 1 Oct 2002 11:23:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017701c26934$a5275770$6e69690a@rimas>
References: <010901c26913$f9bcf2c0$6e69690a@rimas> <2054.192.168.7.41.1033456942.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: valhalla-list@redhat.com
Cc: netfilter@lists.netfilter.org, rhml@k1k2.com

Andrew,

Me too is not a routing guru. :-)
Ok I will try to explain what I want:

1st working situation

-----------------         ------
|  Internet SP 1  |---->| eth0 |
-----------------         ------ -----------
                                             | Firewall  |
------------------        -----------------
| Local Network |---->| eth2 |
------------------        -------

And I have these iptables rules (of course they are not all there):
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -t nat -A PREROUTING -i $EXTERNAL_INTERFACE_1 -p tcp -d
$EXTERNALIP_1 --dport 25 -j DNAT --to-destination 1.2.3.196:25
# Lotus Notes Encrypted connection (tcp 1352) port forward from eth0 to
internal ip 1.2.3.196
iptables -t nat -A PREROUTING -i eth0 -p tcp -d $EXTERNALIP_1 --dport
1352 -j DNAT --to-destination 1.2.3.196:1352

With this configuration I have no problem with Internet (incoming and
outgoing) and incoming emails.

But when I add a second ISP:
-----------------         ------                 -------        ------------
---
|  Internet SP 1  |---->| eth0 |                 | eth1 |<----| Internet SP
2 |
-----------------         ------ ----------- ------        ---------------
                                             | Firewall  |
------------------        -----------------
| Local Network |---->| eth2 |
------------------        -------

Well if I make no changes I cannot use the second one Internet connection.

So I make some changes:
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
route rep default via ext_ip2 dev eth1 - make default route (to route all
outgoing packets via ISP2)
ip route add  1.2.3.4 via $EXTERNALIP_1 (eth0) - I want some route for
external address - it goes via ISP1

And now I'm in trouble, I cannot receive emails, the PREROUTING of ports 25
and 1352 for eth0 is blocked for some reason.
Lotus Notes internal server cannot connect via 1352 port to outside and of
course on incoming connection via 1352 port.

What is a trick?

And the last point how to route all outgoing packets from internal address
(source is Email server) via FW eth0?
I know I can use iproute2 but there are no good examples for this.


Thanks

Rimas


----- Original Message -----
From: "Andrew Smith" <rhml@k1k2.com>
To: <valhalla-list@redhat.com>
Sent: Tuesday, October 01, 2002 8:22 AM
Subject: Re: Two ISP and NAT


> > Andrew,
> >
> > The biggest problems are that with configuration below I cannot receive
> > emails and use
> > port 1352 for secure Lotus Notes connection.
> >
> > When I use just one conenction via eth0 with MASQ and PREROUTING
> > everything works just fine.
> >
> > Thanks
> >
> > Rimas
> >
> >
> > ----- Original Message -----
> > From: "Andrew Smith"
> > To: <valhalla-list@redhat.com>
> > Sent: Tuesday, October 01, 2002 5:14 AM
> > Subject: Re: Two ISP and NAT
> >
> >
> >> > On Mon, 2002-09-30 at 20:01, Rimas wrote:
> >> >> Hi folks,
> >> >>
> >> >> I have 2 ISP Inet connections.
> >> >>
> >> >> 1 Inet I (eth0) use have used for everything (SMTP server, MASQ for
> >> >> local network) I got the 2 INET (eth1)  and made some changes:
> >> >>
> >> >> They both have MASQ:
> >> >>     iptables -t nat -A POSTROUTING -o $EXTERNAL_INTERFACE_2 -j
> >> >>     MASQUERADE (2 Inet) iptables -t nat -A POSTROUTING -o
> >> >>     $EXTERNAL_INTERFACE_1 -j MASQUERADE (1 Inet)
> >> >>
> >> >> I changed default route to eth1 and put some additional  route:  ip
> >> >> route rep default via ext_ip2 dev eth1
> >> >> ip route add  1.2.3.4 via ext_ip1 (eth0)
> >> >>
> >> >> And now I'm having a problem with my email server (Lotus Notes on
> >> >> Linux). It can send emails via SMTP but cannot use encrypted Lotus
> >> >> connection and receive emails as well.
> >> >>
> >> >>  iptables -t nat -A PREROUTING -i $EXTERNAL_INTERFACE_1 -p tcp -d
> >> >>  $EXTERNALIP_1 --dport 25 \
> >> >>                                   -j DNAT --to-destination
> >> >>                                   1.2.3.196:25
> >> >>
> >> >> # Lotus Notes Encrypted connection (tcp 1352) port forward from
> >> >> eth0 to internal ip 10.105.105.196
> >> >>  iptables -t nat -A PREROUTING -i $EXTERNAL_INTERFACE_1 -p tcp -d
> >> >>  $EXTERNALIP_1 --dport 1352 \
> >> >>                                    -j DNAT --to-destination
> >> >>                                    1.2.3.196:1352
> >> >>
> >> >> And how to route with ip route command that email server have to
> >> >> use not the default route (eth1) but eth0.
> >> >>
> >> >
> >> > Something like
> >> > route add -host x.x.x.x dev eth0
> >> >
> >> > route --help
> >> > man route
> >>
> >> Actually I'm not sure what is wanted here, but if you want to do
> >> source IP routing (i.e. a route based on the IP of your machine
> >> and or source/target ports, not the target machine IP) then you
> >> need to read up on iproute2.
> >>
> >> see: http://www.linuxgrill.com/iproute2.doc.html
> >> (this is the whole thing in one page)
> >> Or see www.tldp.org Advanced Routing Howto
> >> Or google on iproute2
> >>
> >> As stated here before by a few - iproute2 gives you powerful routing
> >> control that you usually need with two conections rather than the
> >> extreemly simplistic control of the "route" command.
> >>
> >> However, iproute2 is not for the feint hearted!
> >>
> >> I still haven't spent the time to get my dual ADSL connection routing
> >> out both connections based on static vs MASQ IP (fortunately my DHCP
> >> ISP doesn't do any egress stuff :-) - but then again my 2 and 3 year
> >> old don't like me doing that stuff either - I'll get around to it one
> >> day soon :-) :-)
> >>
> >> --
> >> -Cheers
> >> -Andrew
>
> Can you draw a text layout of the computers?
> I'm not sure what is running on what computer :-(
>
> Assuming all is on the router then:
> PREROUTING and POSTROUTING have nothing to do with connections
> from the router to the internet - only from machines that are
> forwarding through the router.
> You will have 2 IP adresses assigned - one to each interface.
> When the router talks out interface 1 it's IP is the IP address
> of interface 1
> When the router talks out interface 2 it's IP is the IP address
> of interface 2
> (I just tried this with ping to be certain I'm right)
>
> Now if Lotus/whatever is running on another machine then you
> need to use PREROUTING and POSTROUTING to enable outgoing and
> incoming connections to the Lotus machine.
> Outgoing connections use POSTROUTING SNAT or POSTROUTING MASQUERADE
> (In your case it should be POSTROUTING MASQUERADE)
> Incoming connections use PREROUTING DNAT
> (some protocols require connections back to the client)
> But I'd suggest you have the DNAT/MASQUERADE and SNAT rules twice
> - once for each connection, that way if you change your routing to
> use a different connection, it will still work
>
> (I'm no routing guru - all just from experience so I could lead
> you astray :-)
>
> As said before ...
> As for deciding what should go out which connection ... standard
> "route" can only do it based on destination IP's
> iproute2 can do it based on all sorts of criteria.
>
> --
> -Cheers
> -Andrew
>
> MS ... if only he hadn't been hang gliding!



