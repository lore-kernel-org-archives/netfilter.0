From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: iptables-1.3.7 Requires ip_tables to be built as module
Date: Mon, 12 Feb 2007 16:17:14 +0000
Message-ID: <87ire7pcz9.fsf@newton.gmurray.org.uk>
References: <449077.77887.qm@web53612.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1171297034; bh=N31ttq7cepv6kQuRklUy0nNnkzc=; h=Received:
	X-Authentication-Warning:From:To:Subject:References:X-Hashcash:
	Date:In-Reply-To:Message-ID:User-Agent:MIME-Version:Content-Type; b=Q
	fG7d8ZS6WEIOG4SpGDbrjmSTWqCkRqG1v9OYiVmYipnImoIUGRY8xWq5O691nmoqucb
	8mxeAp3q7ZLmCyrAuw==
In-Reply-To: <449077.77887.qm@web53612.mail.yahoo.com> (Harvey Muller's
	message of "Mon\, 12 Feb 2007 07\:23\:18 -0800 \(PST\)")
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

> I'm using kernel version 2.6.20 on an x86 based system.  Iptables emits
> errors, "FATAL: module ip_tables not found" when ip_tables is built in the
> kernel.  The only workaround is to build ip_tables as a module.

I too am running kernel 2.6.20 and running iptables 1.3.7 and have all
of the iptables features built into the kernel and it works with no
problems or error messages.

