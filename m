From: Kevin Dwyer <Kevin.Dwyer@algx.net>
Subject: Re: making services invisible
Date: Thu, 10 Oct 2002 10:24:20 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.40.0210101023100.18839-100000@klepto.security.algx.lan>
References: <3DA57D10.8040904@bol.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DA57D10.8040904@bol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julio Cesar Ody <julioody@bol.com.br>
Cc: netfilter@lists.netfilter.org

On Thu, 10 Oct 2002, Julio Cesar Ody transmitted the following:

> Hello. I'm using Slackware 8.1, kernel 2.4.18 and iptables v1.2.7a. I
> blocked external acess to some services using the following rule:
>
> iptables -A INPUT -i ! eth0 -p tcp -m multiport --destination-port
> <port1>,<port2>,<blablabla> -j REJECT
>
> However, when I perform a stealth scan using nmap on my host, I still
> can see them running, but instead of "opened" I get them as "filtered".
> Is there a way to block these results, making the services literally
> invisible ? Appreciate any help, and also any technical information
> (links, docs) regarding the answer.

You need to reply with an RST.

Something like: --reject-with tcp-reset


/* Kevin Dwyer                                Allegiance Internet */
/* network security engineer                   Commerce Center II */
/* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
/* phone: 240-616-2075                        Greenbelt, MD 20770 */
/*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */



