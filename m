From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: FW: Matching by packet connection
Date: Fri, 16 Nov 2007 14:33:00 -0800
Message-ID: <d95317090711161433w3fd29085n5d37e77adb51d8df@mail.gmail.com>
References: <003b01c828a0$65599ff0$300cdfd0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=duHJBgGGj3vAilceB9Ij+2NXW7FMwRb7n14YtQ4YQXg=;
        b=WFAm04DsTscs0UgnoMNxuIeCgYS4IlzeDjW51Bt691vJZvbVnu0gnjIw5vyjLE63z4XjGOzZU61GQzs6sW1HxXPwRixhrJj8VHIf1wNGhY1Ic59JGdUJ6zMxfN0NKt7WvZmQZXFMmp+ZCfLCZmmUIp52DMuXlIBBTl5ZWuswNik=
In-Reply-To: <003b01c828a0$65599ff0$300cdfd0$@com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

>
> Gilad Benjamini a =E9crit :
> >
> > "If a packet matches <condition> and the state is ESTABLISHED and t=
he
> > packet is in the same direction as the connection, then do
> > <something>"
>
> If I understand correctly, you want to match packets which are in the
> original direction of the connection they belong to (i.e. the same
> direction as the first packet) ?
> -
Exactly
