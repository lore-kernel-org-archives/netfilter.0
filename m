From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: RE: Iptables error
Date: 25 Aug 2004 21:25:22 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093444934.26740.8.camel@nostromo.bgsecm.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90512D0@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512D0@asimail2.alphanumeric.com>
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

El mié, 25 de 08 de 2004 a las 14:56, Jason Opperisano escribió:
> > This morning I rebooted one of our firewalls, I have created a new kernel for
> > it (2.4.20, patched kernel with latest p-o-m ng).
> > When I run my firewall script, all I get is errors, seems to be a problem with
> > iptables 'tables' as none of the rules are create but the default policies
> > are in place, in dmesg I have the following error:
> >
> > ip_tables: table screwed up!
> >
> > This firewall is a production server and I can only really take it down
> > tonight to check it, anyone had something like this before?
> >
> > Paulo
> 
> sounds to me like you applied p-o-m, rebuilt your kernel, but did not rebuild your userspace.  anytime you apply a patch from pom that changes structures, or requires additional libraries, you need to recompile your userspace iptables utilities.  since it's unclear to me when the userspace rebuild is required--i do it everytime.  sounds like it was in this case for you...
> 
> -j
> 

I also agree the problem could be that you have not recompiled the
userspace utils, but it's strage, because I think p-o-m use to ask
for the iptables sources to be executed. Maybe you have a too old
version of iptables or maybe the p-o-m ng it's too new for your
quite old (2.4.20) kernel. Why don't updating the iptables to the
last version and also the kernel to 2.4.27 so you have to recompile
both of them?

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


