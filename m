From: "Andy Cristina" <acristin@gmail.com>
Subject: Re: Netfilter_queue test program question
Date: Wed, 29 Aug 2007 12:57:44 -0500
Message-ID: <6043bfd00708291057wc8c9c8cub397cb9fcc22a660@mail.gmail.com>
References: <6043bfd00708290113j38b0f153k7acd38d09ab9c16e@mail.gmail.com>
	<46D53FA3.9030805@freemail.hu>
	<6043bfd00708290621o432827e2scbd241aebcdbdf75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=ptiPxPCGFQMpLF9zM76c3zPoYOmf24hlElpPYsKi4QsEjJ2CjReJVbQg7htnLrCGTT61oiC15L4Rns4i9zMz40K+4uM5YIrUauARD4Fnv4JyW9+F2B2UvQnAtLS6fcAjlSp79RMiMuT/7wHN+oLi39StHgn25bF2eTnDDxs5YPE=
In-Reply-To: <6043bfd00708290621o432827e2scbd241aebcdbdf75@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> However, in any case when I run the compiled nfq_test, the program
> seems to do nothing after setting the packet copy mode.  So it seems
> to me as if it is perpetually waiting for a packet to be sent over the
> netlink, but one never arrives, no matter how much network traffic I
> have.
>
> Am I missing some vital piece of setup?  When I run nfq_test, there
> are two netfilter modules loaded.  Should there be more?  Do they need
> to be configured somehow?  Is this the expected behavior?
>
> I have tested this both on my ubuntu install and on a friend's debian,
> both machines exhibit the same behavior.  Any help is certainly
> appreciated.

It is amazing what a good night's sleep does to improve your ability
to read and comprehend.  I was, of course, forgetting to setup an
iptable rule to queue packets, so now I can proceed.

