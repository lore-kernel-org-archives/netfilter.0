From: Mariusz Kruk <Kruk@epsilon.eu.org>
Subject: Re: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 10:50:27 +0200
Message-ID: <20050422085027.GA30855@epsilon.rdc.pl>
References: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
	<20050422075914.GA27193@epsilon.rdc.pl>
	<4268AF6A.9090206@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4268AF6A.9090206@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Apr 22, 2005 at 03:01:46AM -0500, Taylor Grant wrote:
> >>I'm trying to route all internet traffic through a dummy network device.
> >>Unfortunately, I wasn't able to do that yet :-(
> >I used a tunnel between dwo different addresses on loopback device (ie.
> >127.0.0.2 and 127.0.0.3) and policy routing which puts everything from
> >outside to one end of the tunnel and from the inside into another end
> >(in my setup it works bi-directionaly - another hop is added for packets
> >traveling both ways).
> >If anyone is interested in more detailed description, I will gladly
> >provide info.
> I'm curious as to what purpose you would want to do such a thing?  Are you 
> just trying to decrement the TTL by one hop or are you wanting to mess with 
> QoS on inbound / outbound traffic?  If so why not use IMQ?

As I wrote earlier on this list, I have a setup with linux router, three
local interfaces and one outside interface. I do NAT and manage
bandwidth. Therefore I needed the IMQ functionality. Unfortunately, no
distro known by me at that time had kernel with IMQ (I didn't want to
use stock kernel and patch it myself every time I need to upgrade
kernel). Besides, it was also a kind of "proof-of-concept" solution.
Anyway, It works almost flawlessly (except for some strange behaviour
with GRE packets which I described few days ago).

-- 
\.\.\.\.\.\.\.\.\.\.\.\.\.\ Being  vewy, vewy quiet is iweviwent. <hehe-
.\.Kruk@epsilon.eu.org.\.\. hehehe> - Fudd of Borg.
\.http://epsilon.eu.org/\.\ 
.\.\.\.\.\.\.\.\.\.\.\.\.\. 

