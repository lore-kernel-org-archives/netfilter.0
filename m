From: Marek Dohojda <mdohojda@cisco.com>
Subject: Re: web server in DMZ
Date: Tue, 28 Sep 2004 08:14:54 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41597FEE.9010401@cisco.com>
References: <web-6416739@infinito.it>	<1096381048.2330.47.camel@wolfpack.ljm.dom>
	<web-6491079@infinito.it>
	<1096383819.2330.50.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096383819.2330.50.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Just create SNAT to that webserver so that whenever they try to go to 
the external address it get mangled and visible via its internal IP.  Or 
you could play with advance routing wihch is a pain in this case.

Jason Opperisano wrote:
> On Tue, 2004-09-28 at 10:44, hamals@infinito.it wrote:
> 
>>well I think this is a very good solution, but I can't 
>>understand the following:
>>
>>hosts in my LAN go in internet with a snat using x.x.x.50 
>>ip address, and everythings is working; my web server is 
>>accessible from outside, then why my inside hosts can't 
>>access to him (with x.x.x.50 IP)? my hosts should see my 
>>web server like any web server on the net....right?
>>what is wrong in this concept?
> 
> 
> routing.  there's nothing "wrong" with the concept; it's just that when
> you want to alter how normal routing works, you need to understand it in
> order to break it.
> 
> -j
> 

