From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Sun, 11 Jan 2004 22:50:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c3d88c$f8d07d20$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <001501c3d6fc$3a889c80$1684188d@Kiste> <000d01c3d885$8181e710$1684188d@Kiste> <200401112107.09764.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> What version of iptables is that?   Is it as up to date as the netfilter
> version you've got in your shiny new kernel?

it is v1.2.6a
i'm not sure which kernels it accepts, theres written
"This version requires kernel >= 2.4.4
This version recommends kernel >= 2.4.18"

> This sounds a little bit dodgy to me....

everything's fine with my tunneling. thats the only thing i'm sure of. and
never the less the underlaying protocol of ppp is of no interest for the
routing/firewalling.

concerning the issue with MASQUERADE in my previous mail, maybe it has
something to do with the "MASQUERADE oops" written in the changelog of
kernel v2.4.24

as 2.4.24 was not working on my router (maybe because of the outdated
iptables, but wasnt in the mood for analysis)  i just step back to 2.4.22
and retry with that. i think fresh versions of iptables and iproute2 cant
hurt either.


