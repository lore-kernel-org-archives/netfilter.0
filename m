From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: Which "illegal" tcp-fragments should be blocked?
Date: Thu, 27 Nov 2008 08:10:43 -0800
Message-ID: <7259d7020811270810n749bd2dcme18af7ab458f2c0d@mail.gmail.com>
References: <7259d7020811240901o53a4fd7bt99985dd2b3a7cb74@mail.gmail.com>
	 <492C0774.9070002@freemail.hu>
	 <7259d7020811260900p64a3f60as27102d958c2ef103@mail.gmail.com>
	 <492EB5A8.1040402@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=R57MRmnwrhKYJte5oAbESn9gQTQU0pe1ErMq6UnBiXo=;
        b=bJYha1F4+Wtpah2/bMJfr4WAhYdta0vN4NuDEsDl2kuqhvCqhlYD1yZMnyJlBgeVt4
         AboMbWdvxae+l98mJfVPpnUQi84sElurUPBMQSeJeH8cmq+u/1w6R4SvkVnwf4eQ+ql4
         X9ROGMF5Uj414l5tsEJm+LSa8hBekiSA8uZj0=
In-Reply-To: <492EB5A8.1040402@freemail.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter list <netfilter@vger.kernel.org>

Hi,

2008/11/27 G=E1sp=E1r Lajos <swifty@freemail.hu>:
> So here is my new INVALID list:
>
> ACK,SYN,FIN,RST NONE  --> -4 variations. (PSH and URG never should be=
 set
> alone.)
> RST,SYN RST,SYN --> -16 variations.
> RST,FIN RST,FIN --> -8 variations.
> SYN,FIN SYN,FIN --> -8 variations.

Thanks for the explanation & references! I'm beginning to understand
why you've made your choices.  Just for reference, I've also found the
info on the CHAOS target here
(http://jengelh.medozas.de/projects/chaostables/) to be helpful.

I am still unclear about some of these 'other' invalid mask/comp pairs
I see ... For example,

  SYN,FIN,RST,ACK,URG,PUSH,ECE,CWR  FIN,URG,PUSH

Is this pair already included as a subset of your 36 invalid combos?
Or is it yet something different?

--JC
