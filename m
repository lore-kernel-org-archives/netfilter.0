From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Cannot go out the firewall
Date: Thu, 26 Oct 2006 12:15:03 +0200
Message-ID: <45408AA7.5050106@freemail.hu>
References: <e8c943190610260223r232897fdi1aa4ed3e6d1a98b8@mail.gmail.com>	
	<454082CB.4070805@freemail.hu>
	<e8c943190610260255o8496543w731c103623050d10@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e8c943190610260255o8496543w731c103623050d10@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marco Nicoloso <nicolm@gmail.com>
Cc: netfilter@lists.netfilter.org, =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>

Marco Nicoloso =EDrta:
>> iptables -vnL
>
>    0     0 DROP       all  -f  *      *       0.0.0.0/0           =20
> 0.0.0.0/0
=2E..

hmmm...

Something wrong with your kernel or iptables...
Or you just entered these command right after your firewall script...
The counts of packets in the chains should be mostly more than 0 ! :)

>> iptables -vnL -t nat
> iptables: Table does not exist (do you need to insmod?)
Well...
You need it.

In this command:

iptables -t nat -A POSTROUTING -o eth1 -s 192.168.7.0/24 -j SNAT --to
81.xx.xxx.xxx

Try this in the head of your script:

modprobe ip_conntrack >/dev/null 2>/dev/null
modprobe ip_conntrack_ftp >/dev/null 2>/dev/null
modprobe ip_conntrack_irc >/dev/null 2>/dev/null
modprobe ip_nat >/dev/null 2>/dev/null
modprobe ip_nat_ftp >/dev/null 2>/dev/null
modprobe ip_nat_irc >/dev/null 2>/dev/null
modprobe iptable_filter >/dev/null 2>/dev/null
modprobe iptable_mangle >/dev/null 2>/dev/null
modprobe iptable_nat >/dev/null 2>/dev/null


>> iptables -vnL -t mangle
> iptables: Table does not exist (do you need to insmod?)
>
Not now :) Maybe later... :)

> But modules iptable_nat and iptable_mangle (although, I think,
> iptable_mangle is not necessary for me) are loaded.
>
Are you sure?
> Do I need to create table nat, or it is built-in?
>
It is built-in, but should be loaded if you compiled as a module in you=20
kernel.

 From "man iptables":

              If the kernel  is
              configured  with  automatic  module loading, an attempt=20
will be made to load the appropriate module for
              that table if it is not already there.


Swifty


