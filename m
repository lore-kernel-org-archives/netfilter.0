From: "filipe_abrantes" <filipe_abrantes@netcabo.pt>
Subject: routing table, sending packets through multiple interfaces
Date: Sun, 11 Apr 2004 04:29:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5CD2BD8F1F23A943BAEBE96AB20C24980549DD64@VS1.hdi.tvcabo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

hi

im not sure if this is the right list to ask this, dont be too harsh one =
me :~


this is my ipv6 routing table

# route -A inet6 -n
Kernel IPv6 routing table
Destination                                 Next Hop                     =
           Flags Metric Ref    Use Iface
::1/128                                     ::                           =
           U     0      0        0 lo
2020::2030/128                              ::                           =
           U     0      49       1 lo
fe80::200:ff:fe00:0/128                     ::                           =
           U     0      0        0 lo
fe80::204:e2ff:fe64:9376/128                ::                           =
           U     0      0        0 lo
fe80::20c:6eff:fe35:6cc2/128                ::                           =
           U     0      0        0 lo
fe80::/64                                   ::                           =
           U     256    0        0 eth0
fe80::/64                                   ::                           =
           U     256    0        0 eth1
fe80::/64                                   ::                           =
           U     256    0        0 aodv0
ff02::1/128                                 ::                           =
           U     1024   0        0 eth1
ff02::1/128                                 ::                           =
           U     1024   0        0 eth0
::/0                                        ::                           =
           U     1024   0        0 aodv0


i want packets which destination is ff02::1 to be sent through both eth1 =
and eth0, which doesn't happen with the above configuration...

do i need to set up a socket for each interface(binding the socket to =
that interface) in order to send through both interfaces, or is there =
another way??


thanks a lot for your time

filipe


