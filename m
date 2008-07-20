From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: More ethernet port same ip address
Date: Sun, 20 Jul 2008 18:41:41 -0500
Message-ID: <4883CD35.3060704@riverviewtech.net>
References: <48819901.6030604@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48819901.6030604@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/19/2008 2:34 AM, Michele Petrazzo - Unipex srl wrote:
> I need to setup a linux box with more than one ethernet ports and 
> every one must have the same ip address. I, of course :), already 
> tried to do it with a lot of solutions that linux offer 
> (iptables+mark+ip route, bonding, a vlan every port), but with the 
> same result... Packet come into the right port but go out through the 
> "last" that I have set, so it will never arrive.
> 
> Here the server have the two ports with 172.16.0.1 and two clients, 
> connected into the two others has 172.16.0.3 and 172.16.0.10
> 
> It's there a solution for achieve this?

Like others have said, I think (based on what little you have said) that 
bridging is an appropriate option.  I say "think" because I don't know 
if you are trying to filter what passes between the two sides of the server.

Could you do what you are wanting to do by moving the two ethernet 
cables that connect to the server over to a switch and then run one 
cable from the switch to the server?  If this will work, bridging will 
do exactly the same thing in software.

I'd suggest that your bridge the two interfaces (with out any IPs) and 
bind the 172.16.0.1 IP address to the bridge interface its self.

With regards to the question about choosing which interface the traffic 
will go out, (with out forcing its hand) bridging does the exact same 
thing as a switch would.  When you send a packet to a given destination 
the bridge will send the ethernet frame containing the packet out the 
port that is destination MAC is connected to.  If the port the 
destination MAC is connected to is not known bridging will send the 
frame out all ports until it does know what port it is connected to 
(i.e. the bridge receives a reply thus learning the port).

I say "with out forcing its hand" because there are a lot of things that 
you can do with EBTables and / or IPTables to encourage bridging to do 
what you want if it is not the norm.



Grant. . . .
