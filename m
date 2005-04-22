From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 03:01:46 -0500
Message-ID: <4268AF6A.9090206@riverviewtech.net>
References: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
	<20050422075914.GA27193@epsilon.rdc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050422075914.GA27193@epsilon.rdc.pl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Mariusz Kruk wrote:
> On Fri, Apr 22, 2005 at 09:48:59AM +0200, Andreas Mimz wrote:
> 
>>I'm trying to route all internet traffic through a dummy network device.
>>Unfortunately, I wasn't able to do that yet :-(
> 
> 
> I used a tunnel between dwo different addresses on loopback device (ie.
> 127.0.0.2 and 127.0.0.3) and policy routing which puts everything from
> outside to one end of the tunnel and from the inside into another end
> (in my setup it works bi-directionaly - another hop is added for packets
> traveling both ways).
> If anyone is interested in more detailed description, I will gladly
> provide info.

I'm curious as to what purpose you would want to do such a thing?  Are you just trying to decrement the TTL by one hop or are you wanting to mess with QoS on inbound / outbound traffic?  If so why not use IMQ?



Grant. . . .

