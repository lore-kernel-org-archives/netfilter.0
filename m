From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: RE: How to install patch-o-matic
Date: 28 Aug 2004 18:59:06 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093705364.12157.16.camel@nostromo.bgsecm.com>
References: <D5C9032B2B09C64EA2409D6214E91AC9064210@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9064210@asimail2.alphanumeric.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El sáb, 28 de 08 de 2004 a las 16:42, Jason Opperisano escribió:

> >       Short answer is yes.
> >
> >       iptables userspace refers to the iptables code itself that is NOT part of the
> > kernel (kernelspace)
> >       Thus the iptables package itself.
> 
> and regarding the order:  patch & recompile kernel, then recompile userspace.  the userspace tools are compiled against the kernel sources, and detect the patches you have applied.
> 
> -j

What really happens it's that the userspace tools (iptables) are patched
too, they are not compiled against the kernel, both are patched at the
same time but in a separate way.

-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


