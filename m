From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP connection timeout problem
Date: Mon, 17 Jul 2006 15:54:57 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0607171540260.964@blackhole.kfki.hu>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
	<44B1FD6A.6010207@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>
	<44B3444C.3020503@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607110843170.24895@blackhole.kfki.hu>
	<44B35ED9.7070008@eld.physics.leidenuniv.nl>
	<44B5FE48.7000503@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607170945190.935@blackhole.kfki.hu>
	<44BB8CD4.5000506@eld.physics.leidenuniv.nl>
	<Pine.LNX.4.58.0607171514020.964@blackhole.kfki.hu>
	<44BB8F43.6040301@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BB8F43.6040301@eld.physics.leidenuniv.nl>
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
To: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Cc: netfilter@lists.netfilter.org

On Mon, 17 Jul 2006, Arno van Amersfoort wrote:

> Yep: I have ipt_LOG loaded (actually compiled into the kernel) and not
> ipt_ULOG. So the only thing I'm getting in my kernel log is:
>
> Jul 17 04:02:07 rulhm2 kernel: INVALID packet: IN=eth0 OUT=
> MAC=00:01:02:05:1d:25:00:01:03:d2:b8:75:08:00 SRC=132.229.96.110
> DST=132.229.96.12 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=56700 DF PROTO=TCP
> SPT=54858 DPT=445 WINDOW=5840 RES=0x00 ACK FIN URGP=0
>
> (But of course this also is shown when
> /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid = 0 )

That line is created by your explicit rule of logging invalid packets. If
there were any TCP related problem which would forced conntrack to mark
the packet as invalid, you should see kernel log messages with the prefix
"ip_ct_tcp: " (when logging invalid packets is enabled). That's really
strange.  As the packet is not truncated, there isn't really anything
which should trigger to mark it as INVALID.

It seems to me only catching such packets by tcpdump can really help.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

