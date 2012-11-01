From: Ed W <lists@wildgooses.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Thu, 01 Nov 2012 22:56:45 +0000
Message-ID: <5092FE2D.40009@wildgooses.com>
References: <5088717B.6080300@wildgooses.com>
	<1351412418.2740.5.camel@andylaptop>
	<508D47E2.8020800@ngtech.co.il>
	<1351807382.2243.51.camel@andylaptop>
Reply-To: ntop-dev@unipi.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ntop-dev-bounces@listgateway.unipi.it>
In-Reply-To: <1351807382.2243.51.camel@andylaptop>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://listgateway.unipi.it/mailman/options/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=unsubscribe>
List-Archive: <http://listgateway.unipi.it/pipermail/ntop-dev>
List-Post: <mailto:ntop-dev@listgateway.unipi.it>
List-Help: <mailto:ntop-dev-request@listgateway.unipi.it?subject=help>
List-Subscribe: <http://listgateway.unipi.it/mailman/listinfo/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=subscribe>
Sender: ntop-dev-bounces@listgateway.unipi.it
Errors-To: ntop-dev-bounces@listgateway.unipi.it
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: "G. Elian Gidoni" <geg@gnu.org>, netfilter@vger.kernel.org, Eliezer Croitoru <eliezer@ngtech.co.il>, ntop-dev@unipi.it

On 01/11/2012 22:03, Andrew Beverley wrote:
> On Sun, 2012-10-28 at 16:57 +0200, Eliezer Croitoru wrote:
>>> I have to admit that I only had limited success with l7-filter, although
>>> it no longer appears to be maintained anyway.
>>>
>> What would you want to achieve from a using l7 iptables?
>> filtering? scheduling?
> At the time I was using it to do traffic shaping, to prevent p2p
> applications overloading a network with low bandwidth internet
> connection. The problem was that it only needed one p2p application to
> not be identified for the network to be overloaded. So in the end I took
> a rather rudimentary approach and just identified any client making lots
> of connections to ports above 1024:
>
> http://www.andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux
>
>


I think it's safe to assume that at least a determined attacker can 
avoid these filters. Ideally you want them reasonably accurate for the 
normal situation...

I guess you just invented an "L7 Filter" yourself... It's just as good a 
match for certain requirements...!

Let me know if you measure this thing against your problem?

Cheers

Ed W
