From: Unknown <unknown@unknown.invalid>
Subject: Re: Problems with SNAT in POSTROUTING
Date: Tue, 6 Jan 2004 01:31:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37221.1027461619$1073370905@news.gmane.org>
References: <005101c3d417$e19b8d30$b3b3dec8@stanislaw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <005101c3d417$e19b8d30$b3b3dec8@stanislaw>
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
Content-Type: text/plain; charset="us-ascii"
To: Copag <c0p4g@yahoo.com.br>, netfilter@lists.netfilter.org

On January 6, 2004 12:41 am, Copag wrote:
> With the new version of iptables, our script don't works. We have problems
> with the SNAT in use of the POSTROUTING. With the old version, the problem
> (with the same script) don't exists.

	When you say "new version of iptables" do you mean you installed new 
	userspace tools, or have you simply moved to a new version of Patch-O-Matic
	iptables kernel patches, or further, have you upgraded your kernel and patched
	in a new version of patch-o-matic?

	*IF* you have upgraded patch-o-matic and kernel, you lkely need to rebuild your
	userspace tools.... I recently moved from 2.4.23 to 2.6.0 and more recent patch-o-matic
	and found that to get SNAT working I had to rebuild userspace tools.

	Alistair Tonner
	

>
> Anyone can help, please?
>
> Sorry for the poor english.
>
> Thanks.
>
> Joao Paulo

