From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: --mac-destination possible ?
Date: Sat, 5 Jun 2004 13:17:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406051317.24886.Antony@Soft-Solutions.co.uk>
References: <a995ba701b.a701ba995b@teleline.es>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a995ba701b.a701ba995b@teleline.es>
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

On Friday 04 June 2004 4:26 pm, PETER-MULLER wrote:

> Hello,
>
> do you know if
>
> 1. Is there any plans to include a --mac-destination parameter for the
> MAC module to check package destinated to a certain MAC address (like as
> --mac-source)
>
> or
>
> 2. Is there any impediments to implement such a parameter

I do not think this is possible in iptables / netfilter (but it may be a 
feature, or a possibility, for ebtables?).

The reason I think this is because netfilter works with IP packets, and can 
see the TCP / UDP / ICMP headers within them; it is also handed the MAC 
address for incoming packets by the networking stack as a kind of bonus bit 
of information.

However, for outgoing packets, netfilter (at the IP layer) knows nothing about 
the MAC address of the destination machine (it doesn't even know whether it 
is a local machine or on the other side of a router, which will make a big 
difference to the MAC address which gets associated with a specific IP 
address).   It's not until netfilter releases the packet to the networking 
code and says "send this out on the wire please" that an ARP lookup gets done 
and a MAC address is discovered.   By then it's too late to send the packet 
back to netfilter to tell it what the MAC address was and ask what to 
*really* do with the packet.

If anyone else thinks this is wrong, and netfilter can know about the 
destination MAC, please correct me.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


