From: Khoa Nguyen <khoa.coffee@gmail.com>
Subject: Re: SNAT round-robin broken?
Date: Wed, 15 Feb 2006 16:47:27 -0500
Message-ID: <3d00e6dc0602151347w1955521bn814bd68fb93dc58d@mail.gmail.com>
References: <3d00e6dc0602100722l482ae14naa0964f58fb83753@mail.gmail.com>
	<200602132145.27983@krak>
	<3d00e6dc0602131301y75cf0398y8c887289b8c994d3@mail.gmail.com>
	<200602132230.48764@krak>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602132230.48764@krak>
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
Content-Type: text/plain; charset="us-ascii"
To: KOVACS Krisztian <hidden@sch.bme.hu>
Cc: netfilter@lists.netfilter.org

On 2/13/06, KOVACS Krisztian <hidden@sch.bme.hu> wrote:
>
>   Hi,

> > Before 2.6.11 kernel, the SNAT box was mapping every new socket from
> > the Client to a new source IP address. With this, I was able to
> > simulate several thousands "virtual" clients. Now with the new
> > behaviour, every socket from the Client to the Server is mapped to the
> > same random but fixed source IP address.
> > ... Is there any way I can achieve the previous behaviour without modif=
ying the kernel
> > source code :-( or downgrading to a pre-2.6.11 kernel?
>
>   I see. Well, I don't think this is possible without modifying the kerne=
l
> source.
> ...
>  About the kernel: take a look at
> find_best_ips_proto() in ip_nat_core.c. At the end of the function
> there's a jhash_2words() call, this is responsible for choosing an IP
> inside the address range specified. You could easily modify it to produce
> a hash value based on the (src, src port, dst) tuple instead of just
> (src, dst).
>
> --
>  KOVACS Krisztian
>

Hi,

Thanks for your suggestion. I modified the kernel source with
jhash_3words(src, port, dst) and now my SNAT box is snat'in per
socket. Very cool!

Thanks again.
Khoa

