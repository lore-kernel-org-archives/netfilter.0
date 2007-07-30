From: Ludovic <ludovic.mailinglist@gmail.com>
Subject: Re: Problem with ROUTE target
Date: Mon, 30 Jul 2007 14:29:49 +0200
Message-ID: <2cb453e80707300529v7740c1a9va22d4c9101d8a0f1@mail.gmail.com>
References: <2cb453e80707300029m341a5afap295e775ea0572e7c@mail.gmail.com>
	<20070730122411.GA6610@mano.netyl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=HJfmo4aAhkvke1wgaGyBli6MTKSZvP7ERyZT5TBkryMXjjSqQNGrBH6eMWld2Sf7rD3K76TXp3p86LkrsDM5t4lw6I0gDfdcMAAgYbWQm1iWizfWGFClbxxGilTGX0JfyyESeOlclMwtitLj7hBRoriWXbi8Ok1I1R3gUf4a3dE=
In-Reply-To: <20070730122411.GA6610@mano.netyl.org>
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
To: netfilter@lists.netfilter.org, Ludovic <ludovic.mailinglist@gmail.com>

Thanks a lot for your answer.

Here is my /proc/net/ip_tables_target:

TTL
ULOG
LOG
SAME
NETMAP
REDIRECT
MASQUERADE
IMQ
ECN
TOS
REJECT
DNAT
SNAT
ERROR
TCPMSS
NFLOG
NFQUEUE
MARK
MARK
DSCP
CONNMARK
CLASSIFY

First, i can see that the target ROUTE is not available. Second, what
about the line with ERROR? Is it normal ?

I have checked on an other linux box with ROUTE target working, there
is no ERROR line in the ip_tables_target file and the ROUTE target is
available.

What can i do to correct the ROUTE target available ?

Best regards,
Ludovic.

