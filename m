From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: pptp + iptables MTU ???
Date: Sun, 15 Sep 2002 15:03:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020915140326.SRYC11421.mta03-svc.ntlworld.com@there>
References: <20020913173529.41af8435.pulsar@bofh.homeunix.org> <20020915111113.OSCA14766.mta05-svc.ntlworld.com@there> <3D8491CE.1010100@bewegungsmelder.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8491CE.1010100@bewegungsmelder.de>
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

On Sunday 15 September 2002 2:57 pm, Thomas Lussnig wrote:

> >>i have one question, when TCP packet's where send the filter change the
> >>MTU sice (T-Error.com problem)
> >>But i do not acivate such an rule for UDP or GRE Protocol. Is it
> >>possible that this is the source for the
> >>problems with pptp conection over an maserading server ?
> >
> >MTU applies to IP packets, not specifically to TCP packets (which are a
> >particular form of data inside an IP packet).
> >
> >UDP and GRE are also transported inside IP packets, so if you need to set
> > the MTU on your external interface to get TCP/IP packets to work, I think
> > you should do the same thing for UDP/IP and GRE/IP packets too.
> >
> >Antony.
>
> Hi,
> i used this as an entry in the iptables. its mentioned in most of the
> examples. But i think it do not work for UPD and GRE.

Why do you think that ?

> This was the question if GRE / UDP need such spezial handling
> to maybe this is the problem for the failed pptp connections ?

I do not *know* whether UDP or GRE require MSS/MTU adjustments.   However I 
do know that fragmentation / MTU is handled at the IP level, which is common 
to all of TCP / UDP / GRE protocols, so I don't see why it should be specific 
to TCP.

Maybe someone else who either knows more about this than I do, or who has a 
connection which has to use MTU / MSS adjustments, can comment on this ?

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

