From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: REJECT as a default policy
Date: Mon, 11 Jan 2010 22:08:42 +0000
Message-ID: <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com>
References: <4B4B1339.1040502@gmail.com>
	 <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=c5gEHyTR9RSqP4+6P4u7mFUqJdHpwttKFD/XugyeWNs=;
        b=Xd7bdPA1TMLIczmLLXYhO8zrG8ewjobxSAP3rzuk1uocpshJu95fNrXQKd2GLTbART
         x8FIzj26BxG0b/zdVBal142G/uUhZfSh61WwLYzIdF36nwPNn7ddrVlkW0JR7fJk/JE5
         TpKPj9kl+RyAix/sG0brWYQw6FOSpLB9F6PqA=
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gary Smith <gary.smith@holdstead.com>
Cc: Lars Nooden <lars.curator@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

2010/1/11 Gary Smith <gary.smith@holdstead.com>:

> I'm not really seeing the added value myself. =A0I think it could hav=
e a negative benefit to many who use the chains and expect the default =
rule to be ACCEPT in order to fall through to the next rule.
>
> Or am I not seeing your bigger picture of how REJECT would affect the=
 sub chains?

I think all the OP means is DROP is valid policy target where as
REJECT isn't. The big problem though is that DROP / ACCEPT as policy
targets or jump targets require no options where as the REJECT target
can take options to control the returned ICMP code, which with the
current policy handler you couldn't specifiy.




--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
