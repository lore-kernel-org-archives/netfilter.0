From: Luca Bedogni <ml@lucabedogni.it>
Subject: Re: Does netfilter fragments packect exceeding MTU
Date: Fri, 5 Jan 2007 11:59:24 +0100
Message-ID: <200701051159.25078.ml@lucabedogni.it>
References: <200701041321.41095.ml@lucabedogni.it>
	<459D1097.6070903@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <459D1097.6070903@plouf.fr.eu.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thursday 04 January 2007 15:35, Pascal Hambourg wrote:
> Hello,
>
> Luca Bedogni a =E9crit :
> > So i think that if you pass a packet to POSTROUTING taht exceeds MTU,
> > netfilter will try to send it anyway right? Because you have to fragment
> > before, 'cos netfilter doesn't expect a packet exceeding MTU right?
> > But that fragmentation how could be done?
>
> Netfilter does not send packets : it just drops them, mangles them or
> lets them through.

Yes I know that, sorry for my misspelling.

> Disclaimer : I observed the following in the 2.4.18 kernel and cannot
> assert whether it is still true for 2.6 kernels with ip_conntrack or
> nf_conntrack or even for recent 2.4 kernels.
>
> If needed (packet size > output path MTU), the IP stacks fragments :
> - locally generated packets before the NF_IP_LOCAL_OUT Netfilter hook
> (where the iptables OUTPUT chains are located) ;
> - forwarded packets after the NF_IP_FORWARD Netfilter hook (where the
> iptables FORWARD chains are located).
>
> BUT, when the ip_conntrack module is loaded (or built-in), which is
> needed for connection tracking and stateful NAT operation, it can
> perform an extra fragmentation in the NF_IP_POST_ROUTING Netfilter hook
> after the POSTROUTING iptables chains. The reason is ip_conntrack needs
> to reassemble packets first in the NF_IP_LOCAL_OUT Netfilter hook before
> the OUTPUT iptables chains.
>
> You can see all this (and more) in the following diagram :
> http://www.plouf.fr.eu.org/bazar/netfilter/schema_netfilter.txt
>
> So, if you generate a packet of the maximum size for an interface, use
> advanced routing to reroute it to another interface with a smaller MTU
> and ip_conntrack is not present, the packet will not be fragmented. It
> will just be forwarded to the network device driver "as is".

So in fact netfilter, if ip_conntrack is loaded, fragments packet if they=20
exceeds MTU for such interface, and do this after POSTROUTING.
I know we're speaking about kernel 2.4.18, but i think it would be interest=
ing=20
discover what's going on in 2.6.x kernel, if that has changed or not.=20
I'll try do find this out, thank you for your infos :)

Regards
=2D-=20
Debian Powered GNU/Linux User #373118
Bedogni Luca - 	Blog | http://blog.lucabedogni.it
		        Site | http://www.lucabedogni.it
Debianizzati - www.debianizzati.org | Founder Member
=2D-
Book: A non-volatile information storage medium.=20

