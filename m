From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: failure when using --string
Date: 27 Aug 2004 01:05:50 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093561550.20349.6.camel@nostromo.bgsecm.com>
References: <20040826221740.GE22322@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040826221740.GE22322@metastasis.org.uk>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

El vie, 27 de 08 de 2004 a las 00:17, Nick Drage escribió:
> Hi,
> 
> Any ideas why this would be failing?  It's the example straight out of
> the documentation:
> 
> host# iptables -A INPUT -m string --string 'cmd.exe' -j QUEUE
> iptables: No chain/target/match by that name
> 
> This is on a Debian Stable box.  Is it possible that "-m string" is
> permitted by the userspace tool but the functionality hasn't been
> included in the kernel?

It can be in the userspace iptables, lack of string support in the
kernel or both. If it's in the kernel you should have the module loaded
or at least in your /lib/modules directory. If you have the kernel
support then it's probably an userspace problem.

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


