From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Tue, 20 Apr 2004 16:59:04 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0404201653330.14290-100000@blackhole.kfki.hu>
References: <40853577.5080803@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40853577.5080803@linuxmail.org>
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
To: Feizhou <feizhou@linuxmail.org>
Cc: netfilter@lists.netfilter.org

On Tue, 20 Apr 2004, Feizhou wrote:

> Jozsef Kadlecsik wrote:
> > On Mon, 19 Apr 2004, Feizhou wrote:
> >
> >
> >>when will ipset be available in 2.6?
> >
> >
> > It needs more, exhaustive testing. ippool was tested more widely than
> > ipset.
>
> Oh...those that mean both can actually be compiled in 2.6?

A minor fix is required to "port" both to 2.6.

> Lovely. Does ippool/ipset take ips only or will they also take cidrs?

ippool accepts IP addresses. In ipset, you can store CIDR netblock as
well.

> BTW...mail.so-net.com.hk is an ISP smarthost...could you block
> so-net.com.hk not coming from 203.99.142.22 instead of a domain rule
> block on rdns and sender addy?
>
> And maybe all emails from 203.99.142.22 if sender addy not in
> so-net.com.hk...

netfilter was not designed to filter E-mail.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


