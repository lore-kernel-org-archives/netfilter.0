From: pauloric@contatogs.com.br
Subject: Re: meta day not working
Date: Sat, 6 Jun 2020 12:06:07 -0300 (BRT)
Message-ID: <516139488.655.1591455967092.JavaMail.zimbra@contatogs.com.br>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com> <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com> <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com> <20200602162536.55948b65@redhat.com> <20200602183819.50b4bd84@redhat.com> <000d2e24-1df3-c42a-3117-05d6390194e8@softtalker.com> <269506832.599.1591449005072.JavaMail.zimbra@contatogs.com.br> <20200606143702.GL28263@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br 62392402ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1591455968;
        bh=OoXSD/I+VPtPf1mCBhctvH3vSaF7Rerg9q8qM1vWYf4=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=R67MGy8sP8VEpS1tiBfYZlbrzmqFXxU9ms7zAfu8XuBOnJ3zB6fOARn+uvkJ4Shy6
         O3SpcCg7tCg6qawQPrPF8yW+z/RJPJ8O4C62Hog1tWECJ2q1hiu7GA1t05goBhn/Mr
         16zwbA3iwVTp3TjeyMDUUXJc7L72vuEuPbSAqNkRmEtVbO3Snw6G2X6tjdrHqymby5
         EMNJNFmVOO47OlEZja81S6yFsoN0IOJedklIqlltVsb84xsnIR5LncNdfFwDhmDFUu
         xIufmmEvJAC8aSAr2Cwz7mF9977l0RukD8hbEwOSpGQFAVgceffEFZgOpfCUU06ZeN
         KWyTWxe1XnBHg==
In-Reply-To: <20200606143702.GL28263@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

shame on me...8(

thanks Florian

----- Mensagem original -----
De: "Florian Westphal" <fw@strlen.de>
Para: "pauloric" <pauloric@contatogs.com.br>
Cc: "netfilter" <netfilter@vger.kernel.org>
Enviadas: S=C3=A1bado, 6 de junho de 2020 11:37:02
Assunto: Re: meta day not working


> only meta day
> /etc/nftables.d/gerais:17:168-176: Error: Could not parse Day of week of =
packet reception
>=20
> meta day "(1,3,5)" counter accept comment "ttttttt"

Anonymous sets use curly braces "{}", not "()".
