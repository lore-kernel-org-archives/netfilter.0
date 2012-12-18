From: Alex Bligh <alex@alex.org.uk>
Subject: Using DNAT with multiple upstreams
Date: Tue, 18 Dec 2012 20:46:30 +0000
Message-ID: <4B5F9CC88C3B87ECDEAD7A5D@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

I have a multihomed configuration as follows:

            Provider A     Provider B
               ^              ^
          eth1 |              | eth2
192.200.0.2/24 |              | 192.200.1.2/24
              ROUTERRUNNINGLINUX
                      | eth3
                      | 10.10.10.1/24
                      |
                   ---+----
                          |
                         10.10.10.99/24

Internet connections A and B both inject default routes when
they are up. I use SNAT on eth1 and eth2 to NAT the range
on eth3 to the appropriate IP address (well, SNAT on one
and MASQUERADE on the other for boring reasons). Connection
B is faster so injects its default route with a lower distance.
This gives me resilience and uses the fastest connection.
So far so good.

Now, I also want to use DNAT on eth1 so that incoming connections
to 10.200.0.2:1234 get mapped to (say) 10.10.10.99:5678. When
the connection to provider B is down, all this works just fine.
However, when the connection to provider B is up, the connection
fails. As far as I can tell, this is because return traffic
to the external host initiating the connection follows the
default route with the lowest distance, and goes out provider B
instead (who knows how it gets NATted).

What I'd really like to do is say "if the connection is in
your DNAT table, send it out the way it came", but I think
the DNAT is undone after the routing decision. I can think
of a pile of ways to solve this, many of which involve
ugly source routing. I could use the connmark stuff I think.
I could also (conceivably) SNAT the incoming connection
to be originated by 192.200.0.1 so that the route out would
always be via provider A (as that's an interface route).
I know I have a million options. My question is what is the
fastest way to do this (with minimal impact on other traffic).
I'm loathe to go down the ip rule route unless I really need to.

-- 
Alex Bligh
