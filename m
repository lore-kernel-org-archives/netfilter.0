From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sun, 22 Sep 2002 10:18:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0cb501c2624b$4b4864a0$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020922134852.PSNX6699.mta01-svc.ntlworld.com@there> <001d01c26242$79813670$026410ac@honor> <20020922142038.LIRG2092.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> 
> Sorry :-)   You're right.   I just hate to see bullshit spread about in what 
> is usually a very helpful and informative mailing list.
> 

I think that is an extreme ( = unreasonable ) point of view.

Of the 160 bits in an IPv4 header, **YOU** really do not see how **you** could 
reasonably use these 49 for routing purposes:

4 bits - header length
16 bits - fragment identifier
13 bits - fragmentation offset
16 bits - header checksum

Of the remaining 111 bits, even these 28 would be a challenge to use 
intelligently for routing, **YOU** think ?

4 bits - IP version no
16 bits - total packet length
8 bits - time to live

The length and the ttl might make sense as numeric values, but not as 
bitmasks for routing decisions.

**YOU** think it's much fairer to say that of the 160 bits in the IPv4 header, 83 
of them make sense for routing purposes:

8 bits - type of service
3 bits - fragmentation flags
8 bits - protocol identifier
32 bits - source address
32 bits - destination address
=======

Other people also have a right to think...and do as they please with the 160 bits...
There are...
1.4615016373309029182036848327163e+48
...possible 160 bit headers....all of them may not be useful....
NetFilter allows each person to decide which are useful and which are not...
...educated people know what is in those 160 bits...and how they can be used...
http://www.netfilter.org/

An ISP that does not pass TOS Field end-to-end with no change, is not an ISP...
An ISP that sets the TOS Field for you is not an ISP...

By the way, there are only 2 bits used for Fragmentation Flags...MF and DF...

What do **YOU** use the Spare Bit for ?



