From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [OT] Was: ESP does not hit the nat table
Date: Mon, 2 Aug 2004 10:03:48 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0408020958300.7180-100000@blackhole.kfki.hu>
References: <200408012328.16124.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408012328.16124.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Sun, 1 Aug 2004, Antony Stone wrote:

> On Sunday 01 August 2004 8:03 pm, Jason Opperisano wrote:
>
> > <OT>
> >  Where is the new-found obsession with dropping packets in the NAT table
> > coming from? </OT>
>
> Indeed.   A few people here have commented recently that they prefer dropping
> stuff in the PREROUTING nat table instead of waiting until it hits INPUT or
> FORWARD, for things like spoofed packets or invalid TCP flag combinations.

And those forget that conntrack has already seen the packets. Better use
the raw table to drop malformed/spoofed packets.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


