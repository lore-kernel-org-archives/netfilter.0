From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: learning firewall
Date: 03 Sep 2004 19:20:18 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094222078.25616.17.camel@nostromo.bgsecm.com>
References: <20040902191645.GA28800@omega.lacnic.net.uy>
	<20040903102543.GI3755@metastasis.org.uk>
	<1094215486.3029.4.camel@Quark>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094215486.3029.4.camel@Quark>
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

El vie, 03 de 09 de 2004 a las 14:44, Miguel Angel Amador L escribió:
> Hi All,
>  I have a questions, what module i must be install for the P2P
> conections ? (sorry for my english, is very slow)
>  Thnx a lot 
> 
> Regards
>  Miguel Amador L.
> 

The port I use to block P2P (or to allow them if you want) are:

KAZAA 1214/tcp
NAPSTER 8888/tcp 7777/tcp 8875/tcp
EDONKEY/EMULE 4662/tcp 4663/tcp
WINMX 6699/tcp

But have in mind that some of this programs can use SOCKS proxies or
even standard ports like port 80/tcp to send or receive traffic. It
can be a little tricky to stop them (easier to allow them, just open
this ports and they will run).


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


