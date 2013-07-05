From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Re: Understanding --tcp-flags option
Date: Fri, 5 Jul 2013 09:01:10 +0800
Message-ID: <CAJZVxRknnadn1GAfhfDHL7qCLew9cXiLBfmYZETdqaD1SedbbQ@mail.gmail.com>
References: <CAJZVxRkQmbFdi32VRu7jg4aoJoYgQmhjfMoGii5u-Jai_dAvHg@mail.gmail.com>
	<51D5717E.60604@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=y3vHT0L1tihvyOVP+ZfxyNp067Z8FFnNpWcYbRyrUsM=;
        b=q5vZoI+LmhCRf1vCjVp75p0RP85BwS2DcDSc0cUuwSavbRU4o2XWjLQT7+mCrl5NhD
         carDPdHyRugsdxn5zYNDEnox0fcAsCQX4kxirvQz96db2GfM0pFo3TYqPp2ZgcojZble
         352Edj2oab3x4YOxpNcyIkS32/ydSbTcJWdPXnsKfkJWBK2RJUb9ptlUod2bFSpaL7Gp
         SyBFWuH+A9j1CYnmzPZxXkiUTnXcIa17ABSztD9BzGoG5YqJOV7VJLmAARQPiovnE4Bo
         jUKrCuDKoQm928szXn42FY2skSK81pOunYzGmInOyNKnN1Qi7EP2SpIMZkwAmsx1MgUQ
         VSxw==
In-Reply-To: <51D5717E.60604@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Merci beaucoup Pascal, I get it now.

On Thu, Jul 4, 2013 at 8:58 PM, Pascal Hambourg <pascal@plouf.fr.eu.org=
> wrote:
> Hello,
>
> Aaron Lewis a =E9crit :
>>
>> How should I understand --tcp-flags option?
>>
>> 1) There's two parameters, why need two of them?
>
> It allows to match packets with some flags cleared.
>
>> e.g I might just need to match a packet with SYN and RST bit set,
>>  why do I need to place it for twice (--tcp-flags SYN RST, SYN RST
>
> Wrong syntax.
>
>> 2) What does this mean? I don't really get what "mask" and "comp" do=
 here
>
> The mask specifies which flags must be examined, and the comp which
> flags must be set. Therefore flags in the mask but not in the comp mu=
st
> be cleared. Flags not in the mask may have any value.
>
>> --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,SYN
>
> This means match if FIN,SYN set and RST,PSH,ACK,URG cleared.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
=46inger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
