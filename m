From: =?ISO-8859-1?Q?Sven-=C5ke_Larsson?= <Sven-Ake.Larsson@hiq.se>
Subject: RE: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 15:41:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31A473DBB655D21180850008C71E251A07D3D60A@mail.kebne.se>
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
To: 'Netfilter ' <netfilter@lists.netfilter.org>

=20
Hi,=20

This is almost off topic, but...
When you finally have the ruleset working, you will still tear your =
hair of
when you try to look at the web site in a MicroWhatever Internet =
Explorer -
especially when the "The page cannot be displayed" message hits your =
face.
Why? Because IE cannot resolve your address if your server is listening =
on
another port than 80, so every time someone tries to connect to your =
site by
typing www.your.domain:8080 without "http://" in the beginning, they =
will
get the error message.=20
Actually, the error appers even if someone types your.domain:80 without =
http
but it almost never happens. Funny, isn't it?

And yes, I have a uge chunk of hair ripped of just above my ears. ;-)

Regards,
S-=C5



-----Original Message-----
From: Antony Stone
To: Netfilter
Sent: 2004-02-18 15:19
Subject: Re: Instructions on how to redirect port 80 to port 8080

On Wednesday 18 February 2004 2:06 pm, Martinez, Michael wrote:

> --> iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 80
> --> -j REDIRECT --to 8080
>
> This isn't working. I can "telnet `hostname` 8080" and get an http
> response, but when I do "telnet `hostname` 80" the response I get is
> "telnet: Unable to connect to remote host: Connection refused."

Given the ruleset you've posted, I don't see how a telnet to 8080 can
work,=20
since you have no INPUT rule allowing packets to that port...

Please flush the counters on your rules using "iptables -Z; iptables -Z
-t=20
nat", connect to port 8080, and then tell us the output of "iptables -L
-nvx;=20
iptables -L -t nat -nvx".

