From: John Little <jlittle_97@yahoo.com>
Subject: Re: Using iptables with high volume mail
Date: Thu, 1 Oct 2009 12:39:40 -0700 (PDT)
Message-ID: <900981.20015.qm@web53108.mail.re2.yahoo.com>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com> <1254412984.11386.63.camel@enterprise.ims-firmen.de> <4AC4DB93.6060707@freemail.hu>
Reply-To: John Little <jlittle_97@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254425980; bh=HS/jvBdkvMPBE5Er1JrGrlDCE8+WZgcXlcDuwZXal3M=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=Xa8b2qtzTDA3STpzW1Nhn1cz1AE8rGdIzfyCpMmFp+ELIS1mXT8wnApLi/fVO+SOe+Bt/uaiAG2x1UdvzkSsFB+NiRahQjNWvWjj8X1aYhQx7DvEYbBgcA1jzZc7J+/UiSm413fCwIU3wkVi+Qn1cEbOdrEUNeV8X7hEJ67o4XY=
In-Reply-To: <4AC4DB93.6060707@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org



----- Original Message ----
> From: G=E1sp=E1r Lajos <swifty@freemail.hu>
> To: Thomas Jacob <jacob@internet24.de>
> Cc: John Little <jlittle_97@yahoo.com>; netfilter@vger.kernel.org
> Sent: Thursday, October 1, 2009 12:40:51 PM
> Subject: Re: Using iptables with high volume mail
>=20
> Thomas Jacob =EDrta:
> > This all really depends on the number of new connections and packet=
s per
> > time, rather than the number of emails.
> > =20
> Agree.
> But I would also check the upstream bandwidth and concurrent connecti=
ons per=20
> time or per destination.
>=20
> Swifty

@swifty - Yes we have agreements with upstream and manage our connectio=
ns there with throttling so that we don't exceed our allotted connectio=
ns is a given time period.

@thomas Thanks for those metrics.  We are looking to see if the connect=
ions per second is generated with our current devices.  What we do know=
 is that our max outbound connections will get as high as 16000 for a p=
eriod of time (maybe 2-4 hours) and will occasionally burst up to aroun=
d 20000.

How does that compare to the metrics that you mentioned earlier?

Thanks,
John =20



     =20
