From: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Subject: Re: TCPMSS workaround on OUTPUT?
Date: Thu, 26 Sep 2002 22:56:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D937473.4000504@bewegungsmelder.de>
References: <1033056377.562.49.camel@maximus>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: John Hawley <jhawley@bgea.org>
Cc: Netfilter List <netfilter@lists.netfilter.org>

John Hawley wrote:

>Hello.
>
>I've been trying to figure out the solution to the old "unable to browse
>to certain web site" problem for the past several days.  Am on kernel
>2.4.19, iptables version 1.2.6a, on a Debian machine.
>
>I have ipt_TCPMSS and ipt_tcpmss loaded as modules, with all the other
>netfilter related stuff compiled into the kernel.
>
>I inserted this line into my iptables.rules:
>
>iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
>-j TCPMSS --clamp-mss-to-pmtu
>
>Now, this does seem to have fixed it for clients behind this firewall.
>
>The question is, how do I fix this for the firewall machine itself?=20
>Iptables does seem to accept the above rule for the OUTPUT chain, but
>seems to have no effect.
>
>The reason it'd be nice for this to work is that this is for a small
>remote office in which we have Squid running on the firewall machine.  I
>had to turn Squid off since the FORWARD chain fix obviously wouldn't
>apply here.
>
>Any suggestions?
>
Hi,
first your entry is working, but i think that the filter could=20
"--tcp-flags SYN,RST,ACK SYN"
Because "ACK,SYN" as part 2 of the handshake there the MSS should=20
already be known.
And i think that you should tell the direction (-o ppp+ maybe)

Local packages should know the correct size since the interface (DSL=20
maybe) have the correct mtu.

Examplke
 > ip ad li ppp0
19: ppp0: <POINTOPOINT,MULTICAST,NOARP,UP> mtu 1492 qdisc cbq qlen 3
    link/ppp
    inet 217.233.244.33 peer 217.5.98.168/32 scope global ppp0

Try this
ip ro ch 10.0.1.0/24 dev eth1 advmss 1490
on my networked this make all things working nice WITHOUT the=20
clamp-mss-to-pmtu iptables entry.

Cu Thomas Lu=DFnig



