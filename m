From: Fisher Alex <Alex.Fisher@uk.thalesgroup.com>
Subject: Re: Is this possible?
Date: Mon, 26 Apr 2004 11:03:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408CDE5C.5000600@uk.thalesgroup.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Cc: netfilter@lists.netfilter.org

T. Horsnell (tsh) wrote:
>>Hi.
>>
>>I'll do my best to explain what I'm trying to acheive with a linux box 
>>and 3 NICS.
>>
>>I have two sets of systems.  Each system has about 30 IP addresses 
>>spread across various bits of hardware.  The two systems are identical 
>>(ie have the same 30 IP addresses).  The addresses are all part of the 
>>class C subnet 192.168.0.*
>>
>>The IP addresses for each system are now set in stone and can't be 
>>changed.  Furthermore, similar addresses are already in use on our
network.
>>
>>I've been given a set of IP addresses I CAN use (172.26.158.*)
>>
>>A diagram might help here ...
>>
>>  -----------        -----------------
>>  - System1 ---------|eth1            |
>>  -----------        |                |
>>                     |  Linux Router  |
>>                     |            eth0|------------Rest of the network
>>                     |                |
>>  -----------        |                |
>>  - System2 ---------|eth2            |
>>  -----------        ------------------
>>
>>I also have an address I can use for eth0 which will make the router 
>>visible from machines on the rest of the network.  This can be set as 
>>the default gateway for connections to the 172.26.158.* subnet.
>>
>>I would like PCs on the normal network to be able to connect with either 
>>system by addressing them with addresses off the 172.26.158 subnet. 
>>I'll assign 30 of these IPs to each system.
>>
>>For example. 172.26.158.10 might be mapped onto 192.168.0.2 on eth1
>>whilst  172.26.158.50 might be mapped onto 192.168.0.2 on eth2
>>
> 
> 
> I've always regarded netfilter as a symmetric thing, so is it possible to 
> 
> 1. apply a set of S/DNAT rules specifically to
>    eth1 to map system1's 192 addresses to something else, 
> 2. add a route to enable these new addresses to reach eth0
> 3. add appropriate rules to the FORWARD chain for those NAT'd addresses
>    if required
> 4. add a suitable set of S/DNAT rules specifically for eth0
>    to S/DNAT those new addresses to a unique subset of 172 addresses
> 5. Do the same stuff for eth2 but 1. would not be necessary
> 
> 
> Cheers,
> Terry.

Thanks for your help here.  Whilst it differs from what other people 
have suggested, what you've said seems to make good sense.  Some 
examples would really help me out.  For instance, is it just DNAT I'm 
doing in 1 and 4 or do I also need to use SNAT?  I take it that 3. is 
optional and only required if I require extra filtering/firewalling.

How does this look?

iptables -t nat -A PREROUTING -d 192.168.152.2 -o eth1 DNAT --to 
193.168.152.2

ip route add 193.168.152.0/24 dev eth1

iptables -t nat -A PREROUTING -d 172.26.158.2 -o eth0 DNAT --to 
193.168.152.2

ip route add 192.168.152.0/24 dev eth2

iptables -t nat -A PREROUTING -d 172.26.158.130 -o eth0 DNAT --to 
192.168.152.2

ip route add default dev eth0 via 192.168.152.1

Thanks,
Alex
This email and any attachments are confidential to the intended recipient
and may also be privileged. If you are not the intended recipient please
delete it from your system and notify Thales Underwater Systems on +44 1963
370 551. You should not copy it or use it for any purpose nor disclose or
distribute its contents to any other person.

