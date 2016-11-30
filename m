From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Programmatically adding Map element into the map/set using
 libnftnl
Date: Wed, 30 Nov 2016 20:34:53 +0100
Message-ID: <20161130193453.GA12643@salvia>
References: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khawar Shehzad <shehzad.khawar@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Nov 30, 2016 at 07:16:28PM +0000, Khawar Shehzad wrote:
> Hi,
> I hope everybody is fine.
> 
> I want to do following programmatically in C using libnftnl.
> 
> 
> _______________________________________________
> "nft add element ip6 my_table my_map {fe80::2 : fe80::3 }"
> _______________________________________________
> 
> My example code is below, and it gives "error: Invalid argument"
> error. My question is simple how can I add an IPv6 map into a set/map.
> My map type is "type ipv6_addr : ipv6_addr".

Just added an example for you at:

http://git.netfilter.org/libnftnl/commit/?id=2d894a97c28e6c7c7f064d16bec0167d000e901c
