From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: Iptables problem
Date: 26 Aug 2004 02:24:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093479665.32580.45.camel@nostromo.bgsecm.com>
References: <001001c48add$26638b80$2400000a@marcelo>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001001c48add$26638b80$2400000a@marcelo>
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

El mié, 25 de 08 de 2004 a las 21:52, Marcelo Sinhorini escribió:
> I use slackware 9.0. I have made the upgrade to the lastest iptables, and now i want to compile the 2.4.27 kernel and enable nat of pptp. I applied the path-o-matic and actvated the option for it. After compile the kernel, almost everything is funcional, but the targets MASQUERADE and SNAT had a problem.. Show an error: Invalid argument. They are Modules and are loaded at the kernel. A frind had the same problem doing the same thing I wanted to do!
> 
> Anyone knows what can i do ?
> 
> 
> Marcelo

Have you applied the p-o-m to the iptables sources and recompiled
it? You must do it if you want to have the new modules working,
maybe that it's the problem.
 
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


