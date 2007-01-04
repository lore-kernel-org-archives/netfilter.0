From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Does netfilter fragments packect exceeding MTU
Date: Thu, 04 Jan 2007 15:35:03 +0100
Message-ID: <459D1097.6070903@plouf.fr.eu.org>
References: <200701041321.41095.ml@lucabedogni.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200701041321.41095.ml@lucabedogni.it>
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

Hello,

Luca Bedogni a =E9crit :
> So i think that if you pass a packet to POSTROUTING taht exceeds MTU,=20
> netfilter will try to send it anyway right? Because you have to fragmen=
t=20
> before, 'cos netfilter doesn't expect a packet exceeding MTU right?
> But that fragmentation how could be done?

Netfilter does not send packets : it just drops them, mangles them or=20
lets them through.

Disclaimer : I observed the following in the 2.4.18 kernel and cannot=20
assert whether it is still true for 2.6 kernels with ip_conntrack or=20
nf_conntrack or even for recent 2.4 kernels.

If needed (packet size > output path MTU), the IP stacks fragments :
- locally generated packets before the NF_IP_LOCAL_OUT Netfilter hook=20
(where the iptables OUTPUT chains are located) ;
- forwarded packets after the NF_IP_FORWARD Netfilter hook (where the=20
iptables FORWARD chains are located).

BUT, when the ip_conntrack module is loaded (or built-in), which is=20
needed for connection tracking and stateful NAT operation, it can=20
perform an extra fragmentation in the NF_IP_POST_ROUTING Netfilter hook=20
after the POSTROUTING iptables chains. The reason is ip_conntrack needs=20
to reassemble packets first in the NF_IP_LOCAL_OUT Netfilter hook before=20
the OUTPUT iptables chains.

You can see all this (and more) in the following diagram :
http://www.plouf.fr.eu.org/bazar/netfilter/schema_netfilter.txt

So, if you generate a packet of the maximum size for an interface, use=20
advanced routing to reroute it to another interface with a smaller MTU=20
and ip_conntrack is not present, the packet will not be fragmented. It=20
will just be forwarded to the network device driver "as is".

