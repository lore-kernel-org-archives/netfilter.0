From: "Eugenio" <eugenio@imidianet.com.br>
Subject: RE: DNAT - TCP_MISS/503
Date: Thu, 7 Nov 2002 09:08:06 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBJHGGHKMOJBIADANIAEKGEFAA.eugenio@imidianet.com.br>
References: <20021106202553.FSOK9836.mta01-svc.ntlworld.com@there>
Reply-To: <eugenio@imidianet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021106202553.FSOK9836.mta01-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: =?iso-8859-1?Q?C=E1tia_Ferraz?= <catia.ferraz@syngenta.com>


Hi,

Sorry! I think this is a netfilter problem, because I'd stoped my squid
and the problem not stoped.

(If you test localhost IP my web server [123.0.0.18] it's okay!! but
if you test the name of the local domain (wwww.mywebserver.com.br) it's not
okay,
the netscape report this error.)

The access from INTERNET IP or domain name it's Okay, I don't undestant why.

It's probably something with my Iptables CHAIS, what do you think?

Thank in a advanced

Eugenio.

ps.: excuse my bad English.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: quarta-feira, 6 de novembro de 2002 18:26
To: netfilter@lists.netfilter.org
Subject: Re: DNAT - TCP_MISS/503


On Wednesday 06 November 2002 7:05 pm, Eugenio wrote:

> Hi all,
>
> This is my problem!
>
> ERROR
> The requested URL could not be retrieved
>
> The remote host or network may be down. Please try the request again.
> Your cache administrator is root.
>
> ERROR in Log squid.
>
> 1035311411.554     10 123.0.0.1 TCP_MISS/503 999 GET
> http://www.domain_localhost.com.br/ -
> NONE/- -
>
> I don't know correct this problem, please report me what you think
> about this.

I think this is not a netfilter problem.

It's probably something to do with your Squid setup, but I'm not a Squid
expert (and this is not a Squid mailing list...)

Antony.

--

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer


