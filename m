From: Martijn Lievaart <m@rtij.nl>
Subject: Re:
Date: Thu, 03 Jan 2008 23:22:09 +0100
Message-ID: <477D6011.6000608@rtij.nl>
References: <00b301c84e53$ae114a80$9604000a@jrdesktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00b301c84e53$ae114a80$9604000a@jrdesktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joe Ruddy <jruddy@novapointe.com>
Cc: netfilter@vger.kernel.org

Joe Ruddy wrote:
> Hello,
>
> We are moving to a Co-Location center and will need to forward all traffic
> for all our IP to our new IP addresses.
>
> As an example our block is 12.24.15.0/24
>
> Our new block will be 54.64.18.0/24
>
> If we have a webserver at 12.24.15.24 I would like all requests to
> 12.24.15.24 to be forwarded to 54.64.18.24 where the new machine will be
> located.
> If we have a mailserver at 12.24.15.19 I would like all requests to
> 12.24.15.19 to be forwarded to 54.64.18.19 where the new machine will be
> located.
>
> I add one rule ..."iptables -t nat -A PREROUTING -d 12.24.15.24 -j DNAT --to
> 54.64.18.24"
>
> If I try to ssh or go to the website hosted there I get nothing.  I can see
> that the requests arrive at 54.64.18.24 by looking at the logs.
>
>   

It does not work because the return traffic is not seen by the old 
firewall so it's not properly de-dnatted. Nat only works if the firewall 
sees all the traffic, not only one side of it.

Here's one way to get around it.

- Set up a tunnel between the firewall at the old location and the 
firewall at the new location.
- Give the colo a second subnet on the same physical network, say 
192.168.15.0/24
- On the old firewall:
  - add a route for 192.168.15.0/24 into the tunnel
  - Dnat all requests on the old firewall for 12.24.15.x to 192.168.15.x
- On the new firewall:
  - Use source routing to route all trafic FROM 192.168.15.0/24 into the 
tunnel.

A simpler way would be to use rinetd to reroute all requests to the new 
servers, but this looses the original source address. If you don't mind 
your logs becomming virtually useless, this is much simpler.

A final trick would be to use something that can do stateless nat out to 
the same interface that the packet was received on. I don't know of any 
device that can do this, but I don't know very much about this. Then you 
use stateless nat on the old and the new location, on the old location 
you dnat to the final destination and on the new location you snat the 
return trafic back to the original destination. This does depend on your 
new provider not doing any filtering.

May I use this to advocate the use of DNS? When moving over, you set the 
TTLs to 0 some time beforehand. When you move over, you update the DNS 
records and the transition is instant. Don't forget to reset the TTL to 
some sane value after you have convinced yourself everything works.

If all of the above is Chinese to you, I suggest you forget the whole 
idea and deal with the problem differently, mainly by telling all 
clients the new IP.

HTH,
M4

