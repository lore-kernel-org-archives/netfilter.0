From: Helge Hafting <helge.hafting@aitel.hist.no>
Subject: Re: Is it possible to do bonding/connection teaming with non-ethernet
 devices?
Date: Fri, 30 Nov 2007 17:48:09 +0100
Message-ID: <47503EC9.4000807@aitel.hist.no>
References: <4744413F.1000700@aitel.hist.no> <op.t15dxsbprtqp7s@hagumi.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.t15dxsbprtqp7s@hagumi.home>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eljas Alakulppi <Buzer@buzer.net>
Cc: netfilter@vger.kernel.org

Eljas Alakulppi wrote:
> You can this decently by using iproute2's nexthop. Of course, one 
> client isn't able to use more than one ISP per connection and their IP 
> will keep changing depending on which route they happend to get.
>
> Anyway, to the point. 
> http://wiki.robotz.com/index.php/Iproute2#General_Notes_and_Information
Thanks a lot - just what I needed. One ISP per connection is fine.

There is one big problem though:
The routing works well when I bring up the interfaces.
But if one interface goes down and pppd quits, then the
whole default route is destroyed.  In a test, this did not happen
if I brought down "lo", I had a test route there. But
if ppp0 goes down, then the route to ppp1 dies too.
So no reliability through multiple connections.

I have tried giving pppd the "nodefaultroute" option,
it is not supposed to make its own default route (a
script does that) and then it shoudn't delete the
default route either. But the route goes away.

Is there some other trick I should use, or will
I have to resort to a polling script that
checks every 10s if the default route is gone,
and then recreates it from "ifconfig" output?
I hope this ugly solution won't be needed, but
it is all I can come up with and there isn't
too much time. :-(

Another minor issue I noticed:
Using "weight 1" for the routes didn't work - everything
went through the first interface I brought up.
Changing to "weight 5"
for the routes seemed to fix this - off-by-one?

Helge Hafting

