From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: IP forwarding with MASQUERADE
Date: Fri, 03 Oct 2008 09:23:15 -0500
Message-ID: <48E62AD3.9060001@riverviewtech.net>
References: <c88e466f0810030507x7e601d09q1034c7cc18be9b57@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c88e466f0810030507x7e601d09q1034c7cc18be9b57@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/03/08 07:07, Michel Benoit wrote:
> The first box (1) is connected to the internet with ppp and thus gets 
> a new dynamic address with every connection.
> The second box (2) is connected to the first box on an 192.168.0.x 
> ethernet network.
> 
> I can ping from (1) to (2) on the 192.168.0.x network.
> I can ping from (2) to (1) on the 192.168.0.x network.
> I can ping from (2) to (1) on the 10.x.x.x network.
> However pinging from (2) to a machine on the internet fails.
> 
> The following log is produced on (1) by netfilter for the unsuccessful ping:
> 
> fwd:IN=eth0 OUT=ppp0 SRC=192.168.0.183 DST=10.0.0.1 LEN=84 TOS=0x00 
> PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3
> msk:IN= OUT=ppp0 SRC=192.168.0.183 DST=10.0.0.1 LEN=84 TOS=0x00 
> PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3613 SE
> in:IN=ppp0 OUT= MAC= SRC=10.0.0.1 DST=10.146.88.212 LEN=84 TOS=0x08 
> PREC=0x80 TTL=57 ID=46016 PROTO=ICMP TYPE=0 CODE=0 ID=36
> 
> It appears that the ping is succesfully being masqueraded on the way 
> out (SRC swapped from 192.168.0.183 to 10.146.88.212). 
> It even looks like 10.0.0.1 is responding to the ping. 
> However, it seems that the packet is not de-masqueraded and ends up 
> being processed by (1) instead of being forwarded to (2) with the SRC 
> swapped back to 192.168.0.183 to 10.146.88.212.

Will you please verify that the traffic is indeed being masqueraded, 
possibly via TCPDump or seeing what 10.0.0.1 thinks of the traffic?

> Does anyone have any idea why this is happening?

Not as of yet.  Unless the traffic is not being MASQUERADEed like it 
should be.  Are you applying your IPTables rules before or after the 
ppp0 interface is up?

> Should there be a netfilter rule somewhere for de-masquerading?

Nope.

> How can I debug the problem?  Is there a table or a file somewhere I 
> can look at.

You might be able to add a logging rule to a raw table somewhere that is 
processed after the MASQUERADE in the nat table's POSTROUTING chain.

> How does netfilter recognise a packet that needs to be de-masqueraded?

That is an integral part of connection tracking.  In short, "It just does.".



Grant. . . .
