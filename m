From: =?iso-8859-2?B?o3VrYXN6IE5pZXJ5Y2izbw==?= <nofast@welnowiec.net>
Subject: IPSET iptree problem
Date: Tue, 15 May 2007 16:24:05 +0200
Message-ID: <op.tsdgyfm7343eys@comnetlap2.biuro.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello everyone,
I would like to ask you to help me with ipset tool
because it works other way I expect when I use "timeout"
parameter.

look:  (this is OK without "--timeout")
[root@rt ~]# ipset -N ts1 iptree
[root@rt ~]# ipset -A ts1 10.10.10.10
[root@rt ~]# ipset -T ts1 10.10.10.10
10.10.10.10 is in set ts1.
[root@rt ~]# ipset -T ts1 10.10.10.1
10.10.10.1 is NOT in set ts1.
[root@rt ~]# ipset -T ts1 10.10.10.255
10.10.10.255 is NOT in set ts1.

My question is what I did wrong here:
"--timeout" is used:

[root@rt ~]# ipset -N ts2 iptree --timeout 100
[root@rt ~]# ipset -A ts2 20.20.20.20
[root@rt ~]# ipset -T ts2 20.20.20.20
20.20.20.20 is in set ts2.
[root@rt ~]# ipset -T ts2 20.20.20.1
20.20.20.1 is in set ts2.
[root@rt ~]# ipset -T ts2 20.20.20.254
20.20.20.254 is in set ts2.
[root@rt ~]# ipset -T ts2 20.20.1.1
20.20.1.1 is NOT in set ts2.

If I use "timeout" then ipset test returns true
to all IPs on subnet 20.20.20.0/24.

Shouldn't this work the same way ( as without "timeout" )?
Is this ok  ?

my linux =3D kernel-2.6.21.1
+ set patch (pom-ng-20070513)
+ ipset-20070514

Help me please
=A3ukasz Nierych=B3o

