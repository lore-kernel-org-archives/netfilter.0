From: "RL..." <betolourenco@ig.com.br>
Subject: RES: Linux router/gw box.
Date: Thu, 6 Nov 2003 16:10:03 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ADECIDDLDNKKNFCPIDADIEEKCFAA.betolourenco@ig.com.br>
References: <200311061735.hA6HZwj14113@agate.rockstone.co.uk>
Reply-To: <betolourenco@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311061735.hA6HZwj14113@agate.rockstone.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org


You can set one or two nic=B4s with vlan (802.1q)

And the switch will be very necessary.

...
-----Mensagem original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]Em nome de Antony Stone
Enviada em: quinta-feira, 6 de novembro de 2003 15:36
Para: netfilter@lists.netfilter.org
Assunto: Re: Linux router/gw box.

On Thursday 06 November 2003 5:10 pm, Stephan Viljoen wrote:

> Hi there,
>
> I've build a router for my wireless users which is about 50 customers.
>
> Now each user has it's own subnet

Why?

> which I all added onto one network card.

Okay, you can do that if you want to (but it can cause puzzles, and strange
things to happen if you're not careful).

> How good idea is it to do something like this and is there a
> better way off doing this.

For 50 networks I can't think of another way to do it unless you use a
switch
with VLAN capability, which I guess would be a bit expensive.   Certainly
building a netfilter box with 50 network connections is (a) difficult
(finding the right hardware), and (b) expensive (because you need things
like
PCI backplanes and 4-port network cards).

It's not impossible, but you'd have to really want to do it to try.

> I'm somewhat new to this whole netfiler / ip routing thing.

I think the important question (at least for this mailing list) is:

 - what protection are you trying to provide by using netfilter?

As far as your routing table is concerned, I don't see why you can't replace
the whole thing with:

10.0.0.0   255.255.255.0   eth1
10.0.1.0   255.255.255.0   eth1
10.0.2.0   255.255.255.0   eth1
10.0.5.0   255.255.255.0   eth1
10.1.0.0   255.255.255.0   eth1
10.2.0.0.  255.255.0.0   eth1
169.254.0.0   255.255.0.0   eth2
127.0.0.0   255.0.0.0   lo
0.0.0.0   0.0.0.0   217.10.176.149   eth0

or even:

10.0.0.0   255.0.0.0   eth1
169.254.0.0   255.255.0.0   eth2
127.0.0.0   255.0.0.0   lo
0.0.0.0   0.0.0.0   217.10.176.149   eth0

(By the way, there must be an entry missing from what you posted earlier,
since there's no subnet 217.10.176.x listed for eth0, but I'm sure you must
have it on your machine (unless perhaps eth0 uses a point-to-point link?).

Regards,

Antony.

--

When do you expect the official release of the 2.6.0 kernel?

Rusty Russell: From previous releases, a pattern has emerged: exactly 6
months before it's ready.
                                                     Please reply to the
list;
                                                           please don't CC
me.


