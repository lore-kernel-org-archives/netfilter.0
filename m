From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT rule
Date: Wed, 16 Jul 2008 12:18:04 -0500
Message-ID: <487E2D4C.5000506@riverviewtech.net>
References: <487E1DF3.1090203@hoecoop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <487E1DF3.1090203@hoecoop.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/16/08 11:12, Michael Crider wrote:
> I am attempting to set up a LAN-to-LAN VPN using ipsec-tools for one of 
> our vendors to access a server behind our firewall. However, the local 
> IP address of the server (192.168.10.xx) conflicts with a local address 
> at the vendor's network. They suggested using NAT to transform the 
> server address to 192.168.101.xx and hooking the VPN to the 
> 192.168.101.0/24 network. I would like to run the VPN on the same 
> machine with the firewall (which uses netfilter 1.3.5-4 on CentOS 5.2).  
> We need to be able to initiate a connection from either end of the VPN. 
> Could anybody recommend iptables rules that would set up the address 
> translation?

This really sounds like an IP address conflict between your side of the 
VPN and the vendors side of the VPN.  Presuming that this is indeed the 
case you will need to address this issue before you try to do the VPN or 
things will get very harry.

Based on the statement "... They suggested using NAT to transform the 
server address to 192.168.101.xx and hooking the VPN to the 
192.168.101.0/24 network. ..." it sounds like they are encouraging you 
to add a second subnet (192.168.101.x/24) and having them access it. 
That way they will VPN from what ever subnet they have to your new 
192.168.101.x/24 subnet where they will connect to the server.

If this is indeed the case, you could easily add the additional subnet 
to your configuration as an alias.  That way all that needs to be done 
is to set up the VPN from their office / subnet to your office / new 
subnet.  NATing would not even need to be involved.  If this will 
fulfill their needs this is actually quite simple to do.  Add a new 
subnet to an alias on the server in question and to the VPN router the 
server uses as its gateway.  On the server you would need to add a route 
to the remote network via the new 192.168.101.x/24 address of the 
router.  This will ensure that the server will continue using your 
existing default gateway's IP address to get to the general internet.

In short, add a new IP to two pieces of equipment, set up the VPN, and 
add a single route statement to the target server and you are done.



Grant. . . .
