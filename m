From: Alessandro Vesely <vesely@tana.it>
Subject: Re: iptables enough to handle brute force attacks?
Date: Thu, 28 Apr 2011 19:31:16 +0200
Message-ID: <4DB9A464.3010709@tana.it>
References: <pvplp6t1hsoea6n5sriuna0375k5s79pmm@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1304011876; bh=SBrsgVhCy0S7cSB90APr2TjyAnKeUKxab0ZQjo6WVfA=;
	l=369;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=LTRZVrvpKlI7Tfk6xa14g2uHzOJXVeimAylin9uPOlKWNr1+MANTkJlKXkhHA+lv7
	 4hjUC039fbeNEbfOO2fRlAbfeoCi6LSyJMDhpv3TXIuZyNhqFLzrbMvBZUaTIUTpmI
	 ex9Y7bUTdYKOnHBSHAAC+TxVnB4JzzLngkynHjZQ=
In-Reply-To: <pvplp6t1hsoea6n5sriuna0375k5s79pmm@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gilles <gilles.ganault@free.fr>
Cc: netfilter@vger.kernel.org

Sorry for chiming in late...

On 05/Apr/11 12:02, Gilles wrote:
> I'll use iptables to prevent hackers from trying to register.
> 
> [...]
> 
> This is on an embedded Linux, so there isn't enough RAM to run
> Python-based fail2ban.

This package is similar, but doesn't use Python (it uses Berkeley DB,
though)  https://savannah.nongnu.org/projects/ipqbdb/
