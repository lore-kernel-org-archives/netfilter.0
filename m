From: "Abdul-Wahid Paterson" <abdulwahid@gmail.com>
Subject: Re: creating artificial latency
Date: Sat, 17 Feb 2007 12:42:07 +0300
Message-ID: <995fcdb00702170142o182011e8pbe0278cb806c2813@mail.gmail.com>
References: <995fcdb00702170042u478d6c2arf139d4f05ac6164c@mail.gmail.com>
	<20070218090405.GF32060@slug>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070218090405.GF32060@slug>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frederik Deweerdt <deweerdt@free.fr>, Netfilter List <netfilter@lists.netfilter.org>

Thanks...found it....that looks like what  I need.

Abdul-Wahid

On 2/18/07, Frederik Deweerdt <deweerdt@free.fr> wrote:
> On Sat, Feb 17, 2007 at 11:42:46AM +0300, Abdul-Wahid Paterson wrote:
> > It is probably not the normal thing that people would want to slow
> > down packets but I have to remote sites and have a few different
> > options for connecting them. There is no copper or fibre so I am
> > restricted to certain wireless and satellite systems.
> >
> > I know what the latency of these proposed systems would be but I need
> > to make a realistic evaluation of the different systems in terms of
> > using our in house applications to test what latency would be
> > acceptable for users to actually work effectively.
> >
> > Is there a way using iptables (or another linux method) that I can
> > create artificial latency by adding say 500 msecs to each packet
> > before it is forwarded?
> Hi,
>
> Google for "netem and delay".
>
> Regards,
> Frederik
>
>

