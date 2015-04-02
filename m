From: Matt Killock <lists@killock.net>
Subject: Re: Routing traffic over two gateways by fwmark
Date: Thu, 02 Apr 2015 17:21:14 +0100
Message-ID: <ae743978214ed9b4f1fa8bfef4f09b54@killock.net>
References: <b2ca7b1036797bf4b84622f88540585d@killock.net>
 <551C6D80.8010506@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=killock.net; s=mail;
	t=1427991674; bh=hZESNbYoLd7QnuTvpTqpKfDzax7Cyl3bggvpyQijPtQ=;
	h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
	b=FkWc/IGk+fAs1yc6ruHJBelkLV8cKmKxBfRAI6I4QsNLhLZ0uoUegYasN/5EY/mOK
	 FIVzkQtlCLYG5iOX2mQfsH2Szzd55KRbQ8pNSucEOYNjKjSI7zcozKJ/Sd2w7p1oPB
	 58Y8Xsbh8ff62+oQ85U6VugFbaoaAdCzUnaHzjHw=
In-Reply-To: <551C6D80.8010506@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

On 2015-04-01 23:13, Pascal Hambourg wrote:
> Check the value of rp_filter for interface 1, interface 2 and all.

Ah ha! Yes, the rp_filter was enabled for all those interfaces. 
Disabling it on all has made it work again! Hoorah!

Many thanks!

Matt
