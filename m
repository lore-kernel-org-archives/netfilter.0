From: paulobruck1 <paulobruck1@gmail.com>
Subject: Re: monitoring with iptables question
Date: Mon, 22 Sep 2008 15:47:20 -0300
Message-ID: <1222109240.3502.50.camel@pauloric.contatogs.com.br>
References: <16d377d70809221125l5e3195cage4035a92352577d8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=UYTIn2V3WHvoo4JXSr7CFF+lLmstnHMHVADK+CDwHBI=;
        b=oV5EYY0Z9mHBq450h54IbEtDP+VuheQArZtI6twtKG1AVcoAwvVKe52r/2NLn00RQ3
         RabdMdyWiBj4yiJkeyjdNt0YQD7b9ryyVyIuWuwT2sd+saLM7HSiOFNgpvzOgwvDSTTS
         /RZFxelXCWeOpQ1WU5LGkeSQJRNiE9MJFV9/U=
In-Reply-To: <16d377d70809221125l5e3195cage4035a92352577d8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Aleksej <aleksej05@googlemail.com>

Em Seg, 2008-09-22 =C3=A0s 20:25 +0200, Aleksej escreveu:
> Hi,
>=20

Hi

> I know that iptables can be used for some monitoring tasks. Is it
> possible to solve the following task with iptables?
>=20
> Let's say I have an application that generates 20 Mbps data for
> transmission, but due to high network load only 10Mbps is actually
> transmitted. So, the output transmission queue is always loaded with
> packets waiting for transmission. Is it possible to see somehow with
> iptables that the output transmission queue is always busy? Or maybe
> it is possible to count how many packets were generated for
> transmission and how many packets have been actually transmitted?
>=20
> I need this for monitoring the queue load. The main task is to monito=
r
> what portion of time the output transmission queue is empty/busy.
>=20
Instead of only monitor what about shape/priorize?? see :


http://lartc.org/howto

http://www.linuxfoundation.org/en/Net:IFB

best regards


> Thanks for any hints!!
>=20
> Aleksej.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

