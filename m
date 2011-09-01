From: Bob Miller <bob@computerisms.ca>
Subject: iptaccount/shaping
Date: Thu, 01 Sep 2011 09:33:26 -0700
Message-ID: <1314894806.28901.574.camel@worklian.computerisms.bob>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have a firewall that provides internet to two networks, a private one
with no special config, and a public one where I do bandwidth shaping to
reduce clients to something like dial-up speeds.  Recently, we got a
bill from the isp for quite a lot of bandwidth overages (we have really
expensive bandwidth).

Expectation is that iptaccount should report slightly lower than the
isp, since the isp counts *all* traffic, and iptaccount can only count
traffic with an IP address.  

I also monitor inside connections, and I have found quite consistently
that the inside public network always has gobs more usage than the
internet connection.  I also expect that; the inside port gets bombarded
with fast traffic, but the shaping is preventing the outside port from
using so much bandwidth.

On many days, the ISP count is much much higher than iptaccount reports,
but often the ISP counts are oddly close to the sum of usage of the two
inside ports.  Maybe it is easier to see like this:

In MB
Telco report:	my outside:	My public	My private
10121		1269		8864		559
11227		2363		9647		867
	
While still short by quite a lot, the sum of private and public networks
actually comes pretty close (less than 10% different) to what the telco
reports, while my report of outside usage is much much lower.

This happens frequently enough that there looks to be a pattern, but it
is not consistent.  Over a month this pattern holds about 75% true.  The
other 25% of days are just different with no pattern that I see.

My question is: is it somehow possible I am leaking data on my outside
port that would trigger the ISP counter but not iptaccount?  Is there
some layer 2 traffic of which I am not aware that would tell the ISP
what the intended traffic before shaping might be?  I have been dumping
and analyzing traffic for hours and found nothing, but maybe there is
something I don't know about that would explain this.

It does occur that the ISP might be taking select bits of information
from certain packets in a stream or connection and extrapolating the
expected bandwidth that connection would use, but then doesn't verify it
by counting every packet.  So far that is the only explanation I can
come up with for these discrepancies.  

Well, not the only explanation.  One of these two counters maybe just
plain wrong, but if so, which one?

If you are still reading I truly appreciate your time.  If you have any
thoughts or experiences to share, I would consider it most gracious of
you.  I want to be fully armed when I go talk to the ISP...

                                                                     -- 
Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

