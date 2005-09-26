From: "David Leangen" <dleangen@canada.com>
Subject: RE: Confirm: letting certain packages pass through un-natted
Date: Tue, 27 Sep 2005 07:44:01 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAIEDLBHAB.dleangen@canada.com>
References: <4337C0C6.5040606@rdc.pl>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4337C0C6.5040606@rdc.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello!

> > -A PREROUTING -s 192.168.0.0/16 -d 192.168.1.1 -j ACCEPT
> >=20
> > Shouldn't all packets, including ICMP packets, get passed through to =

> > 192.168.1.1 if originating from the local network?
>=20
> Not necesarily.
> Even if you pass the packet in nat table, you still might drop it in=20
> filter table. I know the ACCEPT target may be used in every (?) table, =

> but it's a matter of good practice to filter packets in filter tables=20
> and nat in nat tables and so on. So I would suggest moving this from =
nat=20
> table to filter table and from PREROUTING to FORWARD.

Good point... I'll do just that. Thanks!!

BTW, where can I find out more about "good practices"?



