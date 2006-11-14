From: bill <cluster.bill@alinto.com>
Subject: Re: Iptables for load balancing internet traffic
Date: Tue, 14 Nov 2006 09:32:43 +0100
Message-ID: <45597F2B.4060101@alinto.com>
References: <4558A3B8.9080905@hostway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4558A3B8.9080905@hostway.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Danny a =E9crit :
> Is there a perfect solution to use iptables for load balancing outgoing=20
> internet traffic ?
>=20
> I am using Debian Sarge 3.1 [ kernel 2.4.27 ] [ iptables v1.2.11 ]  I=20
> chose this kernel specifically for this purpose.
>=20
> I have tried the below 2 techniques  : -
> 1 > Tried using random patch
> 2> Tried using nth patch

And did you tried the CLUSTERIP target?
    CLUSTERIP
This module allows you to configure a  simple  cluster  of  nodes  that
share a certain IP and MAC address without an explicit load balancer in
front of them.  Connections  are  statically  distributed  between  the
nodes in this cluster.

