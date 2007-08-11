From: "=?utf-8?B?0JrQsNC90LjQstC10YYg0J3QuNC60L7Qu9Cw0Lk=?="
	<n_kanivets@futureservice.ru>
Subject: Re: iptables/mac address filtering question
Date: Sat, 11 Aug 2007 22:41:13 +0400
Message-ID: <001001c7dc47$31cb8a40$0534a8c0@Sklifer>
References: <1b5f39a10708111046w55a4b00axb39c018a0ab54fb9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="utf-8"
To: Jay Sprenkle <jsprenkle@gmail.com>, netfilter@lists.netfilter.org

Of course they do.
You will have the source ip address unchanged (if you do not perfrom SNAT=
 on
any on-the-way router), but you will receive the source MAC address of
router in the nearest to your destination Ethernet segment. In other word=
s,
say you have 3 intermediate routers between your source and destination
machines. Your destination machine will "see" the MAC (ethernet) address =
of
the third-on-the-way router, not your original machine.

regards,
Nikolay.

=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B0=D0=B9 =D0=9A=D0=B0=D0=BD=D0=B8=D0=B2=
=D0=B5=D1=86
e-mail: n_kanivets@futureservice.ru
----- Original Message -----
From: "Jay Sprenkle" <jsprenkle@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, August 11, 2007 9:46 PM
Subject: iptables/mac address filtering question


> Good morning all,
>
> I'm already aware mac address is easily spoofed but I'd like to make
> it just a little bit harder to break into my system anyway. I'm trying
> to only allow a specific box to use scp to safely transfer data over
> the internet.
>
> I've put in a rule in my iptables chain but notice when I try to
> connect it's rejected. The mac address I'm getting is not the same as
> what iwconfig reports on my device. If a packet is passed through
> routers on it's way to my box do they change the mac address of the
> packet?
>
> Any suggestions would be welcome.
>
> Have a good weekend
>


