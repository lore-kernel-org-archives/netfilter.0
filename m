From: Jim Fleming <JimFleming@Ameritech.Net>
Subject: .NET InterNAT address allocations, rather than 192.168.*.*.
Date: 31 May 2004 05:52:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086000754.1903.107.camel@dallas.unir.net>
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
To: netfilter@lists.netfilter.org


As a suggestion, you may want to consider using your own ("private")
.NET InterNAT address allocations, rather than 192.168.*.*.

There are 20 bytes (160 bits) in the basic packet routing header.
Depending on the setting of those bits, some address values, such as,
10.*.*.* and 192.168.*.* may be owned by a registered .NET InterNAT
user.
Those values also may be used (over and over) by large national packet
transport carriers, as they work to carry your InterNAT packets from
end-to-end. It helps to make sure your end-points have unique addresses.

Setting the X bit to a 1 allows you to distinguish your .NET packets.
VVVVHHHHSSSSDDDDLLLLLLLLLLLLLLLL
SSSSSSSDDDDDDDIIXFFFFFFFFFFFFFFF
TTTTTTTTPPPPPPPPCCCCCCCCCCCCCCCC
**...[25-bit SRC Prefix]...SSSSS
**...[25-bit DST Prefix]...DDDDD

The ** allows you to place your 25-bit Prefix in one or more ranges
to avoid colliding with other address spaces. The X bit set to 1 helps
to ensure that there are no collisions, because, the legacy Internet
packets set X to 0. Your InterNAT software can easily test that bit.
The .NET owners have been allocated the 33,554,432 unique prefixes
for InterNAT addressing. You might find it easier to manage your .NET
with your own ("private") .NET InterNAT address allocation.

See also...
http://www.IPv8.info




