From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: learning firewall
Date: 02 Sep 2004 22:31:24 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094157083.16438.17.camel@nostromo.bgsecm.com>
References: <20040902191645.GA28800@omega.lacnic.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902191645.GA28800@omega.lacnic.net.uy>
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

El jue, 02 de 09 de 2004 a las 21:16, Pablo Allietti escribió:
> hi all i have a question. 
> 
> exist any soft based in iptables to have the option LEARN ?? 
> 
> example 
> 
> i run snort in my system when detect a intrusion add the ip address to
> the iptables table. 
> 
> exist this ??

I think I remember there such a tool in the snort web site. Look
for it in www.snort.org, but have in mind that this kind of
tools are prone to DOS attacks, because someone can send you
spoofed traffic and you will be blocking IP addresses you don't
want to.

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


