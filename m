From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: iptables 1.2.11
Date: 28 Aug 2004 18:59:14 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093706059.12157.33.camel@nostromo.bgsecm.com>
References: <200408281038.56978.pandre@darkstar.nom.za>
	<200408281044.20001.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200408281044.20001.pandre@darkstar.nom.za>
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

El sáb, 28 de 08 de 2004 a las 10:44, Paulo Andre escribió:
> On 28/08/2004 10:38, Paulo Andre wrote:
> > I have just installed a new kernel (2.4.27).
> > I patched the kernel to handle pptp/gre conntrack.
> > I also installed iptables 1.2.11 on this server, after the kernel build I
> > installed iptables and that went through fine.
> >
> > When I restart the server the new kernel works great, but iptables gives me
> > an error of 'iptables: Invalid argument' for any -t nat rules.
> > Have I missed an option on the kernel rebuild?
> >
> > Paulo
> 
> To add to this, I have then rebooted the server and gone back to the old 
> kernel and still I have problems with the iptables when trying to add '-t 
> nat' rules.
> 
> Paulo

You have to patch with patch-o-matic ng the kernel and the userspace
(iptables) source code and then compile them. Both need to have the
same code patched, if one of them has code different from the other
(another patch-o-matic patch) then you will have problems.


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


