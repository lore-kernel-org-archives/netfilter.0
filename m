From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Out of window data issue
Date: Mon, 30 Sep 2002 14:21:39 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209301413471.6688-100000@blackhole.kfki.hu>
References: <3D94B8CE.9000707@pcxperience.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D94B8CE.9000707@pcxperience.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James A. Pattie" <james@pcxperience.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Fri, 27 Sep 2002, James A. Pattie wrote:

> 	I'm running 2.4.18 kernel's w/ the tcp-window-tracking
> patch applied (from p-o-m around iptables 1.2.6a days) and iptables
> 1.2.6a and I'm getting the following errors in the logs between 2
> firewalls where the only traffic that seems to be affected is
> Printing from the St. Louis office to the Kansas City Office via
> our VPN connections.

I'd suggest to upgrade to the newest version of the patch from
patch-o-matic in cvs. It contains an improved logging of the invalid
packets.

> Sep 27 14:41:26 hartwigkcm kernel: SRC=192.168.3.98 DST=192.168.5.25
> LEN=44 TOS=0x00 PREC=0x00 TTL=127 ID=63785 DF PROTO=TCP SPT=721 DPT=515
> SEQ=28150977 ACK=0 WINDOW=8192 RES=0x00 SYN URGP=0 OPT (020405B4) Out of
> window data: SEQ is over the upper bound (over the window of the receiver)
>
> I have disabled tcp_timestamps, tcp_window_scaling and tcp_sack and
> enabled netfilter/ip_conntrack_tcp_be_liberal but I still get the
> packets dropped and the above error message output.

The ip_conntrack_tcp_be_liberal flag has no effect on the logging. If you
enable it, only invalid RST packets will be marked as INVALID - but all
the packets will still be logged.

> The source and dest servers are NT4 Terminal Servers if that helps.
>
> We just upgraded the kernels within the last 3 weeks and the printing
> issue is the only thing that we haven't been able to resolve.

My usual request: please tcpdump TCP on both sides of your firewall and
send me the resulted files together with the (enabled) kernel log of the
same period. It could help to improve the patch.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


