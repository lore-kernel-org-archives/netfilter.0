From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with SNAT in POSTROUTING
Date: Tue, 6 Jan 2004 16:04:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401061604.21261.Antony@Soft-Solutions.co.uk>
References: <20040106154833.16498.qmail@web61101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040106154833.16498.qmail@web61101.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 06 January 2004 3:48 pm, Copag wrote:

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
> > 	*IF* you have upgraded patch-o-matic and kernel,
> > you lkely need to rebuild your
> > 	userspace tools.... I recently moved from 2.4.23 to
> > 2.6.0 and more recent patch-o-matic
> > 	and found that to get SNAT working I had to rebuild
> > userspace tools.
>
> What is the "userspace tools"? What can I rebuild this
> to test?

iptables (ie: the command you use as a user) is the userspace tool, and 
netfilter is the kernel part which does the filter according the rules 
configured by iptables.

Since you say you have installed the new version of iptables, this is the 
userspace tools - have you also upgraded the kernel (containing netfilter) to 
match it?

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


