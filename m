From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP connection timeout problem
Date: Sun, 9 Jul 2006 16:53:24 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0607091648570.11701@blackhole.kfki.hu>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
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

On Thu, 6 Jul 2006, Arno van Amersfoort wrote:

> I'm the author of "Arno's Iptables Firewall" (maybe you know). Anyway,
> I've been experiencing a problem for quite some time know. The problem
> is that it seems that in once in a while a connection is no longer
> considered ESTABLISHED by netfilter/iptables, causing the packets to
> bounce of the firewall like this:
>  Jul  5 18:02:16 rulhm2 kernel: Stealth scan (UNPRIV)?: IN=eth0 OUT=
> MAC=00:01:02:05:1d:25:00:10:dc:d4:a2:bc:08:00 SRC=x.x.x.x DST=x.x.x.x
> LEN=41 TOS=0x00 PREC=0x00 TTL=128 ID=26688 DF PROTO=TCP SPT=445
> DPT=53205 WINDOW=17053 RES=0x00 ACK URGP=0
>
> In this case it's a connection for used by Samba (port 445). As you can
> see an TCP packets with the ACK-flag set is bounced of as it's (no
> longer) catched by my (iptables) ESTABLISHED-rule. This happens for a
> variety of flag-combinations (like RST, FIN, ACK/FIN etc.). Is there any
> way I can fix this "nicely", as until know I've always "worked around"
> this issue with using some general iptables rules which simply
> drop(ignore) these kind of packets. I'm thinking of some kernel settings
> (/proc / sysctl) that one might "tweak"....

Without knowing which kernel version (and pom-ng patches) are you running,
one cannot really help.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

