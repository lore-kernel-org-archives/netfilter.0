From: benjamin fernandis <benjo11111@gmail.com>
Subject: Re: connlimit
Date: Mon, 7 Mar 2011 18:01:56 +0530
Message-ID: <AANLkTi=d32gLoFshPpcMix_zBDiTO6cc1PxkxG0=mnJM@mail.gmail.com>
References: <AANLkTimvu4CSZqsrbMgJHLXB5L8asRpZ+Aq7UM18MWhg@mail.gmail.com>
	<alpine.LNX.2.01.1103071257540.32524@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LccJI8aktKjmRydTfKOkprN0wQuaFNWg+AMAbnn1eMU=;
        b=vsW/xLlwEmQChKKusVaDWvDQKSJ/0JgSPeDHVpFSYspU0ghUAJVpV/XZem/g1LTlkR
         Wq3mMK20599qK7uylNeh2UKfSCLFR3jayDfGbZTrQxD7vq5uhZORlShLYj+1mNMWnnM/
         Oofbshv0OowqQjiB7vzmZ5no8WTf/qb2xtUBs=
In-Reply-To: <alpine.LNX.2.01.1103071257540.32524@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

connlimit is working on per second basis or..........?

can i configure limit per second per ip.............


Benjo

On Mon, Mar 7, 2011 at 5:34 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> On Monday 2011-03-07 12:53, benjamin fernandis wrote:
>
>>Hi,
>>
>>I have a mail server with web server which have 500 customers site an=
d
>>mail account.Since couple of days i m suffering with so many
>>connections.
>>
>>So please guide me to configure ratelimit for that.I need to confiugr=
e
>>connlimit for http , imap , imaps, pop, smtp.
>>
>>and also suggest me connlimit value which is ideal for my setup.
>>
>> =C2=A0 =C2=A0 =C2=A0 OS REDHAT 5.5
>
> The OS value is suboptimal, since the 5.x series's kernel and iptable=
s
> is old and ships a broken connlimit.
>
