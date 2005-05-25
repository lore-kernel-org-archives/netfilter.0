From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Wed, 25 May 2005 12:25:50 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b1e6f48050525011730fa7e44@mail.gmail.com>
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
To: Leonardo <p0q0b0d@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 25 May 2005, Leonardo wrote:

> Hello to all!
>
> My box does not forward ICMP Fragmentation needed packet to
> its masqueraded clients.
>
> Setup:
> I have a box with 3 nics equipped with kernel 2.6.11 and iptables
> 1.2.11. This box has two gateways, and the net workflow is as follows:
>
> eth0 <---> clients
> eth1 <---> standard internet traffic
> eth2 <---> VPN
>
> Details:
> Traffic on eth2 is masqueraded (required). The problem is that the
> packets (MTU 1500) must be encapsulated in IPSEC packets at the next
> hop where the MTU is the same, therefore the VPN server sends back
> ICMP packet telling that need to frag. ICMP packets are received by my
> box, but not forwarded to clients that continue to send 1500 bytes
> packets. Therefore the VPN site does not open.
>
> Is that a normal behavior? Should I add anything to iptables rules in
> order to make it forwarding ICMP Frag needed packets?
>
> Thank you very much!
>
> Iptables on eth2,eth0:
> Input,Output,Forward
> - Policy ACCEPT (nothing else)
> Only on eth2:
> Nat
> - POSTROUTING anywhere anywhere -j MASQUERADE
>
> Current Workaround:
> - ifconfig eth2 mtu 1400 (I don't like it! :)v


have you a;

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMMS \
- --clacmp-mss-to-ptmu


kind of statment in your rules, often require with VPN/s that work with 
smaller packet sizes due to increasing headers...


Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFClKcQst+vzJSwZikRAg3bAJ93j5nlWUFmQ1a2Ro6+4qCEacwXlQCfUqUP
cRFo0QZX65uSLBaHmh+24AA=
=lScV
-----END PGP SIGNATURE-----

