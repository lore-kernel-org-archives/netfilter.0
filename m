From: Balazs Fulop <balazs.fulop@initon.com>
Subject: Re: DNAT not working
Date: Tue, 26 Dec 2006 21:54:48 +0100
Message-ID: <45918C18.50604@initon.com>
References: <458BF3C2.4050700@initon.com> <458C4254.4060007@riverviewtech.net>
	<458C4ABD.6010507@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <458C4ABD.6010507@plouf.fr.eu.org>
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

> You do not need to SNAT/MASQUERADE return traffic. The NAT code does=20
> it implicitly. However, the target host must have a (default) route=20
> back to the outside via the NATing gateway.
>
The default gateway of the NATed machine was not the NATing gateway. The=20
problem is now solved. Thank you very much.

Yours sincerely,
    F=FCl=F6p Bal=E1zs


