From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors
Date: Tue, 29 Jun 2004 09:55:07 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406290947300.22926-100000@blackhole.kfki.hu>
References: <1088433615.13925.206.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088433615.13925.206.camel@spudgun.dhcp.internal>
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

> I understand the need to identify the problem and I am more than willing
> to help. It would be appreciated if you could adise me on the tcpdump
> command switches to run, since I dont want to scan through thousands of
> packets to identify the missing one. Also I am not an expert in tcpdump,
> so I will need your help.

Assuming that eth0 faces with the client machine, issue the
following command before starting the test:

# tcpdump -i eth0 -w capture.log tcp

If the machine is short in disk space you can compress the log on the fly
instead:

# tcpdump -i eth0 -w - tcp | gzip -c9 > capture.log.gz

and then you can stop tcpdump by

# killall -INT tcpdump

> Note that this problem occurs only when ip_conntrack table reaches
> arround 25000 connections. The software I am running is using ab (a
> shell script incorporatring ab).

I assume you run Linux on the client machine running ab as well, don't
you? What it the output of

# cat /proc/sys/net/ipv4/ip_local_port_range

on that machine?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


