From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Fri, 27 May 2005 09:24:45 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505270917050.25876@blackhole.kfki.hu>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
	<Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
	<3b1e6f480505260025707940fd@mail.gmail.com>
	<Pine.LNX.4.58.0505261355220.24500@blackhole.kfki.hu>
	<3b1e6f48050526054740113f78@mail.gmail.com>
	<Pine.LNX.4.58.0505261457260.24584@blackhole.kfki.hu>
	<3b1e6f4805052607095d2736c5@mail.gmail.com>
	<Pine.LNX.4.58.0505261616250.24705@blackhole.kfki.hu>
	<3b1e6f480505270006ea481be@mail.gmail.com>
	<3b1e6f4805052700076d965d98@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b1e6f4805052700076d965d98@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo <p0q0b0d@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 27 May 2005, Leonardo wrote:

> On 5/26/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> >
> > Do the packet correspond to what you expect as ICMP reply packet: src and
> > dst IP addresses are OK? What's inside the packet, i.e the src/dst IP,
> > protocol, ports inside the ICMP error message are OK?
>
> Everything seems to be ok... src is the next hop after the gateway on
> eth2 (the VPN box), dst is eth2, TCP ports are ok. ICMP msg correctly
> encapsulate the previos IP datagram (ACK number correspond) that needs
> fragmentation...
> On the other hand ICMP echo packets works correctly, they report the
> same dst (eth2) and are correctly unmasqueraded and forwarded to the
> client...
>
> Could it be something distribution-related setting or patch?
> I'm using Gentoo.

Dunno. It should work out of the box.

Enable debugging in net/ipv4/netfilter/ip_conntrack_proto_icmp.c by
changing

#if 0
#define DEBUGP printk

to

#if 1
#define DEBUGP printk

at the head of the file. Then recompile and boot with the new kernel.
Also, load in the ipt_LOG module and switch on internal logging in
netfilter/conntrack by

echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

Then repeat the tests and watch the kernel log.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

