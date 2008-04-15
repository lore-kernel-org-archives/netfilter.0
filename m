From: Luke Elliott <lukester_null@yahoo.co.uk>
Subject: intended behavior of REDIRECT
Date: Tue, 15 Apr 2008 19:10:11 +0100
Message-ID: <4804EF83.7080004@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

I'm trying to figure out the intended behavior of a REDIRECT rule such as:

iptables -t nat -A PREROUTING -p tcp --dport 9002 -j REDIRECT --to-ports 
9003-9004

I'd like to balance connections to port 9002 across the two servers on 
ports 9003 and 9004. Using the --random (or --random 1 with iptables 
1.3.8...) option works, but what should the non-random rule actually do?

Digging around in the 2.6.24 kernel it seems to boil down to 
tcp_unique_tuple() in nf_nat_proto_tcp.c. The interesting bit:

    static u_int16_t port;

    ...

    for (i = 0; i < range_size; i++, port++) {
        *portptr = htons(min + port % range_size);
        if (!nf_nat_used_tuple(tuple, ct))
            return 1;
    }


So if I'm reading this correctly, _port_ will only get incremented once 
an in use tuple is hit. And assuming there are no other rules in place, 
that means only after 64K-ish connections from a single host to port 
9002? This seems to be what I see in practice - "everything" gets 
forwarded to port 9003 (though TBH I've only tried a few hundred 
connections).

So presumably the intention is not to round-robin connections, something 
like:

    for (i = 0; i < range_size; i++) {
        *portptr = htons(min + port % range_size);
        ++port;
        if (!nf_nat_used_tuple(tuple, ct))
            return 1;
    }

(Though no doubt that breaks lots of other usages of the function...)

An insight gratefully received!

Regards

Luke Elliott.

