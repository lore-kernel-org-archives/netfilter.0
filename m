From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Which "illegal" tcp-fragments should be blocked?
Date: Wed, 26 Nov 2008 09:00:14 -0800
Message-ID: <7259d7020811260900p64a3f60as27102d958c2ef103@mail.gmail.com>
References: <7259d7020811240901o53a4fd7bt99985dd2b3a7cb74@mail.gmail.com>
	 <492C0774.9070002@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=3mizYRDtHDPffHVIkQQP1TusSalwBo0dngkdQw4uwoA=;
        b=lRyHhw+4ZeOop0hyNPcyLVHWdlEbvzGsl3u5/BFW6Gm8sB7WRk7i3QUYLSJWmSNtRM
         /3priiwb/0hdTTgJ/W9IGTN1qviBwVuLYyVWR2LO9YtSH+/3eLqn6o5rwa9ZMD//kYSz
         1Eit2WQ5g64zVxFgbhs7Z+9RhVPdlCAC7jV74=
In-Reply-To: <492C0774.9070002@freemail.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter list <netfilter@vger.kernel.org>

Gaspar,

2008/11/25 G=E1sp=E1r Lajos <swifty@freemail.hu>:
> Hi!
>
> I use the following five combination to filter bogous packets:

Why those in particular, and not the others?  Your set also adds one
mask/comp pair,

  RST,FIN    RST,FIN

It seems that just about every example uses a different combination of
fragment rules.  I'm simply wondering what the logic in choosing one
over the other is.

Is there maybe some documentation you can point to?

--JC
