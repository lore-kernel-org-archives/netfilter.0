From: Unknown <unknown@unknown.invalid>
Subject: Re: Problems with SNAT in POSTROUTING
Date: Tue, 6 Jan 2004 11:34:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <42126.729936763$1073407011@news.gmane.org>
References: <20040106154833.16498.qmail@web61101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <20040106154833.16498.qmail@web61101.mail.yahoo.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Copag <c0p4g@yahoo.com.br>, netfilter@lists.netfilter.org

On January 6, 2004 10:48 am, Copag wrote:
> Sorry. I was in my house, now I'm at work.
>
> > 	When you say "new version of iptables" do you mean
> > you installed new
> > 	userspace tools, or have you simply moved to a new
> > version of Patch-O-Matic
> > 	iptables kernel patches, or further, have you
> > upgraded your kernel and patched
> > 	in a new version of patch-o-matic?
>
> We installed the new version of iptables only in the
> iptables version (1.2.28 to 1.2.29), with no changes
> in the kernel or Patch-O-Matic.
>

	Here is your problem.   If you change versions of netfilter you need=20
	to put those changes into your kernel -- i.e. -- rebuild the kernel.
	That makes it a good time to upgrade patch-o-matic if you use anything
	out of it.


> > 	*IF* you have upgraded patch-o-matic and kernel,
> > you lkely need to rebuild your
> > 	userspace tools.... I recently moved from 2.4.23 to
> > 2.6.0 and more recent patch-o-matic
> > 	and found that to get SNAT working I had to rebuild
> > userspace tools.
>
> What is the "userspace tools"? What can I rebuild this
> to test?
>
> Thanks a lot.
>
>
> Joao Paulo
>
>
>
> ______________________________________________________________________
>
> Conhe=E7a a nova central de informa=E7=F5es anti-spam do Yahoo! Mail:
> http://www.yahoo.com.br/antispam

