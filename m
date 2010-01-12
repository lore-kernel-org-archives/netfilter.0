From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: REJECT as a default policy
Date: Tue, 12 Jan 2010 13:21:37 +0200
Message-ID: <4B4C5B41.7000500@gmail.com>
References: <4B4B1339.1040502@gmail.com>	 <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local> <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:cc:subject:references:in-reply-to
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=/Z+3OIpp2IwTIwlvMMnFGc5AsfgDjSHeXy/x7WVg+Ko=;
        b=V0+KUb6bT9brUU++CA1dJ9iC1NfpJciSu4X7kt8unkqdowurhpLNjrZfmNNxZGRH1L
         k7WQrtt4ftELA9dq7YKmqYbhfbovZcbtbJR9xcq1pYffGDYJyNcrnPjc1YxvLCNV+MbG
         QlIx/lERBjGrjIY85h/o6JPI3LiJmtFQVGKlQ=
In-Reply-To: <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Richard Horton wrote:
> I think all the OP means is DROP is valid policy target where as
> REJECT isn't. 

Yes.

> The big problem though is that DROP / ACCEPT as policy
> targets or jump targets require no options where as the REJECT target
> can take options to control the returned ICMP code, which with the
> current policy handler you couldn't specifiy.

Ok.  The limitation is a characteristic of the current policy handler,
so it's a non-trivial task to allow REJECT as a default policy.

Mart Frauenlob wrote:
> you will not have control over how many (limit) and what type of icmp
> error is through'n out (would need new policy handler).

Thanks, Mart and Richard.  That answers a pair of question I was going
to ask but unsure of how to phrase.

/Lars
