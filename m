From: Stephen Satchell <list@satchell.net>
Subject: nft -- documentation on fib_addrtype missing, more data
Date: Thu, 10 Oct 2019 14:45:59 -0700
Message-ID: <5fbab89f-ee32-44f7-b8d7-cf63ba65bc0e@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Poking around looking for more information, I ran across this little tidbit:

From man 7 rtnetlink:
      rtm_type          Route type
      -----------------------------------------------------------------
      RTN_UNSPEC        unknown route
      RTN_UNICAST       a gateway or direct route
      RTN_LOCAL         a local interface route
      RTN_BROADCAST     a local broadcast route (sent as a broadcast)
      RTN_ANYCAST       a local broadcast route (sent as a unicast)
      RTN_MULTICAST     a multicast route
      RTN_BLACKHOLE     a packet dropping route
      RTN_UNREACHABLE   an unreachable destination
      RTN_PROHIBIT      a packet rejection route
      RTN_THROW         continue routing lookup in another table

This clears up the confusion I had about "anycast" versus "broadcast".

Is there a shell tool that will show the route type(s) for a
specified address?
