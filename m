From: Marek Dohojda <mdohojda@cisco.com>
Subject: Re: CISCO VPN clients behind firewall
Date: Tue, 04 May 2004 20:38:22 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409861AE.6060202@cisco.com>
References: <00f101c43236$e54f0380$0300a8c0@indoakses2> <200405050153.18201.Antony@Soft-Solutions.co.uk> <011901c43241$13d1dc00$0300a8c0@indoakses2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <011901c43241$13d1dc00$0300a8c0@indoakses2>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bino_oetomo <bino@indoakses-online.com>
Cc: netfilter@lists.netfilter.org

Nope that is not a problem.  Got it working without much of a problem.

Ok that wasn't helpful I know.  One thing you have to do is ensure that 
you are using proper setting on your concentrator.  Ensure that it is 
set to be able to accept NAT.  In addition choose UDP (or TCP) on 
specific port.


bino_oetomo wrote:

> Dear Antony
> ----- Original Message ----- 
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, May 05, 2004 7:53 AM
> Subject: Re: CISCO VPN clients behind firewall
> 
> 
> 
>>As far as I know, Cisco VPNs use IPsec - no problem there for netfilter 
>>(although maybe problems if you're using transport mode and doing nat).
>>
> 
> 
> Yes, actualy it's "behind nat" rather then just "behind firewall"
> 
> 
> Sincerely
> -bino-
> 
> 
> 
> 

