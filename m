From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: iptables-1.3.7 Requires ip_tables to be built as module
Date: Tue, 13 Feb 2007 16:47:10 +0900 (JST)
Message-ID: <200702130747.l1D7lBbI027909@toshiba.co.jp>
References: <936822.57379.qm@web53605.mail.yahoo.com>
	<87mz3ia5ex.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <87mz3ia5ex.fsf@newton.gmurray.org.uk>
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
Content-Type: Text/Plain; charset="us-ascii"
To: graham@gmurray.org.uk
Cc: netfilter@lists.netfilter.org


Hi,

From: Graham Murray <graham@gmurray.org.uk>
Date: Tue, 13 Feb 2007 07:21:58 +0000

> Harvey Muller <hlmuller@yahoo.com> writes:
> 
> > Graham,
> >
> > Assuming you've built ip_tables into the kernel (not as a module),
> > then I'd be interested in learning the difference in the process you
> > used to install iptables between versions 1.3.5 and 1.3.7.  Version
> > 1.3.5 works fine for me with kernel version 2.6.20 built in (not as
> > a module).  But when I use the same install process for 1.3.7, I get
> > the error messages.  And when I go back and configure ip_tables as a
> > module, then the error message goes away, which is what one would
> > expect.
> 
> No difference at all. They are both built using the 'standard' Gentoo
> ebuild system. In the kernel config I have both
> CONFIG_IP_NF_IPTABLES=y and CONFIG_IP6_NF_IPTABLES=y, as well as all
> the targets set to yes, all the parts of netfilter which I use are
> built into the kernel, none are built as modules.

I've met same error message, too. iptables was build with NO_SHARED_LIBS=1,
and all kernel part is built-in kernel.

BTW, it should work fine even if error message is printed.
I saw the output of 'iptables -L -v -n' printed rules I inserted.

I'll check codes when I have anytime.

Regards,

-- Yasuyuki Kozakai

