From: John Lange <john.lange@open-it.ca>
Subject: Re: Problems with OUTPUT rules ESTABLISHED,RELATED
Date: Wed, 03 Aug 2005 11:34:28 -0500
Message-ID: <1123086868.12908.295.camel@ws50.darkcore.net>
References: <1123009163.12889.164.camel@ws50.darkcore.net>
	<1123012047.26053.8.camel@localhost>
	<1123016327.12889.200.camel@ws50.darkcore.net>
	<1123045682.26557.47.camel@localhost>  <42F08B14.7030000@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42F08B14.7030000@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg?= Harmuth <harmuth@mnemon.de>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 2005-08-03 at 11:15 +0200, J=F6rg Harmuth wrote:
> 3.) The other box sends the 3rd packet of the handshake =3D> ACK. This
>     packet gets dropped, because there is no rule in INPUR that
>     permits ESTABLISHED packets. At this point the connection is
>     basically dropped.
>=20
> You should be able to see this, when you tcpdump on the respective
> interface, eth0 in this case. Solution: Add the following rule.
>=20
> iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

When I initially summarized my ruleset I was mostly talking about OUTPUT
rules and so I left out the above rule. Keep in mind the packets I have
seen getting dropped are coming FROM my server so the INPUT rules should
not effect them.

> Briefly, the following rules should get you starting:
>=20
> iptables -P INPUT DROP
> ## I don't like - up to you.
> iptables -P OUTPUT DROP
> ## You want this :)
> iptables -P FORWARD DROP
>=20
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED \
>    -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 --syn -j ACCEPT
>=20
> iptables -A OUTPUT -o lo -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED \
>    -j ACCEPT

This is basically exactly what I have which is why its still a mystery
to me why some packets are being dropped coming FROM the web server to
clients.

Regarding "OUTPUT -P DROP"; I used to believe as you do that it was
excessively complicated and not worth it but recently I've changed my
mind.

We have seen a dramatic increase in the number of exploits which target
vulnerable PHP software (mostly phpBB). This exploits invariably launch
a process which makes an outbound connection of some kind where they
receive further code or instructions.

Preventing the exploit is obviously the best thing but the second best
thing is preventing the attacker from being able to utilize it. Blocking
OUTPUT is one of the tools that helps.

Frankly, I think the Linux kernel security model is seriously broken in
this regard. Why the kernel allows any random process to take over ports
with no security check what-so-ever is beyond my understanding but that
is a topic for another list...

See my posting on the linux kernel list here:

http://www.ussg.iu.edu/hypermail/linux/kernel/0310.0/0224.html


--=20
John Lange



