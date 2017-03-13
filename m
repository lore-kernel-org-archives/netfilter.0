From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: cookies blocking
Date: Mon, 13 Mar 2017 14:16:25 -0300
Message-ID: <7faeb4d6-0f54-464e-216e-1d3ded678025@solutti.com.br>
References: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=eEQpqk9I96LtsC7hyb2of6wYqV0mmPP4a7TyTGtekZk=;
        b=WmEgdmMytW5JZ+oKNkXw86eO1/HuJouCKjUqGnUqxlUpKJbdtGKPGOdhk+iaUk20tZ
         6+PlgWnKU7DyrjUIzZCBmy2nUx2JF9XtT/hrTfIHS+5HzvlQdF6cbbaDCYKY1N4Hh2V6
         H8lnctfd8N92ZSjl8YmsdZqrajTwtmqCjsACk=
In-Reply-To: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: ML netfilter <netfilter@vger.kernel.org>


     That's a task much easier (and actually acchieavable) by a=20
HTTP/HTTPS proxy server, squid for example.

     Altough netfilter has lots of features to detect strings, u32 for=20
example, it's not actually easy to tweak the streams to remove part of=20
it. It's easier to drop them, but tweak for removing cookies, for=20
example, i don't think so.


Em 13/03/17 13:08, Ran Shalit escreveu:
> Hello,
>
> Is it possible to filter/block cookies using netfilter/iptables ?
>
> I can't see how to do this.
>
>

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



