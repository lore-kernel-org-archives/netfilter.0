From: Pieter Smit <mlist2010@vigor.co.za>
Subject: Re: match streaming traffic in iptable rule
Date: Tue, 27 Jul 2010 21:40:28 +0200
Message-ID: <AANLkTi=39yR-Acf=EMrqbLCcG5x3insg1D6sA5eViqH=@mail.gmail.com>
References: <AANLkTinp9zca5i20tPmdYsieWr4uOj6KS2TAqREajno4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=wIDgCvrDkzPbx8ukrjlaYjeAUc+14vJ5qh3iVW7G8S0=;
        b=cE1O5cUkvp0+3vw6g8UQ6h5vDqRH+rywECHAARWWOX8BCflWQCGo+6xrvlByNW//i7
         v15qUiAer46oW42jz5rfSsgQWLQdEc5pCGWhU7wG8f8eNZUOEuXjjUmD4GyYmIKNVmgy
         Nt4YO5er4m45lYTxBpITB0G3kYw30v0rstKe8=
In-Reply-To: <AANLkTinp9zca5i20tPmdYsieWr4uOj6KS2TAqREajno4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Mamadou_Tour=E9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Mamadou,

You have to define what you see as streaming.

Is it all rtp traffic ?

Is it any udp session sending more than 1meg ?

Does it include specific ports ?

Regards,
Pieter

2010/7/27 Mamadou Tour=E9 <e2ia.ci@gmail.com>:
> Hi, all
> how could i match all streaming protocole in my iptable rule.
> i'm using iptable 1.4.4
> regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
