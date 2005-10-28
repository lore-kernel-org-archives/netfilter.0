From: Jon Heese <netfilter@jonheese.com>
Subject: Re: Forward internal packets as though they're external
Date: Thu, 27 Oct 2005 20:01:25 -0400
Message-ID: <43616A55.40705@jonheese.com>
References: <200510272255.j9RMtouv006919@ajax.jonheese.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510272255.j9RMtouv006919@ajax.jonheese.com>
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

I'm running the BitTorrent *tracker* here on my local network.  I have a 
dedicated high-bandwidth server offsite that is seeding the torrents. 
The torrent has hardcoded into it the location of the tracker 
(http://dns.name.of.my.router:6969/announce), so if I want to download 
torrents to a machine on the LAN here, I have to be able to connect to 
that machine on that port.

Does that make sense?

Regards,
Jon Heese

Seferovic Edvin wrote:
> You welcome :P 
> 
> But please tell us why do you actually want BT in your LAN? Any good
> reasons, or just for fun?
> 
> Regards,
> 
> Edvin
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jon Heese
> Sent: Freitag, 28. Oktober 2005 01:50
> To: netfilter@lists.netfilter.org
> Subject: Re: Forward internal packets as though they're external
> 
> Ah, I was so caught up in iptables, I wasn't even thinking about 
> routing.  Just tried adding a route on Castor to Webster through Router, 
> and it works.  Thanks for all the help, Rob and Edvin.
> 
> Regards,
> Jon Heese
> 
> Seferovic Edvin wrote:
> 
>>Why don't you tell Castor all packages to Webster over the router? Adding
> 
> an
> 
>>extra route shouldn't be a problem, and the connection tracking would work
>>in this way... this way you will need an SNAT over the router to
> 
> Webster...
> 
>>Regards,
>>
>>Edvin

