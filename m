From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iproute2 nat and bad conntrack entries
Date: Tue, 23 Dec 2003 20:34:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072229649.2149.44.camel@jasiiitosh.nexusmgmt.com>
References: <1072222851.2147.30.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072222851.2147.30.camel@jasiiitosh.nexusmgmt.com>
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
To: netfilter@lists.netfilter.org
Cc: "@All Security SDT" <allsecuritypst@nexusmgmt.com>, "@All Network SDT" <networkpst@nexusmgmt.com>

On Tue, 2003-12-23 at 18:40, John A. Sullivan III wrote:
> 	I'm noticing bizarre behavior when using fast NAT with iproute2 and
> connection tracking in netfilter.  Although I see the packets traversing
> the chains with the translated address, the entries in the conntrack
> table use the untranslated address and thus do not recognize the reply
> packets.  Has anyone else seen this? What is the fix? Have I
> mis-configured something? 
> 
> Here are the details:
> 
> 	The ISCS project (http://iscs.sourceforge.net) is developing a
> management console for iptables + FreeS/WAN + iproute2 + DHCP, etc - an
> enterprise class secure communications system to rival the Checkpoints
> and Ciscos of the world.  We are working on the NAT modules right now
> and would like to build in a way to handle conflicting address space
> without having to use a separate NAT device.  We thought we had it done
> until we discovered the above mentioned problem.
> 
> 	We must alter the source address before the routing decision is made
> since, if it is destined for the VPN, the routing decision will send it
> to be placed in an IPSec packet.  If we alter the address after it has
> been authenticated, it will fail authentication on the receiving end. 
> Otherwise we would gladly us the netfilter SNAT and DNAT targets to
> enable connection tracking of the NATted sessions.
> 
> 	Thus we turned to iproute2 which appears to change both source and
> destination addresses before a routing decision is made.  It all seemed
> to work wonderfully.  We saw the address changed on the local gateway
> and handed off the the IPSec stack.  We saw the packets arrive on the
> remote network without being rejected for failed authentication and the
> replies coming back.  The replies made it back to the local gateway, we
> successfully decrypted but were lost just before being put back onto the
> wire to return to the originating station.
> 
> 	We spent hours tracking the packets through every step of the journey. 
> Here's what we found:
> 
> The "DNAT" rule is properly in the local route table:
> ip route add nat 192.168.140.0/24 via 192.168.111.0
> 
> The "SNAT" rule appears properly in place:
> ip rule add from 192.168.111.0/24 nat 192.168.140.0
> 
> Through a combination of logging and dropping we saw the outbound
> packets (the first packet coming from the originating computer at
> 192.168.111.8) passing through the mangle and nat tables.  It finally
> came to a rule that says:
> iptables -A ACCESS_GROUPS -s 192.168.140.0/24 -j Nex/HD
> Nex/HD has a rule which says:
> iptables -A Nex/HD -j NexDat/NexHDDat
> and NexDat/NexHDDat has a rule which says:
> iptables -A NexDat/NexHDDat -d 10.1.1.0/24 -p 1 --icmp-type 8 -m state
> --state NEW -j ACCEPT
> 
> As soon as it is accepted, we see the following in
> /proc/net/ip_conntrack:
> icmp     1 27 src=192.168.111.8 dst=10.1.1.1 type=8 code=0 id=38686
> [UNREPLIED] src=10.1.1.1 dst=192.168.111.8 type=0 code=0 id=38686 use=1
> 
> What shocks us is that the LOGs clearly show the source address of the
> packet as 192.168.140.8 when it hits this rule and the entry is not made
> until it hits this rule (we suspected that it must have been made before
> the iproute changed the address but it does not appear so).  How can
> this possibly be????!!!!! How do we fix it?  Thanks all - John

I should clarify the above just a bit.  The problem with SNAT is not
really that the packet will fail authentication (that is the stock
answer) but rather the packet that eventually makes it to the
POSTROUTING chain is the already encapsulated ipsec packet and it does
not have the source address of the sending station.  Thus, we must NAT
before encapsulation and thus before the POSTROUTING chain.

We are now working although we still do not understand the above
behavior and have not fixed it.  However, the resolution has brought to
light more strange behavior.  To limit the number of rules on a device
and to reduce the amount of unnecessary WAN traffic, we use something
called a VPN allow.  The sending gateway is responsible for
authenticating the user and granting access to the tunnel.  The
receiving gateway assumes that the sending gateway has done its job.

There is thus a rule deep in the chains that states:

iptables -A VPN_ALLOW -i ipsec+ -m state --state NEW -j ACCEPT

We assumed that even though the packets mentioned in the first e-mail
did not match state because of the incorrect address entry, they would
still be allowed by this rule because they were coming in on an ipsec
interface and did not match anything in the state table.

Well, they didn't match NEW; they matched INVALID (which leads one to
the question of what's the difference other than that NEW can refer to a
session that has only seen traffic in one direction).

Now for the real surprise.  If we use -m conntrack ---ctstate NEW
instead of the older state match, IT WORKS!!! Can anyone tell us why and
if this is a good thing or a bad thing? Thanks - John

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


