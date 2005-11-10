From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 17:44:16 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511101739320.30250@blackhole.kfki.hu>
References: <4372A919.8020100@rosi-kessel.org>
	<20051110101539.GA12934@casa.e-den.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051110101539.GA12934@casa.e-den.it>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sandro Dentella <sandro@e-den.it>
Cc: netfilter@lists.netfilter.org

On Thu, 10 Nov 2005, Sandro Dentella wrote:

> On Wed, Nov 09, 2005 at 08:57:45PM -0500, Adam Rosi-Kessel wrote:
> > I'm troubeshooting an issue of accessing a VPN through NAT. Right now the
> > problem can be reduced to the following question:
> >
> > Under what conditions would inbound packets not be routing through the nat
> > PREROUTING chain?
>
> That's a problem that puzzles me too.

Packets which cannot be associated with any existing connection
known by the conntrack subsystem will traverse the NAT table.

If a packet is related to any connection, which can mean:

- the packet belongs to a connection
- it is an ICMP error packet about a connection
- it is a packet of a channel (like FTP data), which can be
  associated to a connection by an appropriate helper module

then that packet won't enter the NAT table.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

