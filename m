From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: iptables-1.3.7 Requires ip_tables to be built as module
Date: Tue, 13 Feb 2007 07:21:58 +0000
Message-ID: <87mz3ia5ex.fsf@newton.gmurray.org.uk>
References: <936822.57379.qm@web53605.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1171351318; bh=Otjr/eZOWZswko754gWoQOReB+s=; h=Received:
	X-Authentication-Warning:From:To:Subject:References:X-Hashcash:
	Date:In-Reply-To:Message-ID:User-Agent:MIME-Version:Content-Type; b=A
	sqNh9GL56Bz0uOIghDoKVk2z7JzhTSDaYcIfsB9/wuNMYT59RuxKDrd1Vzcbcl8GH9r
	ErfFrC1ik5vWsXkDVg==
In-Reply-To: <936822.57379.qm@web53605.mail.yahoo.com> (Harvey Muller's
	message of "Mon\, 12 Feb 2007 11\:49\:12 -0800 \(PST\)")
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Harvey Muller <hlmuller@yahoo.com> writes:

> Graham,
>
> Assuming you've built ip_tables into the kernel (not as a module),
> then I'd be interested in learning the difference in the process you
> used to install iptables between versions 1.3.5 and 1.3.7.  Version
> 1.3.5 works fine for me with kernel version 2.6.20 built in (not as
> a module).  But when I use the same install process for 1.3.7, I get
> the error messages.  And when I go back and configure ip_tables as a
> module, then the error message goes away, which is what one would
> expect.

No difference at all. They are both built using the 'standard' Gentoo
ebuild system. In the kernel config I have both
CONFIG_IP_NF_IPTABLES=y and CONFIG_IP6_NF_IPTABLES=y, as well as all
the targets set to yes, all the parts of netfilter which I use are
built into the kernel, none are built as modules.

