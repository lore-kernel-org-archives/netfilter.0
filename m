From: Steve Mickeler <steve@neptune.ca>
Subject: ip_conntrack_max setting wrt UNREPLIED entries
Date: Fri, 6 Sep 2002 00:26:51 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209060020300.13684-100000@triton.neptune.on.ca>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


We're using this linux box as a router/firewall in an asyncronous route
setup.

I had /proc/sys/net/ipv4/ip_conntrack_max set to 32768 and the CPU seemed
to be consumed at nailed at 100% use and appeared to be spending all its
time dealing with the tens of thousands of UNREPLIED entries in
/proc/net/ip_conntrack due to the async routing.

With the ip_conntrack_max set at 32768 I was able to push about 10Mbps for
a minute or so and then it wouldnt pass any more than 1-2Mbps.

I changed /proc/sys/net/ipv4/ip_conntrack_max to 3072 and now the box is
currently pushing about 25Mbps with the cpu at 90% idle. It should get up
over 70Mbps tomorrow.

Now the question I have is concerning the ip_conntrack table.

# wc -l /proc/net/ip_conntrack
   2919 /proc/net/ip_conntrack

# grep -v UNREPLIED /proc/net/ip_conntrack | wc -l
    318

Since the ip_conntrack will simply drop any UNREPLIED entries it needs to
to make room for more entries, and I really only have just over 300 real
connections that need tracking, am I hurting myself in any way by keeping
the ip_conntrack_max setting at 3072 ?

I'm seeing tonnes of messages like this via dmesg

NET: 752 messages suppressed.
ip_conntrack: table full, dropping packet.

But I am not actually seeing any dropped packets or data loss.


[-] Steve Mickeler [ steve@neptune.ca ]

[|] Todays root password is brought to you by /dev/random

[+] 1024D/9AA80CDF = 4103 9E35 2713 D432 924F  3C2E A7B9 A0FE 9AA8 0CDF







