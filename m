From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors
Date: Mon, 28 Jun 2004 14:04:12 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406281356380.20141-100000@blackhole.kfki.hu>
References: <1088423237.13933.127.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088423237.13933.127.camel@spudgun.dhcp.internal>
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
To: Evgeni Vachkov <evgeni.vachkov@investis.com>
Cc: netfilter@lists.netfilter.org

On 28 Jun 2004, Evgeni Vachkov wrote:

> When I load test one of our firewalls, when the concurrent connections
> reach arround 230, I am getting a lot of error messages as shown below.

That's a very low number of connections...

> Mostly indicating that the server has sent an invalid SYN.  This is a
> heavy load firewall.

...How can the firewall be then heavily loaded?

> I thought that increasing ip_conntrack_max and ip_conntrack_buckets
> would help, but this wasnt the case.
>
> The ip_conntrack version is 2.1.  kernel is v 2.4.26
>
> Is that a problem with conntrack and its tunning or I am missing some
> patch? ...Or perhaps it is some other problem with other parts of the
> kernel?

Why are there so many SYN/ACK packets sent when there is already a
connection established trough the firewall between the same IP addresses
and same ports?

> Jun 25 16:38:51 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
> (ignored) SRC=172.30.4.200 DST=192.168.30.3 LEN=60 TOS=0x00 PREC=0x00
> TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=43226 SEQ=461046254 ACK=654564425
> WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
> (020405B40402080A2D5584DD106BFE1501030300)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


