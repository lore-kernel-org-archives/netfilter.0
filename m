From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ICMP frag needed not forwarded to MSQ clients
Date: Thu, 26 May 2005 15:09:43 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0505261457260.24584@blackhole.kfki.hu>
References: <3b1e6f48050525011730fa7e44@mail.gmail.com>
	<Pine.LNX.4.60.0505251222550.9513@darkstar.sysinfo.com>
	<3b1e6f480505260025707940fd@mail.gmail.com>
	<Pine.LNX.4.58.0505261355220.24500@blackhole.kfki.hu>
	<3b1e6f48050526054740113f78@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b1e6f48050526054740113f78@mail.gmail.com>
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

On Thu, 26 May 2005, Leonardo wrote:

> > Probably you have got rp_filtering enabled and the routing engine discards
> > the ICMP packets.
>
> Yes, I have it enabled. Disabling it does not solve the problem... :-(
>
> echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter
> echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter

Can you verify by tcpdump that the ICMP packets do received on eth2?
Can you see them going out on eth0? Anything in the kernel log?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

