From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: opening connection for Tomcat
Date: Fri, 9 Apr 2004 09:23:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002c01c41e03$9a4736b0$1202a8c0@admin>
References: <40756C19.3010606@tin.it> <1081446600.2453.63.camel@katala.sterenborg.info> <4075B24D.1020601@tin.it> <200404082253.44301.Antony@Soft-Solutions.co.uk> <407642A3.1040700@tin.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

> >>Ok, I've fixed the problem: it seems that the address 0.0.0.0 is no
good.
> >
> >
> > You are certainly very unlikely to receive packets from that address, as
it
> > does not exist.
>
> Well, I'm not a firewall guru, but I think that 0.0.0.0 address is often
> used to indicate "every address", isn't it?

Neither am I ;o). I overlooked that one too.

0.0.0.0 = 0.0.0.0/32. 0.0.0.0 as a host does not exist.
What you meant is 0.0.0.0/0, which is the same as not specifying it.


Gr,
Rob


