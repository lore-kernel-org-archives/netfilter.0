From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I think iptables is not alowing me to connect
Date: Sat, 21 Sep 2002 00:43:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920234330.UPRN17905.mta07-svc.ntlworld.com@there>
References: <001f01c260ce$7e185ad0$2101a8c0@aerowillys> <20020920200354.RYHR292.mta01-svc.ntlworld.com@there> <005501c260ed$d5563eb0$2101a8c0@aerowillys>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005501c260ed$d5563eb0$2101a8c0@aerowillys>
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

On Friday 20 September 2002 10:36 pm, AndreLSM wrote:

> Sorry I was not very clear,
>
> Actualy I removed all iptables rules with:
> iptables -F
> iptables -X
> iptables -Z

Have you removed your nat rules (eg SNAT in the POSTROUTING chain) as well ?

> but adsl still hangs and does not connect.
> Before  I started testing iptables it used to connect quickly.
> My network is like this:
> on eth0:  connection to another computer, ip 192.168.0.1 this is ok
> on eth1: connection to the adsl modem. I know that this device can not be
> initialized on the booting process

What do you mean by this last comment ?

> and I thought that maybe iptables was initializing it, but I removed all
> rules and stopped running the rc.firewall file. This one has dynamic ip.

Are you getting a valid IP address for this interface from your ISP ?

> I know that both network adapters are working fine, so it=B4s not hardware
> problem.

Can you connect to the Internet from the Firewall machine itself (never min=
d=20
the internal machines on your network for now) ?

If you can, then tell us whether you have a SNAT rule in your POSTROUTING=20
chain to allow internal machines to connect out as well.

If you cannot connect from the Firewall machine, then it is not a netfilter=
=20
problem.   Check the hardware and the interface configuration.   Why do you=
=20
say "both network adapters are working fine" ?   How do you know ?   What=20
have you tested ?

Antony.

--=20

This email is intended for the use of the individual addressee(s) named abo=
ve=20
and may contain information that is confidential, privileged or unsuitable =

for overly sensitive persons with low self-esteem, no sense of humour, or=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessert spoonful of=20
caster sugar. =A0 Whisk until soft peaks form, then place in a a warm oven =
for=20
40 minutes. =A0 Remove promptly and let stand for 2 hours before adding som=
e=20
decorative kiwi fruit and cream. =A0 Then notify me immediately by return e=
mail=20
and eat the original message.

