From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft -- documentation on fib_addrtype missing, more data
Date: Fri, 11 Oct 2019 10:29:26 +0200
Message-ID: <20191011082926.4wfyhysc6joofuel@salvia>
References: <5fbab89f-ee32-44f7-b8d7-cf63ba65bc0e@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5fbab89f-ee32-44f7-b8d7-cf63ba65bc0e@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@vger.kernel.org

On Thu, Oct 10, 2019 at 02:45:59PM -0700, Stephen Satchell wrote:
> Poking around looking for more information, I ran across this little tidbit:
> 
> From man 7 rtnetlink:
>       rtm_type          Route type
>       -----------------------------------------------------------------
>       RTN_UNSPEC        unknown route
>       RTN_UNICAST       a gateway or direct route
>       RTN_LOCAL         a local interface route
>       RTN_BROADCAST     a local broadcast route (sent as a broadcast)
>       RTN_ANYCAST       a local broadcast route (sent as a unicast)
>       RTN_MULTICAST     a multicast route
>       RTN_BLACKHOLE     a packet dropping route
>       RTN_UNREACHABLE   an unreachable destination
>       RTN_PROHIBIT      a packet rejection route
>       RTN_THROW         continue routing lookup in another table
> 
> This clears up the confusion I had about "anycast" versus "broadcast".
> 
> Is there a shell tool that will show the route type(s) for a
> specified address?

# nft describe fib saddr type
fib expression, datatype fib_addrtype (fib address type) (basetype integer), 32 bits

pre-defined symbolic constants (in decimal):
        unspec                                             0
        unicast                                            1
        local                                              2
        broadcast                                          3
        anycast                                            4
        multicast                                          5
        blackhole                                          6
        unreachable                                        7
        prohibit                                           8

