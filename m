From: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 12:23:17 +0100
Message-ID: <X8d5JZT5cmBFUvNA@flatwhite>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
 <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fatih USTA <fatihusta86@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Wed, Dec 02, 2020 at 07:26:46AM +0300, Fatih USTA wrote:
> > > On Tue, Dec 1, 2020 at 1:19 PM Marcin Szewczyk <marcin.szewczyk@wodny.org> wrote:
> > > > Brian Aanderud on 23 Mar 2015 wrote:
> > > > > What must I do to get the multicast frames routed out a 'different'
> > > > > interface from the default one after applying a fwmark in iptables the
> > > > > routing table?  I am able to do this with unicast with a combination
> > > > > of 'ip rule', 'ip route' to a different table, and iptables to apply a
> > > > > 'mark'.  But, the marked multicast frames never seem to follow the
> > > > > other routing table's routes.
> > > > > [...]

> > > > I've stumbled upon the same problem as the one discussed over 5 years
> > > > ago (with no answer) on this mailing list[1], ie. locally generated
> > > > multicast and broadcast traffic do not seem to follow policy routing
> > > > when it is constructed using `iptables --set-mark` and `ip rule fwmark`.
> > > > [...]
> > > > Can anyone suggest if I am trying to do something that just should not
> > > > work, am I missing some small but vital detail or is it some kind of a
> > > > bug?
> > > >
> > > > [...]
> > > > [1]: https://marc.info/?l=netfilter&m=142714167809246&w=2
> > > > [2]: https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

> By default, the multicast packet TTL 1. Have you changed the TTL?
> Otherwise, the routing cannot be made because the packet's life is over.

Increasing TTL doesn't seem to change anything. For broadcast it was
already 64.

Testing with:
- nc -nvbu 255.255.255.255 2000
- nc -nvbu 255.255.255.255 3000
- nc -nvbu 239.1.1.1 2000
- nc -nvbu 239.1.1.1 3000

This works:

    # ip rule
    0:	from all lookup local
    30000:	from all dport 3000 lookup test
    32766:	from all lookup main
    32767:	from all lookup default

This does not:

    # ip rule
    0:	from all lookup local
    30000:	from all fwmark 0x1 lookup test
    32766:	from all lookup main
    32767:	from all lookup default

For both iptables rules are:

    # iptables -L OUTPUT -n -v -t mangle
    Chain OUTPUT (policy ACCEPT 12M packets, 1507M bytes)
     pkts bytes target     prot opt in     out     source               destination
        4   128 TTL        udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:3000 TTL set to 32
        4   128 MARK       udp  --  *      *       0.0.0.0/0            0.0.0.0/0            udp dpt:3000 MARK set 0x1

The test table and interfaces:

    # ip route show table test
    default dev wlp2s0.2 scope link

    # ip -br -4 addr | grep wlp2s0
    wlp2s0           UP             192.168.1.32/24 
    wlp2s0.2@wlp2s0  UP             192.168.20.20/24

    # ip -d link show dev wlp2s0
    3: wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DORMANT group default qlen 1000
        link/ether 00:c2:c6:1d:39:e5 brd ff:ff:ff:ff:ff:ff promiscuity 0 minmtu 256 maxmtu 2304 addrgenmode none numtxqueues 4 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535 

    # ip -d link show dev wlp2s0.2
    10: wlp2s0.2@wlp2s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
        link/ether 00:c2:c6:1d:39:e5 brd ff:ff:ff:ff:ff:ff promiscuity 0 minmtu 0 maxmtu 65535 
        vlan protocol 802.1Q id 2 <REORDER_HDR> addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535 
    



tcpdump results for the working `ip rule dport` solution (dport 3000 is
sent on VLAN 2):

    11:59:23.301939 00:c2:c6:1d:39:e5 > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 46: (tos 0x0, ttl 64, id 15506, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.1.32.37387 > 255.255.255.255.2000: UDP, length 4
            0x0000:  4500 0020 3c92 4000 4011 3c73 c0a8 0120  E...<.@.@.<s....
            0x0010:  ffff ffff 920b 07d0 000c ceb8 666f 6f0a  ............foo.
    11:59:26.485132 00:c2:c6:1d:39:e5 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 50: vlan 2, p 0, ethertype IPv4, (tos 0x0, ttl 32, id 44759, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.20.20.51634 > 255.255.255.255.3000: UDP, length 4
            0x0000:  4500 0020 aed7 4000 2011 d739 c0a8 1414  E.....@....9....
            0x0010:  ffff ffff c9b2 0bb8 000c 8143 6261 720a  ...........Cbar.

    12:05:42.945432 00:c2:c6:1d:39:e5 > 01:00:5e:01:01:01, ethertype IPv4 (0x0800), length 46: (tos 0x0, ttl 1, id 20557, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.1.32.51491 > 239.1.1.1.2000: UDP, length 4
            0x0000:  4500 0020 504d 4000 0111 77b5 c0a8 0120  E...PM@...w.....
            0x0010:  ef01 0101 c923 07d0 000c a79d 666f 6f0a  .....#......foo.
    12:05:56.710881 00:c2:c6:1d:39:e5 > 01:00:5e:01:01:01, ethertype 802.1Q (0x8100), length 50: vlan 2, p 0, ethertype IPv4, (tos 0x0, ttl 32, id 62586, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.20.20.40605 > 239.1.1.1.3000: UDP, length 4
            0x0000:  4500 0020 f47a 4000 2011 a193 c0a8 1414  E....z@.........
            0x0010:  ef01 0101 9e9d 0bb8 000c bc55 6261 720a  ...........Ubar.



tcpdump results for the non-working `ip rule fwmark` solution
(everything goes without VLAN tag):

    11:57:54.899126 00:c2:c6:1d:39:e5 > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 46: (tos 0x0, ttl 64, id 60815, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.1.32.42413 > 255.255.255.255.2000: UDP, length 4
            0x0000:  4500 0020 ed8f 4000 4011 8b75 c0a8 0120  E.....@.@..u....
            0x0010:  ffff ffff a5ad 07d0 000c bb16 666f 6f0a  ............foo.
    11:57:57.499439 00:c2:c6:1d:39:e5 > ff:ff:ff:ff:ff:ff, ethertype IPv4 (0x0800), length 46: (tos 0x0, ttl 32, id 61431, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.1.32.33153 > 255.255.255.255.3000: UDP, length 4
            0x0000:  4500 0020 eff7 4000 2011 a90d c0a8 0120  E.....@.........
            0x0010:  ffff ffff 8181 0bb8 000c dc68 6261 720a  ...........hbar.

    12:06:35.215904 00:c2:c6:1d:39:e5 > 01:00:5e:01:01:01, ethertype IPv4 (0x0800), length 46: (tos 0x0, ttl 1, id 31632, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.1.32.49461 > 239.1.1.1.2000: UDP, length 4
            0x0000:  4500 0020 7b90 4000 0111 4c72 c0a8 0120  E...{.@...Lr....
            0x0010:  ef01 0101 c135 07d0 000c af8b 666f 6f0a  .....5......foo.
    12:06:39.911621 00:c2:c6:1d:39:e5 > 01:00:5e:01:01:01, ethertype IPv4 (0x0800), length 46: (tos 0x0, ttl 32, id 31890, offset 0, flags [DF], proto UDP (17), length 32)
        192.168.1.32.46976 > 239.1.1.1.3000: UDP, length 4
            0x0000:  4500 0020 7c92 4000 2011 2c70 c0a8 0120  E...|.@...,p....
            0x0010:  ef01 0101 b780 0bb8 000c b666 6261 720a  ...........fbar.




-- 
Marcin Szewczyk
http://wodny.org
