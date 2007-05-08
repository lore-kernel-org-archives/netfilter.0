From: David Lang <david.lang@digitalinsight.com>
Subject: Re: Two NICs, same network...
Date: Tue, 8 May 2007 13:29:37 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0705081326460.20281@qynat.qvtvafvgr.pbz>
References: <e53321d30705081317w3d7e6f5bsb38161f155c883da@mail.gmail.com> 
	<Pine.LNX.4.63.0705081251200.20281@qynat.qvtvafvgr.pbz>
	<e53321d30705081402n2fa7e3c5pcd0ed7baeecebef4@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30705081402n2fa7e3c5pcd0ed7baeecebef4@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: semi linux <linuxsemi@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 8 May 2007, semi linux wrote:

> Ok... you asked for the whole thing, here it is (forget my previous example):
>
> eth0 - 10.1.1.1
> eth1 - N/A
> eth2 - N/A
> br0 (eth1, eth2) - 10.1.1.2
> target - 10.1.1.3
>
> The bridge (br0) is setup using brctl and seems to work w/o problem...
> The eth1 and eth2 IP addresses really don't matter since they are both
> referenced via the bridge and are set to something invalid.  10.1.1.3
> is connected via cross-over cable to eth2 port.  br0 and eth0 are
> connected to my network on the same subnet.
>
> What I'd like:
> - all packets (from the network or local) where destination=10.1.1.3
> to be routed to eth2.
> - otherwise, all traffic from the network to use eth0 for I/O.
>
> Basically, I want to specify that ONLY traffic for 10.1.1.3 is to use eth2.

I may be missing something, but this seems trivial

define br0 to include eth0 and add 10.1.1.1 to the bridge (br0:0 for example)

then the normal bridgeing code will limit traffic out eth2 to stuff destined for 
10.1.1.3 or stuff that the bridgeing code doesn't know where it goes.

if this isn't good enough you can use iptables to put additional filters on the 
bridge port (search for bridge + iptables and you should find lots of 
documentation on how to do this)

David Lang

