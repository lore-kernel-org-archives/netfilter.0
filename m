From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: Re: question on rating SYN packets
Date: Sat, 8 Feb 2003 16:23:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009501c2cfa7$95624a50$3201a8c0@ESTACAO>
References: <002b01c2cef4$74f9b860$3201a8c0@ESTACAO> <3E440D73.6010107@maximum-linux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter ML <netfilter@lists.samba.org>


    I already do limit of parallel connections. But I'd also like to limit
the number of NEW connections from EACH host.

    Let's suppose I'll allow 10 parallel connections per host per port.
That's easy with iplimit. But I'd also like to limit 1 new connection per
second. So a single host wouldnt establish 10 new connections in 1 second,
for example. I'd like to allow 10 connections in parallel ( iplimit does
this ) and 1 new connection per second PER host ( this I dont know how to
do ).

    Is this possible, somehow, with iptables ?

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "uniplex" <uniplex@maximum-linux.net>
To: "Leonardo Rodrigues Magalh=E3es" <leolistas@solucoesip.net>
Cc: "netfilter ML" <netfilter@lists.samba.org>
Sent: Friday, February 07, 2003 4:48 PM
Subject: Re: question on rating SYN packets


Leonardo Rodrigues Magalh=E3es wrote:
>     Hello Guys,
>
>     I'm trying to modify my script firewalls for not allowing a LOT of
> connections being established on a specific port in a very small period of
> time. I know I could easily do this using a rule like:
>
> iptables -A INPUT -p tcp --dport XX -m state --state NEW -m limit --limit
> Y/s -j ACCEPT
>     Altough, with this rule, I would be globally limiting connections for
> that specific port in Y connections per second. I would like to know if
it's
> possible building a rule that would allow, for example, 1 SYN packet per
> second PER host. In this case, I wouldnt have a 'global' limit of SYN
> packets. In fact, I would have a SYN limitation for EACH host.
>
>     Question: is it possible for building a rule like this ? Is there any
> filter on patch-o-matic tree that would allow this kind of rule ?
>
>

this doesn't do rate limiting but it does limit the number of parallel
connections from any one IP address. This example limits parallel
connections to 10 per IP.

iptables -A INPUT -i eth0 -p tcp --syn --dport XX -m iplimit
-iplimit-above 10 -j DROP



