From: "Sundaram" <sun@percipia.com>
Subject: Re: Routing rule for two gateways.
Date: Mon, 23 Sep 2002 23:14:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003e01c26378$9b220ac0$4101a8c0@ramasamy>
References: <Pine.LNX.4.44.0209240000160.15720-100000@grignard.amagerkollegiet.dk> <20020923221346.SLKP2092.mta07-svc.ntlworld.com@there>
Reply-To: "Sundaram" <sun@percipia.com>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org


See the following output :
This is from my Sun Solaris Machine, it takes two default gateway.

bash-2.03$ netstat -rn

Routing Table: IPv4
  Destination           Gateway           Flags  Ref   Use   Interface
-------------------- -------------------- ----- ----- ------ ---------
192.168.1.0          192.168.1.130         U        1    430  hme0
224.0.0.0            192.168.1.130         U        1      0  hme0
default              192.168.1.200         UG       1   1579
default              192.168.1.1           UG       1   1678
127.0.0.1            127.0.0.1             UH       3  14767  lo0

Routing Table: IPv6
  Destination/Mask            Gateway                   Flags Ref   Use  =
 If
--------------------------- --------------------------- ----- --- ------ =
---
--
fe80::/10                   fe80::a00:20ff:fef0:d1ac    U       1      0
hme0
ff00::/8                    fe80::a00:20ff:fef0:d1ac    U       1      0
hme0
default                     fe80::a00:20ff:fef0:d1ac    U       1      0
hme0
::1                         ::1                         UH      1      0 =
lo0
bash-2.03$

I have to add the ip address to /etc/defaultroute file.

bash-2.03$ cat /etc/defaultrouter
192.168.1.200
192.168.1.1
bash-2.03$

Same thing is not possible in Linux??
Thanks
Sundaram



----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Monday, September 23, 2002 6:13 PM
Subject: Re: Routing rule for two gateways.


> On Monday 23 September 2002 11:02 pm, Rasmus B=F8g Hansen wrote:
>
> > On Mon, 23 Sep 2002, Antony Stone wrote:
> > > On Monday 23 September 2002 2:42 pm, Sundaram Ramasamy wrote:
> > > > What is the Linux command and syntax to set two default gateway.
> > >
> > > The question does not make sense.   You can have two (or more)
gateways,
> > > but only one of them can be the default.
> >
> > You'll find on http://www.lartc.org/howto/lartc.rpdb.multiple-links.h=
tml
> > that this is not entirely true - you can use multipath routes (but th=
is
> > require support compiled into the kernel).
>
> Um....   Although I agree that multipath routing can certainly be done,=
 I
> still don't think this is the same as "two default routes" (for the rea=
son
I
> gave above).
>
> In fact on the webpage you quote it shows how to set up two routes with
> specific routing tables for each.   Once that is done, one of them is
> designated to be the default route.   One of them......
>
> It is certainly possible to have two (or more) routes from a network of
> computers to the Internet.   However for each machine in the network, o=
r
for
> each gateway router, there can only be one default route.
>
> Antony.
>
> --
>
> All matter in the Universe can be placed into one of two categories:
>
> 1. things which need to be fixed
> 2. things which will need to be fixed once you've had a few minutes to
play
> with them
>


