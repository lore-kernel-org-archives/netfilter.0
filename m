From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: (no subject)
Date: 04 Sep 2004 17:40:59 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094307051.1336.1.camel@nostromo.bgsecm.com>
References: <20040904091428.DDHI9678.mta06-svc.ntlworld.com@[81.108.122.237]>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040904091428.DDHI9678.mta06-svc.ntlworld.com@[81.108.122.237]>
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
To: Newbie <netfilter@lists.netfilter.org>

El sáb, 04 de 09 de 2004 a las 11:12, Newbie escribió:
> Hi,
>  
> I am not an expert in the whole packet filtering thing (hence my nickname), but I have heard previously, that it is possible to send a 'fake packet'. By this, I mean that lets say the packet header is a TCP packet, whereas the body content is something nasty. Does IP tables filter this sort of packet, or would it be more down to the IDS such as snort?
> 
> Thanks
> 
> Antony

Iptables rules usually don't inspect the content of the packet, and even
when using 'string' or something similar the inspection is very basic,
besides the body data can be coded in many ways (HTTP is an example)
that can fool 'string'. You need an IDS that reassembles the sessions
and inspects them to see if the content of the packet is really
'nasty'.


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


