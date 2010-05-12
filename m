From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: Re: iptable how many rule can manage iptable
Date: Wed, 12 May 2010 18:05:58 +0000
Message-ID: <m2sf1cc03e01005121105vc2bdb9fexd277eae9c4085061@mail.gmail.com>
References: <l2vf1cc03e01005121009j3ce0e30cj56ac615688a58916@mail.gmail.com>
	 <alpine.LSU.2.01.1005121925440.14663@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=/MVpsGpYXttl+1W4wF6Rg2AWVBA4TLIclahqBXNGoes=;
        b=La/mrVmQ3wbz6oLLINlThEZHJLkqVyJAObA+JJJHPgTwbcn9MknsMAQ3bww73c/xiN
         Cxjmq+yRkIUpThG20iyOokW9eELw6zV23V2KXO9fEYet3AQAqfITf379OoUhjg/ibOPS
         jJ3jU84PYH+n8FsnAg9Pa54n5i6/nFYOAoJYo=
In-Reply-To: <alpine.LSU.2.01.1005121925440.14663@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi thank you for your reply.
how could i evaluate the quantity of memories.
for example of 1 000 000 rules what quantity should i have a least.
regards
2010/5/12 Jan Engelhardt <jengelh@medozas.de>:
> On Wednesday 2010-05-12 19:09, Mamadou Tour=C3=A9 wrote:
>
>>Hi, all
>>i'd like to know how many rule can manage iptable.
>
> It depends on the amount of memory you have available at the time of
> loading/modifying a table.
>
