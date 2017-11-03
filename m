From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Re: Traffic shaping with nftables maps and tc
Date: Fri, 03 Nov 2017 17:28:33 +0100
Message-ID: <9a12636557fc2e5e1636b86f8145db88@spoje.net>
References: <62018f4d1c124ef84a7bd2281b1b2dcc@spoje.net>
 <392d67152072ea965fd56fbe6efefab7@spoje.net>
 <CAOkSjBh8H2tn6noj9BrbGcwdk4nnjZxm-4TiTVyhm+jciSYCew@mail.gmail.com>
 <79baac2c7d201c134a2852cca86b5bce@spoje.net>
 <CAOkSjBjC9WBUvn0GFHfneJJmA9-03gH3ZjBj590WuUOLrzCiRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509726515;
        bh=FbYR4vtOYXLnQhURs1SjHLxgC/k96sYB5g8qVcT6Vn4=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=bOoEZBYbVaJ3+X1125KFLJF7CpkcjHiuMk72j3hAikNlNGOn4o42ZfCvyMZlCBUnn
         5DNRFM/sJQP/iVIGt6VMhQVSiu7jZSpcVxStAjdbZvuX398IQhuueOHHfQjBCobCZb
         Qp5iomzewe+STCPdtycWF6+zS/a9v1ckXKH85mWo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509726513;
        bh=FbYR4vtOYXLnQhURs1SjHLxgC/k96sYB5g8qVcT6Vn4=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=UUEkmt5y96kAGtyi0hCgrvujcKq2ZisSGlUieA2VGehWfUZ07zrEB1e8BIFoc5UPf
         eTaiVLz6B/Ewzxsi6rJgym9MpLlWcZnF4vzhZHRPRXioyRGIJB3vzHQZ0pz7d+pr/G
         eIg/CZ+627064vYMi3AP50s0Ctjo3ZHw05hBk8+4=
In-Reply-To: <CAOkSjBjC9WBUvn0GFHfneJJmA9-03gH3ZjBj590WuUOLrzCiRg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

> Could you please test the attached patch? It is quick and dirty, not
> even compiled tested.

Hell yeah! It loaded :-) Thank you.
That's one small line for a bison, one giant leap for traffic shaping on 
nftables.


> +++ b/src/parser_bison.y
> @@ -1545,6 +1545,7 @@ type_identifier		:	STRING	{ $$ = $1; }
>  			|	MARK	{ $$ = xstrdup("mark"); }
>  			|	DSCP	{ $$ = xstrdup("dscp"); }
>  			|	ECN	{ $$ = xstrdup("ecn"); }
> +			|	CLASSID { $$ = xstrdup("classid"); }
> 			;
> 

-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
