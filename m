From: Rengakrishnan Subramanian <subbu@cis.ksu.edu>
Subject: Re: OUTPUT and PREROUTING
Date: Sun, 8 Sep 2002 19:15:17 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44.0209081853260.24112-100000@syrma.cis.ksu.edu>
References: <Pine.LNX.4.44.0209080015550.7110-100000@triton.neptune.on.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209080015550.7110-100000@triton.neptune.on.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Mickeler <steve@neptune.ca>
Cc: Netfilters Mailing List <netfilter@lists.netfilter.org>


Yes. I get it. Thanks.

--subbu

On Sun, 8 Sep 2002, Steve Mickeler wrote:

U>Date: Sun, 8 Sep 2002 00:30:53 -0400 (EDT)
U>From: Steve Mickeler <steve@neptune.ca>
U>To: Rengakrishnan Subramanian <subbu@cis.ksu.edu>,
U>     netfilter@lists.netfilter.org
U>Subject: Re: OUTPUT and PREROUTING
U>
U>
U>Logically looking at it, how would you expect A to suddenly start talking
U>to B without talking to C ?
U>
U>A initiates a connection with C, using iptables you could do a redirect
U>which would send the packets to B but they will always have to be resent
U>from C.
U>
U>How is C suppose to tell A to send the rest of the data to B ?
U>
U>This would be at the application layer, and currently only HTTP is able to
U>handle a redirect via sending the redirect message over HTTP to the client
U>browser at A which then will start to talk to B for the rest of that HTTP
U>session.
U>
U>If you are doing this for redundancy of C and B, then you could run vrrp
U>or something else between C and B so that if one fails, then the other
U>becomes active. This would create a new variable, D, which would be the
U>floating IP between B and C, so that A will never know about B or C it
U>will want to go to D which, depending on the active server would be B or
U>C.
U>
U>Get it ?
U>
U>
U>
U>On Fri, 6 Sep 2002, Rengakrishnan Subramanian wrote:
U>
U>>
U>> Hello all,
U>>
U>> Please refer to the problem that I was facing below. I have tried lots of
U>> permutations and combinations. I was not able to solve the problem using
U>> IPtables.
U>>
U>> The use of OUTPUT and DNAT target is restricted only to 127.0.0.1. If I could
U>> replace 127.0.0.1 with x.y.z.a, my problem will be solved instantly.
U>>
U>> 1. Where can I know whether this feature will be added to IPTABLES in a future
U>> release?
U>>
U>> 2. Is there any other idea for tackling this problem?
U>>
U>> thanks,
U>> --subbu
U>>
U>> On Wed, 28 Aug 2002, Bailey Kong wrote:
U>>
U>> U>Date: Wed, 28 Aug 2002 09:55:10 -0700 (PDT)
U>> U>From: Bailey Kong <bailey@tgpsolutions.com>
U>> U>To: subbu@cis.ksu.edu
U>> U>Cc: Antony@Soft-Solutions.co.uk, netfilter@lists.netfilter.org
U>> U>Subject: Re: OUTPUT and PREROUTING
U>> U>
U>> U>>  ____                    ____
U>> U>>  |   |               \   |   |
U>> U>>  | A | ----------------  | C |
U>> U>>  -----               /   -----
U>> U>>
U>> U>>                ____
U>> U>>                |   |
U>> U>>                | B |
U>> U>>                -----
U>> U>>
U>> U>> In the above diagram, I have a few packets generated from A talking to
U>> U>> C, but, at one point, I want to shift this connection and make it A to
U>> U>> B. I can do this using iptables SNAT and DNAT on C. But, that wll make
U>> U>> connection pass through C. I want to do that without passing through
U>> U>> C.
U>> U>
U>> U>In order to have A talk to C and then suddenly talk to B without A
U>> U>knowing, you would need to SNAT on B to pretend it was C when replying
U>> U>to A and C would need to forward or DNAT the connection to B.
U>> U>
U>> U>on C you would need something like
U>> U>iptables -t nat -A PREROUTING -d <C's IP> --dport 22 -j DNAT --to <B's
U>> U>IP>
U>> U>
U>> U>on B you would need something like
U>> U>iptables -t nat -A POSTROUTING -d <A's IP> --sport 22 -j SNAT --to <C's
U>> U>IP>
U>> U>
U>> U>if A was logging, it would still know because the mac addresses changed.
U>> U>I hope this helps you.
U>> U>
U>> U>Best Regards,
U>> U>Bailey
U>> U>
U>> U>
U>>
U>>
U>
U>
U>
U>[-] Steve Mickeler [ steve@neptune.ca ]
U>
U>[|] Todays root password is brought to you by /dev/random
U>
U>[+] 1024D/9AA80CDF = 4103 9E35 2713 D432 924F  3C2E A7B9 A0FE 9AA8 0CDF
U>
U>


