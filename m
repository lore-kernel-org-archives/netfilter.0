From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: dual wan routing, looking from the outside...
Date: Fri, 11 Jul 2008 09:29:36 -0500
Message-ID: <48776E50.3020104@riverviewtech.net>
References: <4876A6C7.7010709@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4876A6C7.7010709@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/10/08 19:18, Brian Austin wrote:
> From the outside, I can only access services from one isp connection at 
> a time. So if I VPN in, then I cant access my imaps mail,

Hum...

> do I need to do some sort of packet marking to achieve this? So that 
> packets from the same internet host can route out both wan connections 
> simultaniously?

Possibly.

> Pointers to example scripts or the right information to study appreciated

I wonder if you are not falling victim to route caching.  How quickly 
after you finish using (close) one service can you use the other?  If it 
is not immediately I think your dual wan router has a route to your 
client's source IP cached and thus not looking up / using the route for 
the other service but rather continuing to use the cached route that it 
was just using a moment ago.

You can easily test this by flushing your routing cache after you 
disconnect the first service before you start using the second service.


If this does work, I think you will need to mark your packets so that 
you can use different routing tables depending on the interface the 
traffic comes in on, thus forcing the routing that you want.



Grant. . . .
