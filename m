From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: traceroute
Date: Thu, 1 Jul 2004 11:21:15 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0407011119540.29206-100000@blackhole.kfki.hu>
References: <200406302339.02075.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406302339.02075.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 30 Jun 2004, Antony Stone wrote:

> On Wednesday 30 June 2004 11:36 pm, Florian Boelstler wrote:
>
> > > Tell us how you handle NEW packets leaving the machine.
> >
> > By looking at other posts in this thread I've learned that traceroutes
> > are done with echo-requests. Is this true for Linux 2.6.6 ?
>
> No, that's true for Windows systems.   Unix machines (Linux included) uses
> high-port numbered UDP packets.
>
> Therefore you need to allow UDP packets to leave your machine for you to be
> able to run traceroute from it.

Actually UDP based traceroute uses ports in the range 33434-33523.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


