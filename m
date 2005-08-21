From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: netfilter Digest, Vol 13, Issue 41
Date: Sat, 20 Aug 2005 22:07:30 -0700
Message-ID: <9927912d05082022073be31d9@mail.gmail.com>
References: <43065f47.440d1f8c.7c69.363eSMTPIN_ADDED@mx.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43065f47.440d1f8c.7c69.363eSMTPIN_ADDED@mx.gmail.com>
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

Hi to all,

Can anyone tell where I can sample firewall scripts that contain
1) about 100 rules
2) about 1000 - 2000 rules1

I am using RH9..i want to use these for testing the amount of
processing required for each of these scripts?

Warm regards,
Visham=20

On 8/19/05, netfilter-request@lists.netfilter.org
<netfilter-request@lists.netfilter.org> wrote:
> Send netfilter mailing list submissions to
> =09netfilter@lists.netfilter.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
> =09https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> =09netfilter-request@lists.netfilter.org
>=20
> You can reach the person managing the list at
> =09netfilter-owner@lists.netfilter.org
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
>=20
>=20
> Today's Topics:
>=20
>    1. Re: port 80 out new ISP (/dev/rob0)
>    2. Re: port 80 out new ISP (Brent Clark)
>    3. Re: port 80 out new ISP (Brent Clark)
>    4. Re: Forward to DMZ addresses (Jonathan Villa)
>    5. Re: Forward to DMZ addresses (Taylor, Grant)
>=20
>=20
> ----------------------------------------------------------------------
>=20
> Message: 1
> Date: Fri, 19 Aug 2005 12:05:22 -0500
> From: /dev/rob0 <rob0@gmx.co.uk>
> Subject: Re: port 80 out new ISP
> To: netfilter@lists.netfilter.org
> Message-ID: <200508191205.22196.rob0@gmx.co.uk>
> Content-Type: text/plain;  charset=3D"iso-8859-1"
>=20
> On Friday 2005-August-19 10:55, Brent Clark wrote:
> > I currently have been reading the following doc.
> >
> > http://linux-ip.net/html/adv-multi-internet.html
> >
> > and have changed my scripts accordingly.
>=20
> Not quite.
>=20
> > my setup is as so
> >
> > firewall:
> > eth0 196.36.10.114    -> Routes traffic to old ISP
> > eth1 192.168.111.10    -> Private Lan
> > eth2 192.168.10.100    -> for ADSL
> >
> > Adsl modem:
> > ipaddress: 192.168.10.200 (external ip dynamically assigned)
>=20
> This "modem" is also functioning as a NAT router? So in effect your=20
> 192.168.10.100 IP (eth2) can function as an external interface?
>=20
> > ## Create the table
> > ip route flush table TELKOM  >>/dev/null
> > ip route show table main |grep -Ev ^default\
>=20
> What does this command, without the "\<newline>" and pipe, return?
>=20
> >    | while read ROUTE ; do
> >
> >      ip route add table TELKOM $ROUTE
> >   done
> >
> > ## Add the ADSL as route to route table 4
> >
> > ip route add default via 192.168.10.200 dev eth2 table TELKOM
> > >>/dev/null
> >
> > ## Add the route to table TELKOM
> >
> > ip rule add fwmark 1 table TELKOM >> /dev/null
>=20
> And what do your routing rules show at this point?
>=20
> > $IPT -t nat -A PREROUTING -i eth1 -t mangle -p tcp --dport 80 -j MARK
> > --set-mark 1
> > $IPT -t nat -A PREROUTING -i eth1 -t mangle -p tcp=20
> > --dport 443 -j MARK --set-mark 1
> >
> > # SNAT the Private LAN
> > $IPT -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -j SNAT
> > --to-source 196.36.10.114
> > #$IPT -t nat -A POSTROUTING -o eth2 -s=20
> > 192.168.111.0/24 -j SNAT --to-source 192.168.10.200
>=20
> Why is that one commented?
>=20
> > $IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j MASQUERADE
>=20
> MASQUERADE will not work with dual routing.
> --=20
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 2
> Date: Fri, 19 Aug 2005 19:22:56 +0200
> From: Brent Clark <bclark@eccotours.dyndns.org>
> Subject: Re: port 80 out new ISP
> To: /dev/rob0 <rob0@gmx.co.uk>
> Cc: netfilter@lists.netfilter.org
> Message-ID: <43061570.9090702@eccotours.dyndns.org>
> Content-Type: text/plain; charset=3DISO-8859-1; format=3Dflowed
>=20
> Hi Rob
>=20
> A big thanks for replying to my email.
>=20
> >>ip route flush table TELKOM  >>/dev/null
> >>ip route show table main |grep -Ev ^default\
> >=20
> >=20
> > What does this command, without the "\<newline>" and pipe, return?
> >=20
>=20
> gate:~# ip route show table main | grep -Ev ^default
> 196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
> 192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
> 192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
> gate:~#
>=20
> >>ip rule add fwmark 1 table TELKOM >> /dev/null
> >=20
> >=20
> > And what do your routing rules show at this point?
>=20
> gate:~# ip rule show
> 0:      from all lookup local
> 32765:  from all fwmark 0x1 lookup TELKOM
> 32766:  from all lookup main
> 32767:  from all lookup default
> gate:~#
>=20
> gate:~# ip route show table main
> 196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
> 192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
> 192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
> default via 196.36.10.113 dev eth0
> gate:~#
>=20
> gate:~# ip route show table TELKOM
> 196.36.10.112/29 dev eth0  proto kernel  scope link  src 196.36.10.114
> 192.168.111.0/24 dev eth1  proto kernel  scope link  src 192.168.111.10
> 192.168.10.0/24 dev eth2  proto kernel  scope link  src 192.168.10.100
> default via 192.168.10.200 dev eth2
> gate:~#
>=20
>=20
> >># SNAT the Private LAN
> >>$IPT -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -j SNAT
> >>--to-source 196.36.10.114
> >>#$IPT -t nat -A POSTROUTING -o eth2 -s=20
> >>192.168.111.0/24 -j SNAT --to-source 192.168.10.200
> >=20
> >=20
> > Why is that one commented?
>=20
> Im commented it out, hoping the MASQUERADE would work.
> >=20
> >=20
> >>$IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j MASQUERADE
> >=20
> >=20
> > MASQUERADE will not work with dual routing.
>=20
> Thanks
>=20
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 3
> Date: Fri, 19 Aug 2005 20:05:59 +0200
> From: Brent Clark <bclark@eccotours.dyndns.org>
> Subject: Re: port 80 out new ISP
> To: /dev/rob0 <rob0@gmx.co.uk>
> Cc: netfilter@lists.netfilter.org
> Message-ID: <43061F87.1030507@eccotours.dyndns.org>
> Content-Type: text/plain; charset=3DISO-8859-1; format=3Dflowed
>=20
> Hi Rob
>=20
> Im not sure is this a good way of debugging
>=20
> but I tried this:
>=20
> iptables -t nat -A PREROUTING --dport 80 -j LOG
> Aug 19 18:40:32 gate kernel: IN=3Deth1 OUT=3D
> MAC=3D00:00:f4:af:80:b8:00:60:67:77:aa:92:08:00 SRC=3D192.168.111.213
> DST=3D66.36.247.82 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D2925 DF=
 PROTO=3DTCP
> SPT=3D4032 DPT=3D80 WINDOW=3D65535 RES=3D0x00 SYN URGP=3D0
>=20
> Notice that "OUT=3D" does not show eth2
>=20
> Brent
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 4
> Date: Fri, 19 Aug 2005 13:57:32 -0500 (CDT)
> From: "Jonathan Villa" <jonathan@innovativesource.net>
> Subject: Re: Forward to DMZ addresses
> To: "netfilter" <netfilter@lists.netfilter.org>
> Message-ID:
> =09<39244.206.166.83.50.1124477852.squirrel@mail.innovativesource.net>
> Content-Type: text/plain;charset=3Diso-8859-1
>=20
> First, grrr.... I just wrote a nice lengthy reply but my webmail session
> timed out and I lost it...let's see if I can remember everything I wrote
>=20
> >>   router
> >>     |
> >>   VLAN Switch
> >>     |
> >>  firewall
> >>   |    |
> >>  LAN  DMZ
> >
> > Ok, if I am reading you correctly now, your router's internal interface
> >that is connected to the VLAN switch has an IP that is on the same subne=
t
> > as the servers that will be in the DMZ.
>=20
> Yes.  You're correct
>=20
> >I.e. the router in question will
> > be the router for the DMZ servers.  I was thinking that your firewall
> >was going to be a firewalling router that would handle your LAN and DMZ
> networks.  However now I do not think that this is the case.
>=20
> Actually, it is the case :(.  I _do_want_ a firewalling router to handle
> my LAN and DMZ networks.  I want it to protect both LAN and DMZ so that I
> can manage rules from one location rather than several of the boxen.
>=20
> >
> > Ok, I have a feeling that when you were typeing xx.xx.xx.182 you were
> >really meaning to type xx.xx.xx.192.  Key shift, that's fine.  But that
> does go to explain the interesting IPs.  No harm no foul.  :)  I think we
> are on the same page of the same book now.
>=20
> regarding IP's, yes
>=20
> >
> >>>Are the IPs in question in a subnet or just a scattering of them?
> >> subnet...
> >
> > This is becoming more and more apparent all the time.  This is part of
> >the
> > problem which leads to what I think will be the ultimate solution.  (Se=
e
> >below)
> >
> >> my firewall has 3 NIC's.  one connected to the router (well the VLAN
> >>switch) which has an IP of 194.  the router is 193.  the dmz nic
> (eth2) is
> >> 195, the LAN is, well the LAN.  On my DMZ, I plan to provide static
> >>address which are globally routable and from my subnet.
> >
> > *nod*  I think I see where you are going with this and I'm going to
> >propose a wild change to accommodate what you are wanting to do.  (See
> below)  (I know I keep saying that but it is a doosey.)
> >
> >> Sorry if I'm not making any sense... haven't had much sleep...
> >
> > Actually you are making more sense now than you have been all along.  N=
o
> >offense intended.  You have just explained that what you are wanting to
> do
> > can not be done with routing.
>=20
> no offense taken, but I hope I continue to make sense.
>=20
> >
> >> I've been trying a few rules here and there trying to get something to
> >>work... but to no avail.
> >
> > *nod*  I think I know why.  Let me try to explain.
> >
> > (this is below) (yes we finally made it)
> >
> > I think what you are wanting to do can not be done with traditional OSI
> >Layer 3 routing but rather needs to be done with OSI Layer 2 bridging /
> switching.  If I understand what you are wanting correctly to be the
> following:
>=20
> Ok, last night, after I slapped myself, I decided to check the logs, and
> actually start logging... I should have been logging since the beginning,
> perhaps it would have helped me explain my problem better.  I added the
> following rules at the very top
>=20
> iptables -A INPUT -i $WAN_ETH -j LOG
> iptables -A OUTPUT -o $WAN_ETH -j LOG
> iptables -A FORWARD -i $WAN_ETH -j LOG
>=20
> Anyway, back to the point, I started to realize that perhaps my issue is
> not with how I wrote my tables/rules, but with routing (you're mention of
> OSI Layer 2 perhaps).  Last night it made more sense to me when I realize=
d
> that nothing was being logged on the interface connected to the
> router/VLAN switch when attempting to connect to 196 (which is connected
> to a switch "behind" the firewall).  I realized, hey, this seems to be a
> routing issue...I now see I need to find a way to have 194 (or the
> firewall's $WAN_ETH) route traffic for the rest of the subnet (except for
> 193 which is the router itself from the inside).
>=20
> Now this is a wild guess, but I'm starting to think that I need to change
> the router's routing rules.  But then again, I don't want to be someone
> who remodels a bedroom just to add a new light switch.
>=20
> >
> > 1)  You want your router to be the router for all your systems behind i=
t
> (LAN is the exception) no matter where they are physically connected to.
>=20
> I think I want my firewall to be the one to route for what is protected b=
y
> it, namely the LAN and DMZ because I want everything to be checked by the
> rules of the firewall (which I see can be done using bridging now, but
> still not sure if that's what I want).  I'm starting to think that I have
> just opened up a can of gusanos
>=20
> 2)  You want the same subnet xx.xx.xx.192/28 to be on both sides of your
> firewall (eth1 and eth2).
>=20
> With the exception of the firewall's internal address, 193, I would like
> to have the xx.xx.xx.192/28 subnet reachable behind my firewall only
>=20
> > 3)  You want your LAN to appear to come from one of the IPs in your DMZ=
.
>=20
> not the DMZ but the address of my firewall.  I have this part working as
> noted by http://www.whatismyaddress.com.  I have a rule which does SNATin=
g
> on anything coming from my LAN interface and on the 192.168.0/28 network.
>=20
> 4)  You want to prevent any of the other systems in the DMZ from getting
> to them directly.
>=20
> Yes.
>=20
> > If this is indeed the case what I propose you do is create a bridge on
> your firewall and use EBTables to do most of your firewalling for your DM=
Z
> > systems except for the LAN.  This would allow your systems in the DMZ t=
o
> be on the same subnet as the router's internal interface and talk as if
> they were on the same physical LAN.  However as you will be passing the
> traffic through a Linux bridge you will be able to do some basic
> firewalling on them, namely protocol, source / destination IP, as well as
> > source / destination port.  EBTables does not do much beyond that for
> filtering but I think that is about all that you are wanting your
> firewall
> > to do.  You ultimately would use IPTables to handle the 2nd level of
> firewalling (beyond EBTables) for your LAN which will allow you to do mor=
e
> > advanced things like connection tracking and Stateful Packet Inspection
> (SPI).
> >
> > Below is a (very) rough draft of the config / startup scripts that I
> would
> > write to make this happen.  You will not really need an IP for eth1 or
> eth2 in this model of firewalling.  I think you will see why below.
> >
> > eth0 =3D LAN
> > eth1 =3D Router
> > eth2 =3D DMZ
> >
> > # We have to bring up the ether interfaces before we can set up the
> bridge.
> > ifconfig eth1 0.0.0.0 up
> > ifconfig eth2 0.0.0.0 up
> >
> > # Let's establish the bridge first and then we will worry about the
> IPTables firewalling.
> > brctl addbr bri0
> > sleep 1 # Prevent race conditions in the kernel.
> > brctl addif bri0 eth1
> > sleep 1
> > brctl addif bri0 eth2
> >
> > # You will need to pick an IP to assign to your bri0 interface for the
> LAN
> > to use to communicate with the world.
> > # Here are the IP assignments that I'm going to use for the sake of the
> discussion, all of which are in the DMZ.
> > #   Network =3D xx.xx.xx.192/28
> > #    Router =3D xx.xx.xx.193/28
> > #  LAN bri0 =3D xx.xx.xx.194/28
> > # DMZ boxen =3D xx.xx.xx.195-206/28
> > # Broadcast =3D xx.xx.xx.207/28
> >
> > # Let's assign an IP to the bri0 interface to be the ""external
> interface
> > of your pseudo LAN router.
> > ifconfig bri0 xx.xx.xx.194 netmask 255.255.255.240 broadcast
> xx.xx.xx.207
> > up
> >
> > # You will need to have an IP subnet for your LAN.  I'm going to assume
> aa.bb.cc.dd/24.
> > #   Network =3D aa.bb.cc.0/24
> > #    Router =3D aa.bb.cc.1/24
> > #   Clients =3D aa.bb.cc.2-254/24
> > # Broadcast =3D aa.bb.cc.255/24
> >
> > # Let's assing an IP to the eth0 interface
> > ifconfig eth0 aa.bb.cc.1 netmask 255.255.255.0 broadcast aa.bb.cc.255 u=
p
> >
> > At this point we have a logical switched (bridged) network that include=
s
> the router (xx.xx.xx.193), your pseudo LAN router (xx.xx.xx.194) as well
> as all your DMZ systems (xx.xx.xx.195-206).  The logical router is going
> to use the bri0 interface to connect to the DMZ network so it can easily
> communicate with the world via the router or to the other DMZ servers.
> >
> > So now we start setting up the various levels of firewalling.  To do
> this
> > on the OSI Layer 2 we will use EBTables.  We will use IPTables for the
> OSI
> > Layer 3 firewalling as you would expect.
> >
> > # First let's do some basic source / destination IP validation.  See RF=
C
> 3330 (http://www.rfc-editor.org/rfc/rfc3330.txt) for more information. #
> Let's validate inbound source IPs by weeding out known bad source IPs.
> ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 0.0.0.0/8 -j DROP
> ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 10.0.0.0/8 -j DROP
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 127.0.0.0/8 -j
> DROP
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 169.254.0.0/12 -=
j
> DROP
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 172.16.0.0/16 -j
> DROP
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 192.0.2.0/24 -j
> DROP
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 192.168.0.0/16 -=
j
> DROP
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src
> 255.255.255.255/32
> > -j DROP
> >
> > # Let's make sure that the traffic is acctually to our network.
> > ebtables -t filter -A FORWARD -i eth1 -p ipvr --ip-dst ! xx.xx.xx.192/2=
8
> -j DROP
> >
> > # Let's validate outbound destination IPs by weeding out known bad
> destination IPs.
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 0.0.0.0/8 -j DRO=
P
> ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 10.0.0.0/8 -j DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 127.0.0.0/8 -j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 169.254.0.0/12 -=
j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 172.16.0.0/16 -j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 192.0.2.0/24 -j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 192.168.0.0/16 -=
j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst
> 255.255.255.255/32
> > -j DROP
> >
> > # For paranoia sake let's make sure that we are not sending any bad
> source
> > IPs too.
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 0.0.0.0/8 -j DRO=
P
> ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 10.0.0.0/8 -j DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 127.0.0.0/8 -j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 169.254.0.0/12 -=
j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 172.16.0.0/16 -j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 192.0.2.0/24 -j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 192.168.0.0/16 -=
j
> DROP
> > ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src
> 255.255.255.255/32
> > -j DROP
> >
> > # If the traffic has made it this far we can be fairly confident that
> the
> > source and or destination IPs are reasonable.
>=20
> thanks, in my complete script I had something similar, but did not includ=
e
> 127.0.0.0 or 169.0.0.0.  Thanks for the link to the RFC
>=20
> > # If you want to do some additional filtering for a particular host you
> would do it as such:
> >
> > # Host 195 is a web server only and thus will not answer DNS or SMTP
> traffic.
> > ebtables -t filter -N HOST195
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-dst xx.xx.xx.195 -j
> HOST195
> > ebtables -t filter -A HOST195 -i eth1 -p ipv4 --ip-proto tcp --ip-dport
> 25
> > -j DROP
> > ebtables -t filter -A HOST195 -i eth1 -p ipv4 --ip-proto udp --ip-dport
> 53
> > -j DROP
> > ebtables -t filter -A HOST195 -i eth1 -p ipv4 --ip-proto tcp --ip-dport
> 53
> > -j DROP
> >
> > # Host 196 could be DNS ONLY and will not have ANY other traffic AT all=
,
> well save SSH of course.
> > ebtables -t filter -N HOST196
> > ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-dst xx.xx.xx.196 -j
> HOST196
> > ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto tcp --ip-dport
> 22
> > -j ACCEPT
> > ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto udp --ip-dport
> 53
> > -j ACCEPT
> > ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto tcp --ip-dport
> 53
> > -j ACCEPT
> > ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto icmp -j ACCEPT
> ebtables -t filter -A HOST196 -i eth1 -j DROP
> >
> > # I think you get the idea.
> >
> > Now we can be fairly confident that the basic OSI Layer 2 firewalling
> will
> > make sure that nothing blatantly stupid is going on.  Thus we are left
> with the OSI Layer 3 firewalling for the LAN.
> >
> > # Let's set up some sensible defaults.
> > iptables -t filter -P INPUT DROP
> > iptables -t filter -P FORWARD DROP
> > iptables -t filter -P OUTPUT ACCEPT
> >
> > # Let's enable basic forwarding.
> > iptables -t filter -A FORWARD -i bri0 -o eth0 -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> > iptables -t filter -A FORWARD -i eth0 -o bri0 -j ACCEPT
> >
> > # Let's set up the SNATing for our outbound LAN traffic.
> > iptables -t nat -A POSTROUTING -o bri0 -j SNAT --to-source xx.xx.xx.194
> >
> > # I'd like to be able to RDP to the office 2k3 server (accounting has a
> Windows only program!)
> > iptables -t nat -A PREROUTING -i bri0 -p tcp --dport 3389 -j DNAT
> --to-destination aa.bb.cc.2
> > iptables -t filter -A FORWARD -i bri0 -o eth0 -p tcp -d aa.bb.cc.2
> --dport
> > 3389 -j ACCEPT
> >
> > I think this will take care of most of the firewalling on both OSI
> Layers
> > 2 and 3 like I think you are needing.  I know that this is a rather
> >lengthy email, but what you are asking is not a simple thing to solve.=
=20
> >Fortunately Linux should be very capable of providing for you.  Once you
> >realize that what (I think) you are trying to do can not be done on OSI
> >Layer 3 you will see why you could not find a solution with all the
> various >things you / we have tried / proposed to do.
> >
>=20
> Ok, hopefully I'm a little more clear now, i.e. I want a firewalling
> router for the subnet xx.xx.xx.192/28.  Initially, my plan was to do this=
:
>=20
> 1. Connect eth1 to the Router directly
> 2. eth0 would be the LAN and network 192.168.0/24
> 3. eth2 would ethe DMZ and network 10.x.x.x or 192.168.1/24
> 4. DNAT DMZ IP to the DMZ network like so
>=20
> iptables -t nat -A PREROUTING -i $WAN_ETH -d $EXT_STAGING_HTTP_IP -j DNAT
> --to-routing $INT_STAGING_HTTP_IP
> iptables -t filter -A FORWARD etc..etc..
>=20
> (you also mentioned this earlier)
>=20
> But then I thought to myself, "Why don't I just assign the actual IP to
> the DMZ server?" and thus my journey began.
>=20
> I'm now at the point where I really think it's a routing issue... agree o=
f
> disagree?  My other option is to give up and say, also in a loud sinister
> voice, "Rat's foiled again", but then realized and said in a loud siniste=
r
> voice : Never!!!
>=20
> Or... do I look into bridging.  I have come across this as a possible
> scenario before, but thought that perhaps it's not "exactly" what I'm
> looking for.
>=20
>=20
> > Any way, chew on this and (please) let me know what you think.
>=20
> Impressed and thankful.  Also, I think this will make for good reading
> when someone searches the archives.
>=20
>=20
>=20
>=20
>=20
> ------------------------------
>=20
> Message: 5
> Date: Fri, 19 Aug 2005 17:33:37 -0500
> From: "Taylor, Grant" <gtaylor@riverviewtech.net>
> Subject: Re: Forward to DMZ addresses
> To: netfilter <netfilter@lists.netfilter.org>
> Message-ID: <43065E41.7080407@riverviewtech.net>
> Content-Type: text/plain; charset=3DISO-8859-1
>=20
> Jonathan Villa wrote:
> > First, grrr.... I just wrote a nice lengthy reply but my webmail sessio=
n
> > timed out and I lost it...let's see if I can remember everything I wrot=
e
>=20
> Been there done that.
>=20
> > Actually, it is the case :(.  I _do_want_ a firewalling router to handl=
e
> > my LAN and DMZ networks.  I want it to protect both LAN and DMZ so that=
 I
> > can manage rules from one location rather than several of the boxen.
>=20
> *nod*  This makes sense.
>=20
> > no offense taken, but I hope I continue to make sense.
>=20
> As don't we all?
>=20
> > Anyway, back to the point, I started to realize that perhaps my issue i=
s
> > not with how I wrote my tables/rules, but with routing (you're mention =
of
> > OSI Layer 2 perhaps).  Last night it made more sense to me when I
> realized
> > that nothing was being logged on the interface connected to the
> > router/VLAN switch when attempting to connect to 196 (which is connecte=
d
> > to a switch "behind" the firewall).  I realized, hey, this seems to be =
a
> > routing issue...I now see I need to find a way to have 194 (or the
> > firewall's $WAN_ETH) route traffic for the rest of the subnet (except f=
or
> > 193 which is the router itself from the inside).
>=20
> If you try to put the xx.xx.xx.192/28 network behind your firewalling rou=
ter
> except for the one of the IPs you are breaking routing and needing to
> bridging again.
>=20
> > Now this is a wild guess, but I'm starting to think that I need to chan=
ge
> > the router's routing rules.  But then again, I don't want to be someone
> > who remodels a bedroom just to add a new light switch.
>=20
> I don't think that completely redoing your routing table will gain you
> much.
>=20
> > I think I want my firewall to be the one to route for what is protected
> by
> > it, namely the LAN and DMZ because I want everything to be checked by t=
he
> > rules of the firewall (which I see can be done using bridging now, but
> > still not sure if that's what I want).  I'm starting to think that I ha=
ve
> > just opened up a can of gusanos
>=20
> *nod*  This makes more sense but poses a different problem.  To have the
> xx.xx.xx.192/28 network behind your firewalling router you will need an I=
P
> network connecting your (edge) router to your firewalling router.  You co=
uld
> use any private class IP for this little network if you wanted to.  But i=
t
> is considered bad form use any private IPs any where at all on the intern=
et
> even if it is to connect two routers via a cross over cable.
>=20
> > With the exception of the firewall's internal address, 193, I would lik=
e
> > to have the xx.xx.xx.192/28 subnet reachable behind my firewall only
>=20
> *nod*
>=20
> > not the DMZ but the address of my firewall.  I have this part working a=
s
> > noted by http://www.whatismyaddress.com.  I have a rule which does
> SNATing
> > on anything coming from my LAN interface and on the 192.168.0/28 networ=
k.
>=20
> *nod*  I was meaning to say that your LAN traffic would appear to the wor=
ld
> as having been SNATed to an IP address in your xx.xx.xx.192/28 network.
>=20
> > thanks, in my complete script I had something similar, but did not
> include
> > 127.0.0.0 or 169.0.0.0.  Thanks for the link to the RFC
>=20
> You are welcome.  No problem.
>=20
> > Ok, hopefully I'm a little more clear now, i.e. I want a firewalling
> > router for the subnet xx.xx.xx.192/28.  Initially, my plan was to do
> this:
> >=20
> > 1. Connect eth1 to the Router directly
> > 2. eth0 would be the LAN and network 192.168.0/24
> > 3. eth2 would ethe DMZ and network 10.x.x.x or 192.168.1/24
> > 4. DNAT DMZ IP to the DMZ network like so
> >=20
> > iptables -t nat -A PREROUTING -i $WAN_ETH -d $EXT_STAGING_HTTP_IP -j DN=
AT
> > --to-routing $INT_STAGING_HTTP_IP
> > iptables -t filter -A FORWARD etc..etc..
>=20
> IMHO this will work but it is more of a nasty hack.  This also leads to t=
he
> possibility of things breaking down the road.  Consider running a service=
 on
> one of the DMZ hosts that is not NAT friendly.  What will you do in that
> case?  If you can avoid this I think it would be very wise to do so.
>=20
> > But then I thought to myself, "Why don't I just assign the actual IP to
> > the DMZ server?" and thus my journey began.
>=20
> *nod*  I often have such conversations with my self.  I love it when I wi=
n
> them and HATE it when I loose.
>=20
> > I'm now at the point where I really think it's a routing issue... agree
> of
> > disagree?  My other option is to give up and say, also in a loud sinist=
er
> > voice, "Rat's foiled again", but then realized and said in a loud
> sinister
> > voice : Never!!!
>=20
> Yes I agree hole heartedly.  Don't give up.
>=20
> > Or... do I look into bridging.  I have come across this as a possible
> > scenario before, but thought that perhaps it's not "exactly" what I'm
> > looking for.
>=20
> What "exactly" are you looking for?  I don't see a solution with out doin=
g
> some REALLY funky stuff in such as playing with IPs and / or adding a 4th
> NIC to the box so that the new interface can be connected to the DMZ netw=
ork
> and give it an IP to use as the router for your LAN.  Then you will need =
to
> do some really funky routing tables such as making the system act like tw=
o
> completely independent routers that know nothing about the other unless y=
our
> traffic comes in or goes a specific pair of interfaces.
>=20
> > Impressed and thankful.  Also, I think this will make for good reading
> > when someone searches the archives.
>=20
> Thank you very much.  I have seen some very interesting questions come
> across this mail list in the past most of which did not really have any g=
ood
> documentation (that I'm aware of) on ways to solve them.  I'm tempted to
> write some How To type documentation and submit it to someone else to hos=
t,
> possibly / probably the LARTC project (www.lartc.org).
>=20
>=20
>=20
> Grant. . . .
>=20
>=20
>=20
> ------------------------------
>=20
> _______________________________________________
> netfilter mailing list
> netfilter@lists.netfilter.org
> https://lists.netfilter.org/mailman/listinfo/netfilter
>=20
>=20
> End of netfilter Digest, Vol 13, Issue 41
> *****************************************
>

