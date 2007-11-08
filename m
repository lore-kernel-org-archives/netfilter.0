From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Thu, 08 Nov 2007 16:37:56 -0600
Message-ID: <47338FC4.5040100@riverviewtech.net>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>	 <1194559495.19115.105.camel@grateful.d.umn.edu>	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>	 <1194560755.19115.110.camel@grateful.d.umn.edu> <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/08/07 16:34, Bradley Kite wrote:
> I tried this with the same results I'm afraid. If I cannot get this 
> working then I'll have to make the upstream router do NAT too so that 
> the entire network is seen from the address of the up-stream router - 
> as Linux is NATing that address without problems.

Something (else) is wrong here.

> Or maybe I'll try a kernel upgrade to see if that makes any 
> difference.

I doubt that will make any difference.

Can we see the output of iptables-save?



Grant. . . .
