From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Delay in responding caused by netfilter ?
Date: Fri, 29 Apr 2005 09:37:49 -0400
Message-ID: <200504290937.49507.Alistair@nerdnet.ca>
References: <42721F84.6080503@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42721F84.6080503@mnemon.de>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On April 29, 2005 07:50 am, J=F6rg Harmuth wrote:
> Hi all,
>
> Situation:
>
> 2 independant servers, one running RH7.2, the other SuSE8.1, with the
> same symptoms. There is a delay between the TCP/IP habdshake and the
> server greeting of 26 seconds (SuSE) or 32 seconds respectively (RH).
> Indeed everything is working, but there is this delay. Some tcpdump:
>
> tcpdump -n -i bond1 'tcp[1] =3D=3D 110 or tcp[3] =3D=3D 110'
> tcpdump: listening on bond1

	This gets us the connection you are looking at, but drops anything else.  =
So=20
=2D- we can't see things that MIGHT be going wrong.
>
> 13:25:24.835287 10.10.10.100.60719 > 81.169.151.156.110: S \
> 3714172130:3714172130(0) win 5840 <mss 1460,sackOK,timestamp \
> 335589204 0,nop,wscale 0> (DF) [tos 0x10]
>
> 13:25:24.879667 81.169.151.156.110 > 10.10.10.100.60719: S \
> 2643711030:2643711030(0) ack 3714172131 win 5792 <mss \
> 1460,sackOK,timestamp 17886154 335589204,nop,wscale 0> (DF)
>
> 13:25:24.879702 10.10.10.100.60719 > 81.169.151.156.110: . ack 1 win \
>     5840 <nop,nop,timestamp 335589209 17886154> (DF) [tos 0x10]
>
> 13:25:50.964202 81.169.151.156.110 > 10.10.10.100.60719: P 1:35(34) \
> ack  1 win 5792 <nop,nop,timestamp 17888762 335589209> (DF)
>
> 13:25:50.964224 10.10.10.100.60719 > 81.169.151.156.110: . ack 35 \
> win 5840 <nop,nop,timestamp 335591818 17888762> (DF) [tos 0x10]
>

I'm wondering if that pop3 server is trying to do an identd check on the=20
connection that is getting *b0rked* with the firewall up.  Try that dump=20
again and loosen the filter a tad.
=09
> ...
>
> This seems to concern only services that are started by inetd, so I
> thought inetd would cause this delay. But when I empty the chains (only
> having a default policy of ACCEPT, nothing more) this delay vanishes and
> everything is working as expected.

	That might be part of the problem, but thing of what inetd/xinetd might be=
=20
doing to authenticate the connection before they start the server.
>
> Complete ruleset:
>
> *filter
>
> :INPUT DROP [343:76556]
> :FORWARD DROP [0:0]
> :OUTPUT DROP [1648:107018]
>
> -A INPUT -i lo -j ACCEPT
> -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22222 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 443 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 25 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 110 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 80 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 22 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 21 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 990 -m state --state NEW \
>    --tcp-flags SYN,RST,ACK SYN  -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 21000:21199 -m state \
>    --state NEW --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A INPUT -p udp -m udp --dport 53 -j ACCEPT
> -A INPUT -p udp -m udp --dport 123 -j ACCEPT
> -A INPUT -p udp -m udp --sport 53 -j ACCEPT
> -A OUTPUT -o lo -j ACCEPT
> -A OUTPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A OUTPUT -p udp -m udp --sport 123 -j ACCEPT
> -A OUTPUT -p udp -m udp --sport 53 -j ACCEPT
> -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
> COMMIT
>
> Nothing complicated in my eyes. I have absolutely no idea how this tiny
> ruleset can cause such delays or - at least - is involved in this.
>
> Any ideas are highly welcome.
>
> Thanks and have a nice time,
>
> Joerg

