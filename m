From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT - TCP_MISS/503
Date: Fri, 8 Nov 2002 13:44:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211081344.gA8DiBe23527@vulcan.rissington.net>
References: <NGBBJHGGHKMOJBIADANIEEMPEFAA.eugenio@imidianet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBJHGGHKMOJBIADANIEEMPEFAA.eugenio@imidianet.com.br>
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
To: netfilter@lists.netfilter.org

On Friday 08 November 2002 9:52 am, Eugenio wrote:

> Hi,
>
> | What webserver did you test ; http://localhost or http://123.0.0.18 ?
> | We don't know anything about your setup so it's quite difficult if not
> | impossible to answer your question.
> | Could you post your iptables rules so that we might be able help you (and
> | please, not the output of : iptables -L, but the actual commands) ?
>
> I did test http://123.0.0.18 and it's Okay! but, http://www.dominio.com.br
> is not okay.
>
> ERROR
>
> The requested URL could not be retrieved
> -------------------------------------------------------------
> While trying to retrieve the URL: http://www.dominio.com.br
>
> The following error was encountered:
>
> Connection Failed
>
> The system returned:
>
>     (111) Connection refused
>
> The remote host or network may be down. Please try the request again.
> Your cache administrator is root.

I think the problem is that you have no OUTPUT rule allowing UDP DNS packets.

Antony.

-- 

Wanted: telepath.   You know where to apply.

