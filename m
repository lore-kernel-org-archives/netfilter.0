From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problems with ftp
Date: Wed, 18 Sep 2002 08:53:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918075343.IOQQ295.mta06-svc.ntlworld.com@there>
References: <6029A399F5BFD6118BB200104B0DF37302764E@mailgate.dms.lanka.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6029A399F5BFD6118BB200104B0DF37302764E@mailgate.dms.lanka.net>
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
To: netfilter@lists.netfilter.org

On Tuesday 17 September 2002 3:17 pm, Naleendra@dms.lanka.net wrote:

> Hi,
>
> 	First & foremost thanks anthony, telnet works smoothly.
>
> 	You see I am checking the services that I'll be needing one by one
> before by plug in the IPTABLES box in to a running network. Next on line =
is
> FTP. Now I've heard that FTP tends to be a bit bothersome . Listed below =
is
> my FTP ruleset. My connections are refused both ways. Your help is greatly
> appreciated.
>
>    #Allow FTP outbound.
> iptables -A INPUT -i $PPPIF -p tcp --sport 21 -m state --state ESTABLISHED
> -j ACCEPT
>
> iptables -A OUTPUT -o $PPPIF -p tcp --dport 21 -m state --state
> NEW,ESTABLISHED -j ACCEPT
>
> iptables -A INPUT -i $PPPIF -p tcp --sport 20 --dport $UP_PORTS  -m state
> --state ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A OUTPUT -o $PPPIF -p tcp --sport $UP_PORTS --dport 20  -m state
> --state ESTABLISHED -j ACCEPT
>
>  iptables -A INPUT -i $PPPIF -p tcp --sport $UP_PORTS --dport $UP_PORTS  =
-m
> state --state ESTABLISHED -j ACCEPT
>
> iptables -A OUTPUT -o $PPPIF -p tcp --sport $UP_PORTS --dport $UP_PORTS  =
-m
> state --state ESTABLISHED,RELATED -j ACCEPT

You need nothing so complicated.

These rules will allow passive & active ftp outbound:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -p tcp --dport 21 -o $PPPIF -j ACCEPT

That's it.   All the remaining "bothersome" bits about ftp are handled by t=
he=20
RELATED state.   Just make sure you've got all the ftp support bits of=20
netfilter compiled into your kernel, or loaded as modules.

Antony.

--=20

This email is intended for the use of the individual addressee(s) named abo=
ve=20
and may contain information that is confidential, privileged or unsuitable =

for overly sensitive persons with low self-esteem, no sense of humour, or=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar. =A0 Whisk until soft peaks form, then place in a a warm oven =
for=20
40 minutes. =A0 Remove promptly and let stand for 2 hours before adding som=
e=20
decorative kiwi fruit and cream. =A0 Then notify me immediately by return e=
mail=20
and eat the original message.

