From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: need help in rate limiting tcp-syn !!
Date: Sat, 29 Jun 2002 23:48:09 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020629224811.VUSB295.mta03-svc.ntlworld.com@there>
References: <20020629205619.20469.qmail@webmail6.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020629205619.20469.qmail@webmail6.rediffmail.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Saturday 29 June 2002 9:56 pm, ganesh kumar godavari wrote:

>  hello group,
> =A0 i have attached my shell code to limit the =A0ping-icmp and
> tcp-syn and tcp-portscan protection. i need some help in this
> matter.
>
> i am not able to limit the incoming tcp-syn packet and port scan
> packets done using nmap.
>
> i used nmap -sS -O -P0 -p1-15 <host name> for port scanning, nmap
> -sS -O -P0 <host name> for syn flooding.

> $IPTABLES -N PORTSCANLIMIT
> $IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST RST =A0
> -m limit --limit $TCPSYNLIMIT --limit-burst $TCPSYNLIMITBURST -j=20
> ACCEPT
> $IPTABLES -A PORTSCANLIMIT -p tcp --tcp-flags SYN,ACK,FIN,RST RST=20
> -j DROP
> $IPTABLES -A PORTSCANLIMIT -j RETURN

You're using -sS with nmap, which sends SYN packets, but your portscanlimit=
=20
rule is looking for packets with the RST flag set.

The option "--tcp-flags SYN,ACK,FIN,RST RST" means "look at the flags SYN, =

ACK, FIN and RST, and match if the RST flag (only) is set".

If you want to match on only the SYN flag being set, then the option should=
=20
read "--tcp-flags SYN,ACK,FIN,RST SYN" (this will ignore the PSH and URG=20
flags).

If you want to match on the SYN flag being set no matter what other flags m=
ay=20
be set as well, use "--tcp-flags SYN SYN".

Remember that this is not the only way of doing a port scan with nmap,=20
however :-)

=20

Antony.

