From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors
Date: Tue, 29 Jun 2004 11:52:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406291144590.22926-100000@blackhole.kfki.hu>
References: <1088501444.13933.259.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088501444.13933.259.camel@spudgun.dhcp.internal>
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

On 29 Jun 2004, Evgeni Vachkov wrote:

> On Tue, 2004-06-29 at 08:55, Jozsef Kadlecsik wrote:
> > Assuming that eth0 faces with the client machine, issue the
> > following command before starting the test:
> >
> > # tcpdump -i eth0 -w capture.log tcp
> >
> I have completed the dump, file is quite big > 63MB. Is there a
> possibility to limit the dump to the tested source and destination ip-s
> only?

I assumed there is no other traffic on the wire, just the test. You can
filter out the traffic between the two interesting parties by

tcpdump -r capture.log -w selected.log host a.b.c.d and host x.y.z.w

You can compress it as well. I'd need both the tcpdump log file and the
kernel log from the same time slice the tcpdump ran.

> > What it the output of
> >
> > # cat /proc/sys/net/ipv4/ip_local_port_range
>
> 32768   61000

That's 28232 ports available, over the 25000 connections you mentioned.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



