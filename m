From: Thomas Jacob <jacob@internet24.de>
Subject: Re: ACCOUNT target
Date: Tue, 04 May 2010 18:56:50 +0200
Message-ID: <1272992210.7011.86.camel@enterprise.ims-firmen.de>
References: <1272579734.8207.16523.camel@laplaplian>
	 <1272965655.7011.11.camel@enterprise.ims-firmen.de>
	 <1272990910.2143.303.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1272990910.2143.303.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

On Tue, 2010-05-04 at 09:35 -0700, Bob Miller wrote:
> Interesting, I was not aware there were others.  I am using the
> xtables-addons package, and the documentation on the intra2net site
> seems to work as it says it should, so I am operating under the
> assumption it is that one...

Well, I don't know whether these are still being maintained but there
is for instance this one
http://code.google.com/p/ipt-account/wiki/Software

Anyway, yes, the xtables-addons package is the one by intra2net.

> >  counts all IPv4 packets matched by the rule
> > you use this target in. 
> > 
> > So your ruleset determines what is counted and what isn't.
> 
> If I may say this back to you differently to ensure I understand; the
> '-j ACCOUNT' target takes a subnet parameter (--addr 192.168.10.0/24),
> so any packet passing iptables with headers containing an IP address
> within that subnet will be counted regardless of protocol?  If I wanted
> to count only tcp or udp packets, I would then add a '-p tcp' or some
> such to the rule?  If this is true, then ICMP packets also have IP
> addresses, so the subnet parameter would match ICMP as well?

The actual packet matching is done by iptables proper, and -j ACCOUNT
then reduces the matched packets further with the --addr parameter,
which
is primarily needed to calculate the size of the internal data
structures.

so forwarded packet IP:1.1.1.1->2.2.2.2  would be matched by this rule
"-A FORWARD -j ACCOUNT --addr 192.168.10.0/24" but then not be
accounted, whereas IP:1.1.1.1->192.168.10.2 would be matched and then
also be accounted.

I guess the idea is to able to match only some part of a datastream
and ignore the rest, without having to specify iptables matchers for
that part as well, even though this probably would be more efficient.

i.e. 
-A FORWARD -j ACCOUNT --addr 192.168.10.128/25
does the same as 

-A FORWARD -s 192.168.10.128/25  -j ACCOUNT --addr 192.168.10.128/25
-A FORWARD -d 192.168.10.128/25  -j ACCOUNT --addr 192.168.10.128/25


And yes, if you do not specify -p all IPv4 layer 4 protocols are
matched, even ICMP. 

Cf. http://www.networksorcery.com/enp/protocol/ip.htm#Protocol

