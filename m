From: Rengakrishnan Subramanian <subbu@cis.ksu.edu>
Subject: Re: OUTPUT and PREROUTING
Date: Fri, 6 Sep 2002 19:11:47 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44.0209061904040.12257-100000@wezen.cis.ksu.edu>
References: <2738.192.168.1.2.1030553710.squirrel@mail.tgpsolutions.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2738.192.168.1.2.1030553710.squirrel@mail.tgpsolutions.com>
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
To: Bailey Kong <bailey@tgpsolutions.com>
Cc: Antony@Soft-Solutions.co.uk, netfilter@lists.netfilter.org


Hello all,

Please refer to the problem that I was facing below. I have tried lots of
permutations and combinations. I was not able to solve the problem using
IPtables.

The use of OUTPUT and DNAT target is restricted only to 127.0.0.1. If I could
replace 127.0.0.1 with x.y.z.a, my problem will be solved instantly.

1. Where can I know whether this feature will be added to IPTABLES in a future
release?

2. Is there any other idea for tackling this problem?

thanks,
--subbu

On Wed, 28 Aug 2002, Bailey Kong wrote:

U>Date: Wed, 28 Aug 2002 09:55:10 -0700 (PDT)
U>From: Bailey Kong <bailey@tgpsolutions.com>
U>To: subbu@cis.ksu.edu
U>Cc: Antony@Soft-Solutions.co.uk, netfilter@lists.netfilter.org
U>Subject: Re: OUTPUT and PREROUTING
U>
U>>  ____                    ____
U>>  |   |               \   |   |
U>>  | A | ----------------  | C |
U>>  -----               /   -----
U>>
U>>                ____
U>>                |   |
U>>                | B |
U>>                -----
U>>
U>> In the above diagram, I have a few packets generated from A talking to
U>> C, but, at one point, I want to shift this connection and make it A to
U>> B. I can do this using iptables SNAT and DNAT on C. But, that wll make
U>> connection pass through C. I want to do that without passing through
U>> C.
U>
U>In order to have A talk to C and then suddenly talk to B without A
U>knowing, you would need to SNAT on B to pretend it was C when replying
U>to A and C would need to forward or DNAT the connection to B.
U>
U>on C you would need something like
U>iptables -t nat -A PREROUTING -d <C's IP> --dport 22 -j DNAT --to <B's
U>IP>
U>
U>on B you would need something like
U>iptables -t nat -A POSTROUTING -d <A's IP> --sport 22 -j SNAT --to <C's
U>IP>
U>
U>if A was logging, it would still know because the mac addresses changed.
U>I hope this helps you.
U>
U>Best Regards,
U>Bailey
U>
U>


