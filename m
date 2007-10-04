From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 14:33:44 -0500
Message-ID: <47054018.3090809@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org>	 <1191507779.13379.50.camel@localhost.localdomain>	 <4704FFD6.8050304@plouf.fr.eu.org> <1191510830.13379.73.camel@localhost.localdomain> <470506E5.6030605@riverviewtech.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470506E5.6030605@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/04/07 10:29, Grant Taylor wrote:
> Do you need to even change the destination IP if you can somehow get the 
> traffic over to the mail server?  I'm still thinking bridging and 
> EBTables.  I'll think about this and get back to you with a proposed 
> solution.

After some food and some thought, I am convinced that this can be done 
with bridging and EBTables.

For the sake of conversation I'm going to assume that the NATing host 
has or can have access to both VLANs.  Let vlan0 be the vlan of the 
router and NATing host and let vlan1 be the vlan of the real host that 
you want to redirect the traffic to.

  - Create a bridge bridge 'bri0' that has vlan0 and vlan1 as ports in it.
  - Assign the NATing hosts IP address(s) to the bri0 interface.
  - Create an EBTables rule in the BROUTING chain of the broute table 
that looks for the following conditions:
     - Proper ethernet protocol - IP
     - Proper IP protocol - TCP and / or UDP
     - Proper destination port
  - Have said EBTables rule DNAT the traffic to the MAC address of the 
real host that you want to redirect the traffic to.
  - Have the IP address bound to an interface on the real host that you 
want to redirect the traffic to.
  - Create a second EBTables rule in the BROUTING chain of the broute 
table that causes all other traffic to be routed like normal.

This will cause the NATing system to handle normal traffic while 
redirecting the traffic to the real host on the MAC layer (2).  Thus the 
real host will receive the traffic in with the proper destination IP, 
which it will know how to use.  Thus the real host will have the IP in 
question thus allowing traffic to originate from said IP back to the 
original client with the proper source IP.

Heck, if you wanted to you could even do this before the traffic gets to 
the NATing host.  This way, you don't even have to have any thing 
special on the NATing host.  Thus both your NATing host and real host 
could be any OS with an IP stack that you want them to be.  The Linux 
bridge with EBTables could take care of this before the traffic reaches 
any system.  (More on this later.)

Note:  Some people would rather assign IP addresses to the physical 
bridge port, but I prefer to use the logical bridge interface.  It 
really is up to you.



Grant. . . .
