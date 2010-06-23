From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: Documentation (was Re: randomly changing IPs from different subnets
 (Google Mail))
Date: Wed, 23 Jun 2010 19:15:04 +0300
Message-ID: <4C223308.8010307@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com> <4C21F56C.3070603@gmail.com> <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr> <4C22105A.70006@gmail.com> <20100623141213.GR19868@cardinal> <4C221BF0.40609@gmail.com> <20100623151345.GT19868@cardinal> <alpine.LSU.2.01.1006231737590.13675@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :x-enigmail-version:openpgp:content-type:content-transfer-encoding;
        bh=gh1kQSgBrWUCR9bTthndC4S4mc7u9IQnafiQGoAgpOY=;
        b=JmiNHcqPflbg/GDGf15RI17wEW6P6c6Lzj0a7SY27YRGbQP52I9Qvyfq44xFqgQlww
         pqquS7a7eplH76jwdqOcBiplIezgfG4V6j+bWK99lWyH35Lp5CqKBT9y/Vy3w0PDQMEl
         wqxt75lhGifERLlXbnLoW1AoRwd40TKZCzz6Q=
In-Reply-To: <alpine.LSU.2.01.1006231737590.13675@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt wrote:

> What needs to be done is to talk to the Netfilter core people -
> Patrick, Pablo - and sort it out. This has been raised before, but
> nothing really got out of it because the whole domain and servers is
> in some obscurly-secure network that nobody has time to touch.

What should be used as the base format * for the 'originals' from now on?

Then, after that is decided, could a place be made in the git repository
for each item in the netfilter documentation page?   Using git would
allow the work to be more easily distributed and possibly ease the
burden of editorial review.

/Lars

* The short list of choices would be Docbook, flatfile OpenDocument, or
TeX.
