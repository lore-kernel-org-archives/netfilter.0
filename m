From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors
Date: Mon, 28 Jun 2004 14:47:26 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406281438060.20141-100000@blackhole.kfki.hu>
References: <1088425791.13925.151.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088425791.13925.151.camel@spudgun.dhcp.internal>
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

> The test software connects to the web server with 200 connections at a
> time to start with. When it receives the test data, it creates 210
> connections, then 220... ...and so forth until something wrong happens.

So this is the number of new connections created.

> The interesting fact is that most connections were in  TIME_WAIT from
> (/proc/net/ip_conntrack).

That is not problem. And the client may even reopen a connection in the
TIME_WAIT state.

> Doing a `wc -l /proc/net/ip_conntrack` returns a figure arround 25000,
> which is well below the ip_conntrack_max treshold.

That's not bad either.

> > Why are there so many SYN/ACK packets sent when there is already a
> > connection established trough the firewall between the same IP addresses
> > and same ports?
>
> I'd love to know this, too. The software Im using is based on ab (apache
> benchmark tool). I beleive ab is creating multiple separate connections,
> over which it is getting data from server and therefore simulating a
> large nimber of users.

Based on or it is ab itself?

> > > Jun 25 16:38:51 myserver kernel: ip_conntrack_tcp: INVALID: invalid SYN
> > > (ignored) SRC=172.30.4.200 DST=192.168.30.3 LEN=60 TOS=0x00 PREC=0x00
> > > TTL=64 ID=0 DF PROTO=TCP SPT=80 DPT=43226 SEQ=461046254 ACK=654564425
> > > WINDOW=5792 RES=0x00 ECE ACK SYN URGP=0 OPT
> > > (020405B40402080A2D5584DD106BFE1501030300)

The question still remains: where is the SYN packet for which this SYN/ACK
is sent as a reply? Could you run tcpdump on the interface of the firewall
connecting it to the client?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


