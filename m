From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Patch-o-matic pptp
Date: Mon, 14 Apr 2003 19:26:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030414192635.24b97bd7.arnt@c2i.net>
References: <1050331434.18572.13.camel@tichael.profindy.com>
	<1050333725.11152.247.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050333725.11152.247.camel@tux.rsn.bth.se>
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

On 14 Apr 2003 17:22:05 +0200, 
Martin Josefsson <gandalf@wlug.westbo.se> wrote in message 
<1050333725.11152.247.camel@tux.rsn.bth.se>:

> On Mon, 2003-04-14 at 16:43, Michael Friedhoff wrote:
> > I am trying to run the Patch-o-matic to apply apply the
> > pptp patch.  

.._which_ pptp patch?

> > However, it is not working.  POM fails
> > when it tries to apply the *.h-3 file, *h-4, etc.  I am not
> > able to determine why that is.  I have downloaded
> > the latest version from CVS.This is also my first
> > attempt at using the POM.  It is likely that I am doing
> > something wrong, but am unable to determine what portion
> > of the POM that is failing.
> > 
> > Is it possible to get precompiled modules for this
> > functionality?
> > 
> > I am running:
> > RedHat 8.0
> > Kernel 2.4.18

.._which_ "2.4.18" ???

> > 
> > Hopefully I have supplied enough relevant information.
> 
> You need to apply all pending and submitted patches first.
> You do that like this:
> 
> ./runme --batch pending

..Red Hat's 2.4.18 kernels moan a lot here.

> Then the netfilter part of your kernel should be up to speed with
> what's in 2.4.21-pre and 2.5.x
> 
> The pptp patch depends on this newer stuff.
> 

..uhmmm, well, I _have_ got poptop working on 3 boxes, so I guess 
I can say it can be done, with Red Hat's 2.4.18-whatever, too.

..get modkernel-0.6 or later from poptop.org, prep your new kernel 
the way you want it with patch-o-matic and all, boot into it, then 
do the modkernel things, to get the poptop modules built.  

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


