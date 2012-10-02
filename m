From: Marco Padovan <evcz@evcz.tk>
Subject: Re: how the packet is traversed
Date: Tue, 02 Oct 2012 22:59:43 +0200
Message-ID: <506B55BF.7000004@evcz.tk>
References: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evcz.tk; s=google;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:x-enigmail-version:openpgp:content-type
         :content-transfer-encoding;
        bh=eq6aS54AN9nKsoLwZaEALSf8xRgxEZLnPqeFc36786g=;
        b=YNAbJ+99FirFZZVcON0mEyNHoO2xVetQmU8MRHSgA4YZDZRAWHtRKgfy2REge9jh7C
         5Bifwryr4QsbbK/9hlKeFPcwzLbpsosKDI3HfWAlWpxYl9IcvJ7P9YmR6PlJf++I7kyj
         kb47khxmDjyEVha+ayL/JhBspuZo/gDdc5QwY=
In-Reply-To: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giuseppe Longo <giuseppelng@gmail.com>
Cc: netfilter@vger.kernel.org


http://inai.de/images/nf-packet-flow.png

Il 02/10/2012 22:20, Giuseppe Longo ha scritto:
> Hello,
> i'm a student of computer science, working on a project using iptables.
> I'm confused how the packet is treated when it's arrived in the iptables.
>
> Someone can explain me this process?
>
> Thanks in advice,
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

