From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: patch problem
Date: 06 Sep 2004 17:58:45 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094476702.11817.9.camel@nostromo.bgsecm.com>
References: <3042.81.10.7.114.1094473696.squirrel@81.10.7.114>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3042.81.10.7.114.1094473696.squirrel@81.10.7.114>
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

El lun, 06 de 09 de 2004 a las 14:28, alaadin@alaadin.org escribió:
> Hello,
> 
> i am using iptables1.2.9
> with kernel2.6.5
> and i read in the website that there is a problem
> when using kernel2.6.x with iptables ..
> but i searched for patches to download ..
> but i didnot find any patches..
> so how to fix this problem ?
> can i fix this problem
> by download iptables.1.2.11 ?
> or by updating my kernel ?
> or by installing patches ?
> and how to install the patch of this problem
> please help ....
> 
> 

The most obvious advice would be to update the iptables to 1.2.11 and
patch it and the kernel with the last patch-o-matic ng, that should
solve the problem, as the Netfilter guys are always updating their
patch-o-matic to solve any problem with their code in the kernel.


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


