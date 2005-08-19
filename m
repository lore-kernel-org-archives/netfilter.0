From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forward to DMZ addresses
Date: Fri, 19 Aug 2005 01:04:15 -0500
Message-ID: <4305765F.8030600@riverviewtech.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>	<43042660.7090405@riverviewtech.net>	<39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>	<4304E651.1050807@riverviewtech.net>
	<60615.206.166.83.50.1124398805.squirrel@mail.innovativesource.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <60615.206.166.83.50.1124398805.squirrel@mail.innovativesource.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

>   router
>     |
>   VLAN Switch
>     |
>  firewall
>   |    |
>  LAN  DMZ

>>I'm sort of believing that eth1
>>is connected to the router via a cross over cable and yet the router and
>>the DMZ systems are on the same IP subnet, or at least it appears that way
>>from the IPs that each piece of equipment has.

> Yes, they are on the same subnect.  Not sure if it's a cross over cable.

Ok, if I am reading you correctly now, your router's internal interface that is connected to the VLAN switch has an IP that is on the same subnet as the servers that will be in the DMZ.  I.e. the router in question will be the router for the DMZ servers.  I was thinking that your firewall was going to be a firewalling router that would handle your LAN and DMZ networks.  However now I do not think that this is the case.

> I changed my IP's a little :) ...I do have a block of 16.  The actual
> broadcast is 207 and the network is 192. or at least that I have for
> ifcfg-eth0 - (NETWORK=xx.xx.xx.192)

Ok, I have a feeling that when you were typeing xx.xx.xx.182 you were really meaning to type xx.xx.xx.192.  Key shift, that's fine.  But that does go to explain the interesting IPs.  No harm no foul.  :)  I think we are on the same page of the same book now.

>>Are the IPs in question in a subnet or just a scattering of them?
> 
> subnet...

This is becoming more and more apparent all the time.  This is part of the problem which leads to what I think will be the ultimate solution.  (See below)

> my firewall has 3 NIC's.  one connected to the router (well the VLAN
> switch) which has an IP of 194.  the router is 193.  the dmz nic (eth2) is
> 195, the LAN is, well the LAN.  On my DMZ, I plan to provide static
> address which are globally routable and from my subnet.

*nod*  I think I see where you are going with this and I'm going to propose a wild change to accommodate what you are wanting to do.  (See below)  (I know I keep saying that but it is a doosey.)

> Sorry if I'm not making any sense... haven't had much sleep...

Actually you are making more sense now than you have been all along.  No offense intended.  You have just explained that what you are wanting to do can not be done with routing.

> I've been trying a few rules here and there trying to get something to
> work... but to no avail.

*nod*  I think I know why.  Let me try to explain.

(this is below) (yes we finally made it)

I think what you are wanting to do can not be done with traditional OSI Layer 3 routing but rather needs to be done with OSI Layer 2 bridging / switching.  If I understand what you are wanting correctly to be the following:

1)  You want your router to be the router for all your systems behind it (LAN is the exception) no matter where they are physically connected to.
2)  You want the same subnet xx.xx.xx.192/28 to be on both sides of your firewall (eth1 and eth2).
3)  You want your LAN to appear to come from one of the IPs in your DMZ.
4)  You want to prevent any of the other systems in the DMZ from getting to them directly.

If this is indeed the case what I propose you do is create a bridge on your firewall and use EBTables to do most of your firewalling for your DMZ systems except for the LAN.  This would allow your systems in the DMZ to be on the same subnet as the router's internal interface and talk as if they were on the same physical LAN.  However as you will be passing the traffic through a Linux bridge you will be able to do some basic firewalling on them, namely protocol, source / destination IP, as well as source / destination port.  EBTables does not do much beyond that for filtering but I think that is about all that you are wanting your firewall to do.  You ultimately would use IPTables to handle the 2nd level of firewalling (beyond EBTables) for your LAN which will allow you to do more advanced things like connection tracking and Stateful Packet Inspection (SPI).

Below is a (very) rough draft of the config / startup scripts that I would write to make this happen.  You will not really need an IP for eth1 or eth2 in this model of firewalling.  I think you will see why below.

eth0 = LAN
eth1 = Router
eth2 = DMZ

# We have to bring up the ether interfaces before we can set up the bridge.
ifconfig eth1 0.0.0.0 up
ifconfig eth2 0.0.0.0 up

# Let's establish the bridge first and then we will worry about the IPTables firewalling.
brctl addbr bri0
sleep 1 # Prevent race conditions in the kernel.
brctl addif bri0 eth1
sleep 1
brctl addif bri0 eth2

# You will need to pick an IP to assign to your bri0 interface for the LAN to use to communicate with the world.
# Here are the IP assignments that I'm going to use for the sake of the discussion, all of which are in the DMZ.
#   Network = xx.xx.xx.192/28
#    Router = xx.xx.xx.193/28
#  LAN bri0 = xx.xx.xx.194/28
# DMZ boxen = xx.xx.xx.195-206/28
# Broadcast = xx.xx.xx.207/28

# Let's assign an IP to the bri0 interface to be the ""external interface of your pseudo LAN router.
ifconfig bri0 xx.xx.xx.194 netmask 255.255.255.240 broadcast xx.xx.xx.207 up

# You will need to have an IP subnet for your LAN.  I'm going to assume aa.bb.cc.dd/24.
#   Network = aa.bb.cc.0/24
#    Router = aa.bb.cc.1/24
#   Clients = aa.bb.cc.2-254/24
# Broadcast = aa.bb.cc.255/24

# Let's assing an IP to the eth0 interface 
ifconfig eth0 aa.bb.cc.1 netmask 255.255.255.0 broadcast aa.bb.cc.255 up

At this point we have a logical switched (bridged) network that includes the router (xx.xx.xx.193), your pseudo LAN router (xx.xx.xx.194) as well as all your DMZ systems (xx.xx.xx.195-206).  The logical router is going to use the bri0 interface to connect to the DMZ network so it can easily communicate with the world via the router or to the other DMZ servers.

So now we start setting up the various levels of firewalling.  To do this on the OSI Layer 2 we will use EBTables.  We will use IPTables for the OSI Layer 3 firewalling as you would expect.

# First let's do some basic source / destination IP validation.  See RFC 3330 (http://www.rfc-editor.org/rfc/rfc3330.txt) for more information.
# Let's validate inbound source IPs by weeding out known bad source IPs.
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 0.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 10.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 127.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 169.254.0.0/12 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 172.16.0.0/16 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 192.0.2.0/24 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 192.168.0.0/16 -j DROP
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-src 255.255.255.255/32 -j DROP

# Let's make sure that the traffic is acctually to our network.
ebtables -t filter -A FORWARD -i eth1 -p ipvr --ip-dst ! xx.xx.xx.192/28 -j DROP

# Let's validate outbound destination IPs by weeding out known bad destination IPs.
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 0.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 10.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 127.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 169.254.0.0/12 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 172.16.0.0/16 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 192.0.2.0/24 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 192.168.0.0/16 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-dst 255.255.255.255/32 -j DROP

# For paranoia sake let's make sure that we are not sending any bad source IPs too.
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 0.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 10.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 127.0.0.0/8 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 169.254.0.0/12 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 172.16.0.0/16 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 192.0.2.0/24 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 192.168.0.0/16 -j DROP
ebtables -t filter -A FORWARD -o eth1 -p ipv4 --ip-src 255.255.255.255/32 -j DROP

# If the traffic has made it this far we can be fairly confident that the source and or destination IPs are reasonable.

# If you want to do some additional filtering for a particular host you would do it as such:

# Host 195 is a web server only and thus will not answer DNS or SMTP traffic.
ebtables -t filter -N HOST195
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-dst xx.xx.xx.195 -j HOST195
ebtables -t filter -A HOST195 -i eth1 -p ipv4 --ip-proto tcp --ip-dport 25 -j DROP
ebtables -t filter -A HOST195 -i eth1 -p ipv4 --ip-proto udp --ip-dport 53 -j DROP
ebtables -t filter -A HOST195 -i eth1 -p ipv4 --ip-proto tcp --ip-dport 53 -j DROP

# Host 196 could be DNS ONLY and will not have ANY other traffic AT all, well save SSH of course.
ebtables -t filter -N HOST196
ebtables -t filter -A FORWARD -i eth1 -p ipv4 --ip-dst xx.xx.xx.196 -j HOST196
ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto tcp --ip-dport 22 -j ACCEPT
ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto udp --ip-dport 53 -j ACCEPT
ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto tcp --ip-dport 53 -j ACCEPT
ebtables -t filter -A HOST196 -i eth1 -p ipv4 --ip-proto icmp -j ACCEPT
ebtables -t filter -A HOST196 -i eth1 -j DROP

# I think you get the idea.

Now we can be fairly confident that the basic OSI Layer 2 firewalling will make sure that nothing blatantly stupid is going on.  Thus we are left with the OSI Layer 3 firewalling for the LAN.

# Let's set up some sensible defaults.
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT ACCEPT

# Let's enable basic forwarding.
iptables -t filter -A FORWARD -i bri0 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o bri0 -j ACCEPT

# Let's set up the SNATing for our outbound LAN traffic.
iptables -t nat -A POSTROUTING -o bri0 -j SNAT --to-source xx.xx.xx.194

# I'd like to be able to RDP to the office 2k3 server (accounting has a Windows only program!)
iptables -t nat -A PREROUTING -i bri0 -p tcp --dport 3389 -j DNAT --to-destination aa.bb.cc.2
iptables -t filter -A FORWARD -i bri0 -o eth0 -p tcp -d aa.bb.cc.2 --dport 3389 -j ACCEPT

I think this will take care of most of the firewalling on both OSI Layers 2 and 3 like I think you are needing.  I know that this is a rather lengthy email, but what you are asking is not a simple thing to solve.  Fortunately Linux should be very capable of providing for you.  Once you realize that what (I think) you are trying to do can not be done on OSI Layer 3 you will see why you could not find a solution with all the various things you / we have tried / proposed to do.

Any way, chew on this and (please) let me know what you think.



Grant. . . .

