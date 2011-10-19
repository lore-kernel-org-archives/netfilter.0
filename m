From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Re: kenel level packet capturing
Date: Wed, 19 Oct 2011 14:22:35 +0530
Message-ID: <CADAe=++9WYg6nGH1vZ0BZKP5CDHO30i-pNVhBzgO9C-6FQX6cQ@mail.gmail.com>
References: <CAKj1SsP+GE=QqN8nx7aaAxXE8BODKb=vns_=SnbyySQjZp3-pg@mail.gmail.com>
 <CAKj1SsOnYsOXjRBKm+=hTnEiesXrC3h0Q-KN2b61nPSQud9wMA@mail.gmail.com> <20111019.031314.1383303852454510720.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=vU6DQC/HQQbe60drtjOfOxWjKnbANAQ5J/bJDNyT+Wo=;
        b=I6XiU2L+3OGz7XcoUYFirgCpZ7gL+PLwv4lp8yvayoT46mDdWu18hE+kV4BVVZfSqP
         2u4qPZ70pNxxngcX+fPRbNaOmRl2RIWFHSoUIU2W4ReK1jK96o7MchhQKsvb1XmtjNhF
         LvfEizc5rRgROO/tsfyBDeahQNsRWdfJlGmRk=
In-Reply-To: <20111019.031314.1383303852454510720.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Miller <davem@davemloft.net>
Cc: raviraj.j1991@gmail.com, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Yeah you are right David. But ..

=46or a newbie who just know more about linux userspace level need to
know starting steps like where to start from and flow of packet might
be confusing because of the level of abstraction being used. I guess
it might take some time until you are really serious about making
hands dirty :)

Regards,
Ajith



On Wed, Oct 19, 2011 at 12:43 PM, David Miller <davem@davemloft.net> wr=
ote:
>
> From: raviraj joshi <raviraj.j1991@gmail.com>
> Date: Wed, 19 Oct 2011 12:24:01 +0530
>
> > We are finding it difficult to understand kenel networking code.
>
> That's surprising, because the Linux networking stack is the cleanest
> real world networking implementation on the planet.
>
> Perhaps you should think about re-evaluating your project choice?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter-d=
evel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
