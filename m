From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Thu, 20 Dec 2012 10:58:02 -0200
Message-ID: <50D30B5A.1030605@solutti.com.br>
References: <50D01F13.7030707@nottheoilrig.com> <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr> <50D1EE31.6060201@nottheoilrig.com> <alpine.LNX.2.01.1212192247440.17747@nerf07.vanv.qr> <50D2C156.2050801@nottheoilrig.com> <alpine.LNX.2.01.1212200858460.2026@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=SDou8flo5kp7a0qDlzNn27Jlqul+moRRi8qT/mOAQEw=;
        b=uesLUEsPa17ciinLqffK876uZRxnPnmEIqWAF3FG3jrEi1Fstbo0pKL5qiFJhnrtzT
         cazMMxWNf5gDXsbbrN1ZIUbhTT7+RrB4P/CNd4t9G3UYQSuGR+L1Hf7g0GBbhpNz1XrF
         k6bGJiBQtWryybL9ly5uUmUnYmlBpfwEm+Uwo=
In-Reply-To: <alpine.LNX.2.01.1212200858460.2026@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Jack Bates <uo4zau@nottheoilrig.com>, netfilter@vger.kernel.org

Em 20/12/12 06:18, Jan Engelhardt escreveu:
>
>>   * TOS/DSCP field
> I would not put too much reliance on this one, as hosts take more
> freedom in setting this field to whatever they like.
>

     as this is, in fact, a useless information for general purposes,=20
you can always force all packets with some specific TOS/DSCP field and=20
later alter that to meet your criterias. That way, even if hosts set=20
those to something that would mess with your internal matching/routing,=
=20
ensuring that it will be changed to your default ones would do it.



--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



