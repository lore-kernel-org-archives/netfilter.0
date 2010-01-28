From: Matt Hakim <thepigs@gmail.com>
Subject: Re: fwmark & iptables
Date: Fri, 29 Jan 2010 00:26:56 +1100
Message-ID: <fcfe0b071001280526t75cdc774x8d3a91497e8af2cf@mail.gmail.com>
References: <fcfe0b071001280237w56be822fo5fb896071faacc3b@mail.gmail.com>
	 <4B6176A9.3030404@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=Fh8yfFj03y9FG9KaG7qf4XsNYPN6M3blJwpZzprkKTM=;
        b=MfBVvhq1Jfs87HB5scvM0ib6OxxD12VDiwpM15l1jKTYG++5pp06SQ0yMyc9aicaUy
         sIlQ1B1bsSWHc//okBhyKQQJfDsc21X9ZFQcMZMhcOal6AuiS6dG6MZMMQgFFMHM6i5Z
         g0POu7ZokEwgwLtQ/1F8DY2XBFgjMzUqcbqEg=
In-Reply-To: <4B6176A9.3030404@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks for your replies.

> Either select the source address in the application or SNAT/MASQUERADE
> on ppp0 for IPv4 traffic.

Tried that. Worked outbound, but inbound I could only LOG the packets
at mangle PREROUTING (I think),  and then they disappeared. No idea
why.
