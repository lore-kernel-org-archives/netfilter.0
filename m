From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to invert more than one destination network?
Date: Mon, 1 Mar 2004 16:25:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011625.49547.Antony@Soft-Solutions.co.uk>
References: <00a101c3ffa8$b9e07730$c800a8c0@cyclelogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a101c3ffa8$b9e07730$c800a8c0@cyclelogic.com>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

On Monday 01 March 2004 4:17 pm, Gonzalo Parra wrote:

> Is it that simple?
>
> I had the thought that that would make IPTABLES to masquerade everithing...

You are correct.   See my previous posting for a suggestion on how to do it.

Antony.

> I mean: first rule will say MASQUERADE everything but 192.168.20.0/26 and
> the seccond one will say MASQUERADE everything but 192.168.40.0/26 so every
> IP (even those inside those networks) will always find a rule to go
> MAQUERADED...
>
> -----Original Message-----
> From: Alexis [mailto:alexis@attla.net.ar]
> Sent: Lunes, 01 de Marzo de 2004 12:08 p.m.
> To: gparra@cyclelogic.com
> Cc: Netfilter
> Subject: Re: How to invert more than one destination network?
>
>
> add a new line with the second network :)
>
> On Mon, 2004-03-01 at 12:58, Gonzalo Parra wrote:
> > Hi
> >
> > I have MASQUERADE in a box as a gateway using IPTABLES and I am using
> > that box also for VPN... so for it to work I cant masquerade thaffic
> > that goes to the other side of the VPN...
> >
> > This works for me:
> >
> > IPTABLES -t nat -A POSTROUTING -o $EXTIF -d \! 192.168.20.0/26 -j
> > MASQUERADE
> >
> > but now I have another network at the other side of the VPN
> > (192.168.40.0/26), so how can I invert two networks in the -d???
> >
> > Thanks,
> >
> > Gonzalo Parra
> > Network Administrator
> > Tel: +58 (212) 265-5330
> > Cel: +58 (414) 240-4054
> > Caracas, VE
> > .....................................

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


