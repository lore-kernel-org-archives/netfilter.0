From: Stephen Satchell <list@satchell.net>
Subject: Using the fib to classify endpoints.
Date: Sat, 2 May 2020 13:30:54 -0700
Message-ID: <6356fb62-3b5d-170f-698b-a367c84e8864@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

(slight bug: "describe fib_addrtype" isn't working on CentOS 8 version 
of nft(8))

I have taken the feedback provided by a number of you regarding the 
maturity of NFTABLES.  So I have decided to implement my new gigabit 
fireware using the NFTABLES hook.

Looking at the GitHub source, I have found the following Forward 
Information Base classification specifiers defined:

> static const struct symbol_table addrtype_tbl = {
> 	.base		= BASE_DECIMAL,
> 	.symbols	= {
> 		SYMBOL("unspec",	RTN_UNSPEC),
> 		SYMBOL("unicast",	RTN_UNICAST),
> 		SYMBOL("local",		RTN_LOCAL),
> 		SYMBOL("broadcast",	RTN_BROADCAST),
> 		SYMBOL("anycast",	RTN_ANYCAST),
> 		SYMBOL("multicast",	RTN_MULTICAST),
> 		SYMBOL("blackhole",	RTN_BLACKHOLE),
> 		SYMBOL("unreachable",	RTN_UNREACHABLE),
> 		SYMBOL("prohibit",	RTN_PROHIBIT),
> 		SYMBOL_LIST_END
> 	}
> };

Assuming that all the reserved, local, and known netblocks in question 
have been inserted into the FIB (a.k.a routing table), I can then screen 
packets according to my specifications, which I have already posted to 
NANOG, with some specifications referencing the FIB:

> # WAN Incoming filtering
> #       1.  WAN packets with local/LAN src address
> #       2.  WAN packets with local/LAN broadcast/net src-dst address
> #       3.  WAN packets with known broadcast/net src-dst address
> #       4.  WAN packets with dst small services
> #       5.  WAN packets with dst unimplemented services
> #       6.  WAN packets with blackholed source address
> 
> # WAN outgoing filtering
> #       1.  WAN packets with local/LAN dst address
> #       2.  WAN packets with local/LAN broadcast/net src-dst address
> #       3.  WAN packets with known broadcast/net src-dst address
> #       4.  WAN packets with dst small services
> #       5.  WAN packets with unimplemented dst services
> #       6.  WAN packets with blackholed dst address 

(Concentrating on the internet-facing part for the moment.)

I'm still trying to figure out the syntax of using the fib queries for 
source and destination addresses, but that's a learning exercise for me, 
and not part of my question to you.

One advantage of using the FIB is that BCP 153 netblocks are all 
covered, and subnet overrides happen seamlessly; for example in my 
network, 10.0.0.0/8 would be black-holed, but the longer-prefix netblock 
10.1.1.0/24 would be usable.  This is an example of letting the computer 
do the book-keeping.

So it's easy to block "net", "broadcast", "blackhole" with clear, easy 
to understand rules, and perhaps even have different ICMP responses for 
each of these if I so desire.

Well and good.  Last time I brought up this subject, though, some 
contributors said that IPSET was the way to go, and not "pollute" the 
routing table.  So my question is this:  does IPSET offer the same 
capabilities and classification tests as the FIB?  Does IPSET allow for 
overlapping netblocks?

My search-foo hasn't been good enough to find the answer to this 
question, so I ask y'all.

