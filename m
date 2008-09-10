From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Wed, 10 Sep 2008 15:34:00 -0500
Message-ID: <48C82F38.3070400@riverviewtech.net>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>    <48C6EF5B.3030005@riverviewtech.net>    <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>    <48C7D68C.2070902@riverviewtech.net> <a101ab37cddb703b5cb3cc863b96b846.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a101ab37cddb703b5cb3cc863b96b846.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/10/08 14:13, ArcosCom Linux User wrote:
> Thanks for the response, I'll answer the questions below:

You are welcome.

> Because I cant have another uplink in the router place and I need to 
> put that in another building that can have another uplink.

Ok... Let me see if I (now) understand you right.  You have your router 
in question along with uplinks 1 and 2 (and their associated modems / 
routers) in one location and uplink 3 (and it's associated modem / 
router) and (part of) the LAN are located in another building?  Further 
you can't make an additional connection between the buildings to connect 
uplink 3 to the router?

> Ah, no, this is not the reason. It's a "logistic" reason only.

*nod*  (Logistics being proximity and / or cabling)

> Yes, that appears to be the problem (seeing tcpdumps in each 
> interface).

*nod*

> Do you have any suggestion about that parameters on that interfaces?

I don't recall the option(s) that need to be set off hand, but I think 
you are looking for the the ARP /proc entries that tell the system to 
only reply to ARP queries if they come in an interface that has an IP in 
the subnet that the query is for.  Thus when you receive ARP queries on 
eth0 and eth3, the system should only reply from eth0 or eth3 depending 
on what IP is being ARPed for (the uplink 3 or LAN IP).

Something else to consider is VLAN trunking across the connection from 
eth0 to the LAN(s).  Heck, you might consider putting all six networks 
on its own VLAN: u1, u2, u3, l1, l2, and l3.  If you trunk across the 
connection between buildings, you can access the uplink modems any where 
you can connect to the VLAN.  I've successfully had a cable modem (that 
was connected to its own VLAN) at the opposite end of a campus from the 
router with out any problems at all.



Grant. . . .



Grant. . . .
