From: darmian martinez <darmianm@yahoo.com.ar>
Subject: Re: SNAT question
Date: Sun, 19 Sep 2004 14:10:18 -0300 (ART)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040919171018.24029.qmail@web61101.mail.yahoo.com>
References: <Pine.NEB.4.60.0409182138520.21976@ukato.freeshell.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.NEB.4.60.0409182138520.21976@ukato.freeshell.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Alexey Toptygin <alexeyt@freeshell.org>
Cc: netfilter@lists.netfilter.org

Alex,
=20
It's doesn't work because NAT rules applies only to new connections, and
the icmp reply packet is part of an "virtual" established connection.
This is my original question, how to make a rule that make a NAT to=20
a packet that belong to already established connection.
=20
thanks you.

Alexey Toptygin <alexeyt@freeshell.org> wrote:
On Fri, 17 Sep 2004, [iso-8859-1] darmian martinez wrote:

> Alexey,
>
> I tried your command, but it says:
> iptables: Target problem

What I meant to say was:

iptables -t nat -A POSTROUTING -s [FIREWALL_IP] -p icmp -j SNAT --to-source
[FAKE_IP]

which applies, but for some reason works only for outgoing requests.


Can someone on the list explain why this:

iptables -t nat -A POSTROUTING -s 192.168.1.9 -p icmp -j SNAT --to-source
10.0.0.1

Causes this:

# tcpdump -nnvl -i eth0 "icmp"
tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 96 by=
tes

17:37:38.781912 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], length: 84)
10.0.0.1 > 192.168.1.2: icmp 64: echo request seq 1

17:37:49.656966 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], length: 84)
192.168.1.181 > 192.168.1.9: icmp 64: echo request seq 1

17:37:49.656988 IP (tos 0x0, ttl 64, id 6381, offset 0, flags [none],
length: 84) 192.168.1.9 > 192.168.1.181: icmp 64: echo reply seq 1

Do locally generated ICMP replies not go through postrouting for some=20
reason? I'm testing with iptables v1.2.9 and Debian kernel 2.6.7-1-k7.

Alexey

		100mb gratis, Antivirus y Antispam
Correo Yahoo!, el mejor correo web del mundo
=A1Tenelo ya!
