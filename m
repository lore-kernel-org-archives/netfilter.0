From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Fri, 09 Nov 2007 10:47:19 -0600
Message-ID: <47348F17.3000408@riverviewtech.net>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>	 <1194559495.19115.105.camel@grateful.d.umn.edu>	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>	 <1194560755.19115.110.camel@grateful.d.umn.edu>	 <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>	 <e97f32c10711090243m277b0bfcyc9e0015780c210f5@mail.gmail.com> <e97f32c10711090742h45794a40me7207df8d0d98473@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10711090742h45794a40me7207df8d0d98473@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/09/07 09:42, Bradley Kite wrote:
> the connection-tracking needs to be turned off on the bridges in 
> order to make this work:

Oh, you are running bridging (NOTHING at all wrong with that) but it 
does change things a bit.  Had I known that you were running bridging I 
would have asked about the Bridged NetFilter configuration in your kernel.

Based on the fact that you are running bridging and the fact that you 
have to touch IPTables for bridged traffic tells me that you are using 
Bridged NetFilter code.  This makes it even more important to know what 
your IPTables configuration is to help solve your problem as it was.

Seeing as how you have worked around your problem, we no longer need to 
see the output of iptables-save.

I don't think you solved your real problem, rather worked around it. 
But hay, if that works for you and packets are moving like they need to, 
so be it and good for you.  ;)



Grant. . . .
