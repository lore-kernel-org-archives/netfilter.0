From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Forward to DMZ addresses
Date: Mon, 22 Aug 2005 16:47:36 -0500
Message-ID: <430A47F8.4030601@riverviewtech.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>	<430028A8.3090508@riverviewtech.net>	<22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>	<4302D0F1.8030005@riverviewtech.net>	<19817.206.166.83.50.1124294643.squirrel@mail.innovativesource.net>	<43042660.7090405@riverviewtech.net>	<39173.206.166.83.50.1124389983.squirrel@mail.innovativesource.net>	<4304E651.1050807@riverviewtech.net>	<60615.206.166.83.50.1124398805.squirrel@mail.innovativesource.net>	<4305765F.8030600@riverviewtech.net>	<39244.206.166.83.50.1124477852.squirrel@mail.innovativesource.net>	<43065E41.7080407@riverviewtech.net>	<56203.38.119.239.226.1124559049.squirrel@mail.innovativesource.net>	<4307AC7A.40109@riverviewtech.net>
	<59148.206.166.83.50.1124720747.squirrel@mail.innovativesource.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <59148.206.166.83.50.1124720747.squirrel@mail.innovativesource.net>
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
To: netfilter <netfilter@lists.netfilter.org>

> That would be great!

I'll start thinking about the two virtual routers in one box later on this evening.

>>The question that I do ask you is do you
>>want a fourth physical interface or could it be a logical interface on the
>>network?  If it could be a logical interface that is connected to the
>>other interfaces via a bridge then that may be a bit better.  But this is
>>up for discussion.
> 
> I have one PCI slot left, it's currently being used by a SCSI card which
> I'm not using.  I can replace it with a NIC.  I currently have 2 built-in
> NICS plus one in the first PCI slot.  I logical interface is fine also. 
> It saves me from having to take the machine off of the rack.

*nod*  Not having to take a machine out of it's rack is always a good thing.  Can you (do you mind) repurposeing cables that are presently connected to your router?  The reason that I ask is that it just struck me (sunk in) that you are using a VLAN switch.  Before I was not thinking about the fact that you could use a trunk interface to the VLAN switch and thus reduce the number of cables that you would need to connect to it.  With this in mind I would recommend that you connect your router in to your switch and put the port that you connect it to on one VLAN.  (If you have not already) Configure another VLAN to be for your DMZ hosts and one for your LAN hosts.  With this done you could bond the two NICs that are in your server as one interface to the switch and then use 802.1Q VLAN tagged packets to communicate with each VLAN.  The nice thing about the bonding is that either of the cab
 les connecting your system to the switch could fail and the router would not go down b/c o
f a lack / loss of connection.  As far as interfacing with the VLANs on the Linux router you will end up with an interface something like eth0.1 for VLAN ID 1, eth0.2 for VLAN ID 2, and eth0.3 for VLAN ID 3.  If you do it over a bonded interface you should end up with something like bond0.1, bond0.2, and bond0.3.  This will cause your router to have a logical interface on all of your networks, even new ones that you might add to the switch down the road.

If you do go with bonding and 802.1Q tagged VLAN packets you would end up having the following interface / network layout (based on previous discussion).

Router connected to a port on the switch that is configured to be in VLAN "Router" (VID 11)
LAN connected to ports on the switch that are configured to be in VLAN "LAN" (VID 10)
DMZ connected to ports on the switch that are configured to be in VLAN "DMZ" (VID 12)

(Router xx.xx.xx.193/28)

 eth0		0.0.0.0
 eth1		0.0.0.0
 eth2		0.0.0.0
bond0		0.0.0.0
bond0.10	192.168.1.1
bond0.11	0.0.0.0
bond0.12	0.0.0.0
 bri0	xx.xx.xx.194/28

(DMZ    xx.xx.xx.195-207/28)

This would allow you to grow your system (add / remove (logical VLAN) interfaces) as you saw fit down the road with out needing to take the box out of the rack or put it back in when you are done.  You could easily add a 2nd or 3rd DMZ or any other segregated network with out having to worry about the physical connections to your router, just to the VLAN switch.  Supposing that you wanted to add a 2nd DMZ you would just add a bond0.13 interface and add it to the bri0 bridge and then update your EBTables rules to (dis)allow traffic to flow as you liked.  I will have to play with the bonding later on at home to give you exact examples.

These are just some of the ""fun (complex and enterprise level) things that you can do with Linux if you are willing to grow and combine many not normal ideas.

>  I know I will definitely need some help, but before I ask for, I'll need
> to do some reading up on bridging so at least I understand any examples
> given to me (starting with the previous one you gave).

Ok, I'll be glad to help.



Grant. . . .

