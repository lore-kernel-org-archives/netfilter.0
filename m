From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset counters question
Date: Mon, 18 Apr 2011 21:07:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104182105530.9202@blackhole.kfki.hu>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu> <4D94224B.4050408@univ-nantes.fr> <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu> <4D94D06C.6070201@univ-nantes.fr> <alpine.DEB.2.00.1103312121170.16841@blackhole.kfki.hu>
 <4D94DC17.4040906@univ-nantes.fr> <4DA69F5F.3010004@univ-nantes.fr> <alpine.DEB.2.00.1104151442240.26797@blackhole.kfki.hu> <4DA843BE.8000800@univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DA843BE.8000800@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Fri, 15 Apr 2011, Jean-Philippe Menil wrote:

> Le 15/04/2011 14:53, Jozsef Kadlecsik a ?crit :
> > 
> > On Thu, 14 Apr 2011, Jean-Philippe Menil wrote:
> > 
> > > Le 31/03/2011 21:55, Jean-Philippe Menil a ?crit :
> > > > That's what i tought, and i needed to be sure.
> > > > 
> > > > As i can miss the counters for the moment, i will kept my rules.
> > > > But as i'm very intereted by ipset, i will think to do otherwise.
> > > I return to this story of counters.
> > > Since, i don't really need some counters, but just to know when there is
> > > no
> > > more traffic for a user to decrement an idle timeout;
> > > i decide to use ipset with the bitmap ip,mac and the timeout value.
> > > 
> > > However, the timeout doesn't do really what i need, i use a dirty hack to
> > > set
> > > the timeout counters every time a packet is matched;
> > > so when there are no more packet, the timeout value begin to decrement.
> > > 
> > > I do this in the bitmap_ipmac_ttest function, i'm just wondering if it is
> > > the
> > > right place to do this?
> > The proper way would be to reset the timeout value by the SET target,
> > which is not supported yet.
> 
> you mean, in the iptables userspace?
> 
> Why not, had a flag like "-idle" in ipset, and reset the timeout to defaults
> when the flag is set?
> 
> I'm just asking this, to be sure to do this properly, even if this request is
> margin.

Both sides need to support the functionality: kernel and userspace.
Before weekend I'll release ipset 6.4 which will support it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
