From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: [SOLVED] Re: Is it safe to use libnetfilter_queue in these cases?
Date: Tue, 12 Feb 2013 11:03:58 +0800
Message-ID: <20130212030357.GA16608@devnull>
References: <CAJZVxRmmCeft+f-9wS4LbWzposct+3Ed5586E7opGa=xZKfyag@mail.gmail.com>
 <1360564394.5195.14.camel@ice-age.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=mdLzWIS5gW2/MMgPj4eqYO37IRxUd3hjBdbR0M+bI3k=;
        b=JAHyF4cwhywFchIIIGnTxFalvk2nacU1h50UKAQFQB2ZVZ03jBPh8az2lvxRvx/wb0
         a9lPWuD6MkcaIdSJWEAkTpElwX1w3tjVnVrIh+Uahez17Rd2qJyR1PKJZJdbFdVR2iaH
         L8qwZKsXNLg66CORNtxGrKNugdcMQU+CqVr/ICFMjfd0NzyT2T5nzNI4K7F2QjZ4QsAY
         xBo2VE7wAnNQ+lYABVSAk/SrOjNK/GR4NYSndA+iT38Ov49pN2e6GB94UIiZmhNbO9Ur
         1VCcx7KhscqFWrcAI96IdQMUbzGen3lO5W2P7ABhXagEuuh1zgkloAWOhcR8svSLt+cs
         JnYw==
Content-Disposition: inline
In-Reply-To: <1360564394.5195.14.camel@ice-age.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

Bonjour Eric!

On 07:33 Mon 11 Feb     , Eric Leblond wrote:
> Hello,
>=20
> Le lundi 11 f=E9vrier 2013 =E0 12:43 +0800, Aaron Lewis a =E9crit :
> > Hi,
> >=20
> > When I process a packet with libnetfilter_queue, would it be safe t=
o:
> >=20
> > 1) Consider a packet is always valid, for example,
> >=20
> > In the callback, you extract the payload to a "char *data", now you
> > want the protocol id, so you check data[9],
> >=20
> > Is it safe if I don't check the package length first? (Would Iptabl=
es
> > drop it manually?)
>=20
> It is always good for security reason to check the length.
>=20
> The following document contain useful information about
> libnetfilter_queue:
> https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_qu=
eue/

Thanks!

I thought iptables would discard invalid packets, I'll do the
packet length check

>=20
> BR,
> --
> Eric Leblond
>=20



--=20
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
=46inger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
