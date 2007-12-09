From: Deephay <tudoxxx@gmail.com>
Subject: Re: how to do a MAC-based filtering for NAT
Date: Sun, 9 Dec 2007 22:18:42 +0800
Message-ID: <9a9df61d0712090618ha74fa7dte9b89c8d8177408f@mail.gmail.com>
References: <9a9df61d0712082111s90a5fa3o4d272b2c1dacc1f1@mail.gmail.com>
	 <475BD20F.6030206@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=DpRx5l4GAr3PhszBZdaI1KvqUO6DlspkSIrS2TK7ICw=;
        b=xRXSugDvMh/0ct63v2d1XRBis60MkJ3AZFQtYVftmjDsCoeS3L66PfE5UAz5xggnqToVowIB60k1y6g0J+Anfhew/tf4Jjw4xk06tb4S1WhT/pAIhoD2v48Mg9kCOyJRQy6TZc12M/aI7vyAwqarud2OMmMtEAYDIg/6X0UtZ0Q=
In-Reply-To: <475BD20F.6030206@solutti.com.br>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@vger.kernel.org

On Dec 9, 2007 7:31 PM, Leonardo Rodrigues Magalh=E3es
<leolistas@solutti.com.br> wrote:
>
>     Yes it works if you have the correct rules.
>
>     Are these 2 FORWARD rules your only rules ????? If no, please pos=
t
> your full ruleset.
>
>     If yes ..... i can clearly see 2 problems.
>
>     You have not told us about your scenario, but i'll suppose you ha=
ve
> the simple scenario of a linux box with 2 NICs, forwarding packets
> between NICs. The --mac-source rule you made WILL work. But you're
> clearly missing some rule that allow packets to came back, the replie=
s.
> You're allowing the packet to go out, but not allowing replies to get
> back. So, 'it will not work'. Based on your scenario, you certainly n=
eed
> some rules to allow the return traffic.
>
>     And if these are your only 2 rules, then you're simply forwarding=
,
> there's no NAT rule here. Packets will be forwarded but the original =
ip
> address will be kept, that means, no Network Address Translation (NAT=
)
> will occur. You would need some '-t nat -A POSTROUTING' rule for doin=
g
> the Source NAT.

Hi, I am using one NIC with PPPoE and

iptables -t nat -A POSTROUTING -j MASQUERADE

as the NAT rules.

Is there a solution in this kind of situation? thanks for the help!

>
>
> Deephay escreveu:
>
> > Greetings all,
> >
> > I am wondering how to do a MAC-based filtering for a NAT:
> >
> > iptables -P FORWARD DROP
> > iptables -A FORWARD -m mac --mac-source xxxxxxxx -j ACCEPT
> >
> > the above things will not work, is there a way to achieve this? tha=
nks!
> >
> >
>
> --
>
>
>         Atenciosamente / Sincerily,
>         Leonardo Rodrigues
>         Solutti Tecnologia
>         http://www.solutti.com.br
>
>         Minha armadilha de SPAM, N=C3O mandem email
>         gertrudes@solutti.com.br
>         My SPAMTRAP, do not email it
>
>
>
>
>
