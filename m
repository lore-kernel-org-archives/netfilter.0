From: "Ali Ozaltin" <ali@yenibasaran.com>
Subject: RE: Pom patch error
Date: Thu, 22 Jun 2006 16:44:09 +0300
Message-ID: <17846.5931596749$1150983191@news.gmane.org>
References: <60157.193.173.147.3.1150982206.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <60157.193.173.147.3.1150982206.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"
To: 'Rob Sterenborg' <rob@sterenborg.info>, netfilter@lists.netfilter.org

I want install fresh linux and patch POM which distb. You counsel ?=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob =
Sterenborg
Sent: Thursday, June 22, 2006 4:17 PM
To: netfilter@lists.netfilter.org
Subject: Re: Pom patch error

On Thu, June 22, 2006 14:17, Ali Ozaltin wrote:
> Hello ,
> How can i install patch-o-matic on =EF=BF=BD2.6.9-34.0.1.Elsmp kernel =
version ?
When

This is probably a CentOS kernel ?

> i try ./runme pending its giving this error messages ; Do you want to
apply
> this patch [N/y/t/f/a/r/b/w/q/?] y Testing patch
submitted/01_2.4.19.patch...

Maybe I'm reading this wrong, but if not then I think it's strange that =
POM
tries to use a 2.4.29 patch on a 2.6.9 kernel.
Btw, what is the exact commandline that you use to execute "runme"?

> Warning - no help text file could be found in either
> =
/usr/src/kernels/2.6.9-34.0.1.EL-smp-i686/net/ipv4/netfilter/Config.help
> or =
/usr/src/kernels/2.6.9-34.0.1.EL-smp-i686/Documentation/Configure.help
> Failed to patch copy of /usr/src/kernels/2.6.9-34.0.1.EL-smp-i686
> TEST FAILED: patch NOT applied.
> [Press enter to continue]
> What can i do ? pls help
> Installed OS: CentOS 4.3

It could be that this kernel has been modified by CentOS. POM should be
working on a vanilla kernel from kernel.org so you could try using one =
of
those.


Gr,
Rob



