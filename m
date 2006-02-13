From: Khoa Nguyen <khoa.coffee@gmail.com>
Subject: Re: SNAT round-robin broken?
Date: Mon, 13 Feb 2006 16:01:07 -0500
Message-ID: <3d00e6dc0602131301y75cf0398y8c887289b8c994d3@mail.gmail.com>
References: <3d00e6dc0602100722l482ae14naa0964f58fb83753@mail.gmail.com>
	<200602102212.22491@krak>
	<3d00e6dc0602130610j3ccc1c2cseaf06598999ab0b2@mail.gmail.com>
	<200602132145.27983@krak>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602132145.27983@krak>
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
>
>   Unfortunately not, at least not without modifying the source code :) Th=
e
> behaviour of the NAT code changed when Rusty's NAT simplifications were
> merged in 2.6.11. I personally think this new behaviour is better than
> the old one, as it provides increased performance and better cooperation
> with load balancing solutions and other NAT-sensitive equipment.
>
>   Why exactly do you want to achieve the round-robin behaviour for one
> internal IP?
>
> --
>  KOVACS Krisztian
>
Hi,

Thanks for your response. I would like to simulate thousands of
clients with the following setup in order to stress test our in-house
product:

Client ---> SNAT box ---> In-house Gateway --> Server

Before 2.6.11 kernel, the SNAT box was mapping every new socket from
the Client to a new source IP address. With this, I was able to
simulate several thousands "virtual" clients. Now with the new
behaviour, every socket from the Client to the Server is mapped to the
same random but fixed source IP address. I am sure the new NAT
implementation is better and cleaner than the old one, but it also
takes away a nice round-robin feature per socket. Is there any way I
can achieve the previous behaviour without modifying the kernel source
code :-( or downgrading to a pre-2.6.11 kernel? (I am writing some
ip_conntrack/ip_nat modules based on the new 2.6.11+ API, so
downgrading the kernel is going to be painful)

Thanks,
Khoa

