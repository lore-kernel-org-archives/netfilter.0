From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ClusterIP and MAC NAT
Date: Tue, 26 Oct 2010 12:17:22 -0500
Message-ID: <4CC70D22.20109@riverviewtech.net>
References: <1288103438.2727.69.camel@nerino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1288103438.2727.69.camel@nerino>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/26/10 09:30, Michele Codutti wrote:
> In my opinion a possible solution is to use the existing bridge in 
> front of the pool of clustered IP hosts with some ebtable rules that 
> substitute the multicast MAC address with a forged unicast MAC 
> address for the outgoing packets and substitute the forged unicast 
> MAC address with the multicast one for the incoming packets.

This will work.

The only down side that I'm aware of is the possible single point of 
failure that the bridge creates.

Other than that (and possible performance issues if the bridge isn't 
scaled properly) things should work as you want.

> Suppose that the multicast MAC address is: 01:02:03:04:05:06 and the 
> ClusterIP address is: 10.0.0.100 Now I forge a unicast MAC address 
> for the ClusterIP: 00:02:03:04:05:06 So the rule for the incoming 
> packets is (taken from 
> http://ebtables.sourceforge.net/examples/basic.html#ex_nat):

Agreed.

I have an install that is dealing with a cranky switch that can't see 
the same MAC addresses on multiple VLANs where I am doing almost exactly 
this for 30(ish) VLAN interfaces.  It has been in production for five 
years and working great.  (Recently I upgraded the system, carrying the 
old ARPTables / EBTables / IPTables scripts / configs forward.)

> Now the problem is with the arp queries. In need to "NAT" also the 
> queries substituting the mac address also in the payload of the 
> packet not only in the header. Can i do that?

You will need to use ARPTables to help EBTables with the ARP problem.  I 
will go through my backups and see if I can't find an example set of 
rules for you to gander at.

Here's a +1 on what you are wanting to do can be done and does work. 
You just need to look at ARPTables to assist with the ARP specific problem.



Grant. . . .
