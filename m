From: "Bassam Abdul Munim" <bassam@palettemm.com>
Subject: RE: How to install patch-o-matic
Date: Tue, 31 Aug 2004 21:17:35 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <WorldClient-F200408312117.AA17350016@palettemm.com>
References: <D5C9032B2B09C64EA2409D6214E91AC9064210@asimail2.alphanumeric.com>
	<1093705364.12157.16.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093705364.12157.16.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: netfilter-bounces@lists.netfilter.org, Jose Maria Lopez <jkerouac@eresmas.com>, netfilter@lists.netfilter.org

Hi Again,
   I started patching the patch-o-matic-ng-20040302 against my red hat 9 
with kernel 2.4.20-8 and iptables-1.2.11 by doing certain steps as 
follows, but I am still not prompted to install the "pptp-conntrck-nat". 
I started by installing the pending patches and hence I wrote the 
following instruction (please correct for if I am mistaken)

#KERNEL_DIR=/usr/src/linux-2.4.20-8 ./runme pending

I have prompted to enter the iptables user space path and again I have 
prompted to install three patches but only one of them "nf-log" can be 
installed and the other 2 patches cannot because of missing files. A 
summary report as follows:

The "init_conntrack-optimize" patch ---> cannot apply (1 missing files)
The "linuxdoc" patch         ---> cannot apply (6 missing files)
The "nf-log" patch         ---> can apply

so that I installed the "nf-log" patch only. Now do I need to forcely 
install the other two patches "init_conntrack-optimize" and "linuxdoc" 
here?

After that I started installing the patches in extra repository by 
writing the following instruction

#KERNEL_DIR=/usr/src/linux-2.4.20-8 ./runme extra

here again I prompted to enter the iptables user space path, and again I 
prompted to install again the three patches in pending 
repository "init_conntrack-optimize", "linuxdoc" and "nf-log".

so here I don't know what to do. Do I need to skip by pressing N key, or 
walk forward to the next patch by pressing W key???

after that I proceeded by pressing the W key, but unfortunately I have 
never prompted to install the "pptp-conntrack-nat" patch, but I prompted 
for most of the patches inside the directory /usr/src/patch-o-matic-ng-
20040302 


So any one can help and direct me on how to install the "pptp-conntrack-
nat"

Your help is highly appreciated

Warm Regard
Bassam






-----Original Message-----
From: Jose Maria Lopez <jkerouac@eresmas.com>
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Date: 28 Aug 2004 18:59:06 +0200
Subject: RE: How to install patch-o-matic

> El sáb, 28 de 08 de 2004 a las 16:42, Jason Opperisano escribió:
> 
> > >       Short answer is yes.
> > >
> > >       iptables userspace refers to the iptables code itself that is
> NOT part of the
> > > kernel (kernelspace)
> > >       Thus the iptables package itself.
> > 
> > and regarding the order:  patch & recompile kernel, then recompile
> userspace.  the userspace tools are compiled against the kernel
> sources, and detect the patches you have applied.
> > 
> > -j
> 
> What really happens it's that the userspace tools (iptables) are
> patched
> too, they are not compiled against the kernel, both are patched at the
> same time but in a separate way.
> 
> -- 
> Jose Maria Lopez Hernandez
> Director Tecnico de bgSEC
> jkerouac@bgsec.com
> bgSEC Seguridad y Consultoria de Sistemas Informaticos
> http://www.bgsec.com
> ESPAÑA
> 
> The only people for me are the mad ones -- the ones who are mad to
> live,
> mad to talk, mad to be saved, desirous of everything at the same time,
> the ones who never yawn or say a commonplace thing, but burn, burn,
> burn
> like fabulous yellow Roman candles.
>                 -- Jack Kerouac, "On the Road"


