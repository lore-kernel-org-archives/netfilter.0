From: alucard@kanux.com
Subject: Re: forwarding
Date: Tue, 18 May 2004 11:40:59 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34253.200.44.170.105.1084894859.squirrel@200.44.170.105>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
    <1084891180.6410.18.camel@localhost>
    <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
    <200405181609.59945.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405181609.59945.Antony@Soft-Solutions.co.uk>
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
Cc: netfilter@lists.netfilter.org

> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use
> Iface
> 192.168.0.0     *               255.255.255.0   U     0      0        0
> eth1
> 10.73.216.0     *               255.255.252.0   U     0      0        0
> eth0
> 169.254.0.0     *               255.255.0.0     U     0      0        0
> eth0
> 127.0.0.0       *               255.0.0.0       U     0      0        0 lo
> default         192.168.0.1     0.0.0.0         UG    0      0        0
> eth1
>
> If the requests come in on eth1 but the replies go out on eth0 that would
> be a
> problem.

well, in server2 -the one that that has to get the packets forwarded from
server1- 192.168 network is in eth1, does anybody see anything wrong with
it's route configuration? any suggestions??

Thanks a lot

