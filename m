From: Graham Murray <graham@gmurray.org.uk>
Subject: Re: Problem with state match for ip6tables
Date: Mon, 13 Feb 2006 18:23:37 +0000
Message-ID: <87vevjw21i.fsf@newton.gmurray.org.uk>
References: <20060210145631.1726fd0d@localhost.localdomain>
	<200602130416.k1D4GP73019763@toshiba.co.jp>
	<8764njipgp.fsf@newton.gmurray.org.uk>
	<200602131530.k1DFUhTI005947@toshiba.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1139855018; h=Received:X-Authentication-Warning:From:To:Subject:
	References:X-Hashcash:Date:In-Reply-To:Message-ID:User-Agent:
	MIME-Version:Content-Type; b=hFbFqO0Sfsz8CExFIvMGHjLrRbbJc3fmcKt8VF
	X3C4t+8FjTnSj2P1LlEYRlGOTBMKDGIYyjWeb9XatPbS4yNw==
In-Reply-To: <200602131530.k1DFUhTI005947@toshiba.co.jp> (Yasuyuki KOZAKAI's
	message of "Tue, 14 Feb 2006 00:30:43 +0900 (JST)")
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

Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp> writes:

> Sorry, I was wrong. nf_conntrack lives in kernel >= 2.6.15,
> but only kernel >= 2.6.16 supports IPv6 state match.

Thanks. I thought it was in 2.6.15, that is why I asked.

