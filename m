From: Marius Nicolae <marius.e.nicolae@gmail.com>
Subject: Re: Filtering pppoed frames
Date: Mon, 19 Dec 2011 10:43:28 +0200
Message-ID: <CAKEn5-Kn_US9JSLg2O6_wTDMQrTrmzP7Yxx+XmqNmOCtat8Hgw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=FcRBhH5IiYxrlrh3REy2bg0rsBe6RcZRotOHAhHhxbo=;
        b=pEpq5jIOB92FArqSekEh4rZz2l9xmNrm8bc6j7xOMfRTmXafhL6XoSoGy6fEwx+8L4
         cVD3BWC0rDzB8XtPdwj1TcfyTzTlNhqbTpPph1OstLMoAjfB9isRjFTHC1uAuA0m07GK
         qEoyxV5eOvKrdW1ce+p1HT2/uyL3UcC1afqe4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi James,

...
>>> 2. If not, do you know an open source project on which I might involve
>>> and contribute with such functionality?
>
>I'd install tshark on the ppp-oe server and try any one of the below:
>
>sudo tshark -t ad -n -i eth* pppoed
>
>it won't block anything, but may point you in the right direction on where
>they're coming from.
This is how we are currently doing but a more robust and automated way
we are searching for.

>
>James
-- 
Best regards,
Marius Nicolae
