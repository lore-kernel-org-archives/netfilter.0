From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Patch-o-matic : pptp connection tracking and Kernel 2.4.19
Date: Fri, 16 Jul 2004 21:00:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407162100.26975.Antony@Soft-Solutions.co.uk>
References: <01df01c46b6d$7d9a5490$1a07a8c0@civic2k>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01df01c46b6d$7d9a5490$1a07a8c0@civic2k>
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

On Friday 16 July 2004 8:45 pm, Nicolas Ross wrote:

> Hi all !
>
> I want to use the pptp_conntrack patch from the patch-o-matic extra
> repository.
>
> If I use the kernel 2.4.24, it compiles great, but for some reason, I am
> stuck on using the 2.4.19 kernel. But the patch fails on 2.4.19.
>
> Does anyone can help me make this patch work with 2.4.19 ?

You will probably have to go back to an older version of p-o-m for such an old 
kernel (August 2002!).   I'm not sure if there is an obvious archive of old 
p-o-m versions.

I would instead recommend finding out why you seem to be stuck with such an 
outdated kernel and update that, as you will need to do so sooner or later 
anyway.

Even 2.4.24 is six months old now.

Regards,

Antony.

-- 
"I estimate there's a world market for about five computers."

 - Thomas J Watson, Chairman of IBM

                                                     Please reply to the list;
                                                           please don't CC me.


