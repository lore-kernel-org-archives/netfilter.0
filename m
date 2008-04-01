From: "Salatiel Filho" <salatiel.filho@gmail.com>
Subject: Re: Blocking Bittorrent
Date: Tue, 1 Apr 2008 12:05:32 -0300
Message-ID: <beb91d720804010805q41769e7ah455a59e7eadb4fba@mail.gmail.com>
References: <1207056288.22490.58.camel@tarak.lk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=xCuMToo2Y27S6E9xD9lQ3V+MppV4SiUQe70/j+lQJPk=;
        b=W8LxXpDFk1x0ARCSO7pnfeDFXlM+AHePuf2RDrcYWsH2nlxBcmn31qFLu3CUhK3msPvHAJtQKCTqZW4wBxklZ3c2mWGF5vZtTJQsY8NpVF8H1aCYEcJcBBZEsxAiu3X+l7r2Pdcj7etOQ6SuImGC7Xxp8gV/MMvApdV11lP2CF0=
In-Reply-To: <1207056288.22490.58.camel@tarak.lk.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tarak Ranjan <contacttrm@yahoo.co.in>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 4/1/08, Tarak Ranjan <contacttrm@yahoo.co.in> wrote:
> Hi List,
>  How do i block bittorrent using iptables rules in my firewall...
>
>
>  /\
>  Tarak
>
>
>
>  --
>  To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


Do not try to block , if you try do this people will start using
encryption and you wont be able to track it. I recommend you tu mark
the packets and send to a shaper device of very low priority.
--=20
[]'s
Salatiel

"O maior prazer do inteligente =E9 bancar o  idiota
   diante de um  idiota que banca o inteligente".
