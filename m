From: unor <unorlist@yahoo.com>
Subject: Re: Build Issue with 2.6.3
Date: Tue, 2 Mar 2004 20:46:22 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040303044622.66011.qmail@web21411.mail.yahoo.com>
References: <0cc501c4009a$2de236e0$d100a8c0@W2RZ8L4S02>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0cc501c4009a$2de236e0$d100a8c0@W2RZ8L4S02>
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
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>

Jim,

Running RH 9 here... compiled fine.  Have you tried
updating your kernel headers?

cd /usr/include
mv linux linux-old
ln -s /<PATH>/linux-2.6.3/include/linux linux


Earl Sammons

--- Jim Gifford <maillist@jg555.com> wrote:
> Error is listed below. Any suggestions.
> 
> /usr/include/linux/err_kernel_only.h:1:2: #error
> Kernel only header included
> in userspace
> extensions/libipt_ah.c: In function `parse_ah_spi':
> extensions/libipt_ah.c:39: error: `ERANGE'
> undeclared (first use in this
> function)
> extensions/libipt_ah.c:39: error: (Each undeclared
> identifier is reported
> only once
> extensions/libipt_ah.c:39: error: for each function
> it appears in.)
> make: *** [extensions/libipt_ah_sh.o] Error 1
>                 -----Error at Build has occured-----
> 
> ----
> Jim Gifford
> maillist@jg555.com
> 
> 



__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

