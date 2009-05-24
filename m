From: Jesse Molina <jesse@opendreams.net>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Sun, 24 May 2009 14:02:41 -0700
Message-ID: <4A19B5F1.4080000@opendreams.net>
References: <4A19235F.4070306@opendreams.net> <4A192D38.90008@redpill-linpro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A192D38.90008@redpill-linpro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tore Anderson <tore.anderson@redpill-linpro.com>
Cc: netfilter@vger.kernel.org


That's a pretty good suggestion, but it's more of a workaround than 
something that actually addresses the issue at hand.  I'm looking for a 
solution on the GNU/Linux host, not in the world around it.

To restate my question:  What alternative ways are there to make the 
GNU/Linux system reply to ARP requests for an IP, without that IP being 
an actual interface on the host, or that interface must not be used by 
local services *in any way*, for the reasons of using it via SNAT/DNAT?

Here is an example where the solution you suggested would not work:  I 
have a Qwest ADSL line with a /29 network.  That's what we have, and 
it's not going to change.  Qwest will not issue you a /30 for the 
point-to-point between the ADSL router device and your GNU/Linux 
firewall.  The ADSL router's filtering and firewall capabilities suck or 
just don't exist.  A bridge firewall would work here, but we could not 
use NAT and RFC1918 addresses.  We have 100 actual hosts on that RFC1918 
network, but only four of them need a public resource, and they are all 
tcp/80 web servers.

All commercial firewall products that I know of can do this.  You don't 
give your Cisco ASA/PIX a secondary IP -- the nat or static statement 
induces the host to ARP for the IP that you have assigned for the 
translation.  Same thing with Checkpoint, same thing with NetScreen.

Thanks for the suggestion though -- that's certainly a good one, but it 
still seems like there is functionality missing from the Linux kernel to 
handle this, or it's somewhere that I don't know of.



Tore Anderson wrote:
> Hi Jesse,
> 
> * Jesse Molina
> 
>> What else is there?  Loop interfaces with proxy arping?  I've been
>> reading about some functionality for NAT in the ip tool (ip route add
>> nat ...) but it looks depreciated.  There also seems to be something
>> like "ip rule add nat ..." but I've not figured that out yet.  I had
>> read somewhere that "ip route add nat ..." specifically would arp for
>> the translated address, but again, the man pages says that's depreciated
>> in the 2.6 kernel.
> 
> I'd simply route the IP adresses used for NAT to your Linux-based
> firewall, if I were you.  That way you'll only need a /30 link network
> to be used on the public interface, while the addresses used for NAT do
> not have to be local to the firewall in any way.  As an added bonus
> you'll get less ARP traffic on the public interface, as the upstream
> router only needs to learn the L2-address of the next-hop router (your
> firewall, that is).
> 
> BR,

-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.602.323.7608
# Web  = http://www.opendreams.net/jesse/


