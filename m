From: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Subject: Re: making services invisible
Date: Thu, 10 Oct 2002 11:41:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003001c2706b$20982a50$3201a8c0@leonardo>
References: <3DA57D10.8040904@bol.com.br> <1034257577.1589.2.camel@tech004>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Eric Leblond <eleblond@init-sys.com>, netfilter@lists.netfilter.org


    DROP would make nmap ( or any other scanner ) mark that port as filtered
too. To make services closed and 'invisible' to scanners, you should use '-j
REJECT --reject-with tcp-reset'.

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Eric Leblond" <eleblond@init-sys.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, October 10, 2002 10:46 AM
Subject: Re: making services invisible


On Thu, 2002-10-10 at 15:13, Julio Cesar Ody wrote:
> Hello. I'm using Slackware 8.1, kernel 2.4.18 and iptables v1.2.7a. I
> blocked external acess to some services using the following rule:
>
> iptables -A INPUT -i ! eth0 -p tcp -m multiport --destination-port
> <port1>,<port2>,<blablabla> -j REJECT

Use DROP not REJECT, with REJECT you send an ICMP message, so it's
filtered, not close



