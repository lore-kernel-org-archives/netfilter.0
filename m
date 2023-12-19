Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D98C171B9
	for <netfilter@vger.kernel.org>; Tue, 19 Dec 2023 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="Y+0ilnPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1702988384; x=1703247584;
	bh=felqkhzRlvcS/8+sbbvGhCaZ6FWicuar50tyr+fJe+M=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y+0ilnPnd6i+lhJi2of63ZI9d/ixW5i8Pd8+KfESGQTa8exCjsl04M78re2rRVbLg
	 3Ae0bVHK0SXbGYblFksRoOgbRt9gnN0gh+hD8nw/n3ruRRFWVQxoZMS9zMGD8PCDFa
	 Dj1YED3UAYwg+yKNjZKR0GyU1bqU73DNMHAzGZFcIZqggAZmYLjh8IFbGgctioHued
	 P6bwY2KymPWrdcjIfqNz32K3EwAQw9icGe8Ag3h/yLMa8oPHYyv+6z7rRwnyORB3xZ
	 S2QzFmBnDegpO9TVSIEQuTWd1d4QaH0t2oBi1tVzPnPw60KkzhQxIFZYUf0B6Zbod1
	 wSmK48RS5/9fg==
Date: Tue, 19 Dec 2023 12:19:38 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Zounp <zounp@protonmail.ch>
Subject: Re: Undelivered Mail Returned to Sender
Message-ID: <ZdqLNLBbGjZ0siZOeMmxYkCvDyQO6M9e-UxKXnR4qaH4Cw9kHMR-5VVaNfnncHZfRoe-6uUr-xogQM4srVoz4Q1396B3uVPJ0O1hq7atttQ=@protonmail.ch>
In-Reply-To: <4Svb6P0lWsz3wZY@mail-02.mail-europe.com>
References: <4Svb6P0lWsz3wZY@mail-02.mail-europe.com>
Feedback-ID: 16963546:user:proton
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

If this works at all.

I just send a regular reply and got

"<netfilter@vger.kernel.org>: host smtp.subspace.kernel.org[44.238.234.78] =
said:
    550 5.7.1 Your message looked spammy to us. Please check
    https://subspace.kernel.org/etiquette.html and resend. (in reply to end=
 of DATA command)"

Nice. I am not going to try to jump through your hoops which is mostly frui=
tless. So I register kernel.org as unreachable.
That means, no feedback on the bug reports I submitted.
But then, I presume this e-mail will be rejected as well.

With kind regards,
Zounp


On Tuesday, December 19th, 2023 at 12:07 PM, MAILER-DAEMON@proton.me <MAILE=
R-DAEMON@proton.me> wrote:


> This is the mail system at Proton Mail.
>=20
> Your email could not be delivered to one or more recipients.
> See below for the delivery error and email.
>=20
> The most common reasons for undelivered email are wrong recipient address=
 or wrong configuration on the recipient mail server.
>=20
> Learn more about delivery errors in our knowledge base: https://proton.me=
/support/smtp-errors
>=20
>=20
> netfilter@vger.kernel.org: host smtp.subspace.kernel.org[44.238.234.78] s=
aid:
>=20
> 550 5.7.1 Your message looked spammy to us. Please check
> https://subspace.kernel.org/etiquette.html and resend. (in reply to end o=
f
> DATA command)
>=20
> ----------------------------------------------
> message/delivery-status
> ----------------------------------------------
> Reporting-MTA: dns; mail-02.mail-europe.com
> X-Postfix-Queue-ID: 4Svb6B74QQz3wZG
> X-Postfix-Sender: rfc822; zounp@protonmail.ch
> Arrival-Date: Tue, 19 Dec 2023 12:07:14 +0000 (UTC)
>=20
> Final-Recipient: rfc822; netfilter@vger.kernel.org
> Original-Recipient: rfc822;netfilter@vger.kernel.org
> Action: failed
> Status: 5.7.1
> Remote-MTA: dns; smtp.subspace.kernel.org
> Diagnostic-Code: smtp; 550 5.7.1 Your message looked spammy to us. Please=
 check
> https://subspace.kernel.org/etiquette.html and resend.
>=20
> ----------------------------------------------
> message/rfc822
> ----------------------------------------------
> Return-Path: zounp@protonmail.ch
>=20
> DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dprotonmai=
l.ch;
> s=3Dprotonmail3; t=3D1702987626; x=3D1703246826;
> bh=3Dwj50hMDZvFD4/xZj+XrEg2AUUts5wetTas3VekSoH38=3D;
> h=3DDate:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
> Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
> b=3DSgw8dV8Nc9dO8ZFQHSo5aA9UGza+kXhFt9CkzuoJ0qS8dsHyJVXPXa4KO24AQUSsH
> ts+BVOqMxgxUW8s7T8cea4jIqNvu+X/raSmkHml6gX4OP3tJAqsC/LSMRZiMLth8HM
> ElDn3C9xFnbMoDFlTrAomp75+0ry1bHVkRMTSZdRmTBfnkKA0lZcrWzUyIt2qgE5mv
> UKkKEZUpemjij5rFVPqnUBIHyR6WT/j/nWLn66DLL9H1/FwmkrQ31xpxdGbCkmloy6
> Qb4yd8F1DbL6R/zijmdCvTwIwXDlXFKL2Izwbv+6MF2E5ToPJsNGEPnT1eGJ7g01dw
> rse0TiMc92yHg=3D=3D
> Date: Tue, 19 Dec 2023 12:06:43 +0000
> To: "netfilter@vger.kernel.org" netfilter@vger.kernel.org
>=20
> From: Zounp zounp@protonmail.ch
>=20
> Subject: ulogd2 404
> Message-ID: H6u5vv8MpW91DGSztUN7TNh_Z4K7Rb8yxuOl-9yI9v-uhUFSUe_6EWBpx0vlO=
tJ7eWn5VCW1r3poLb2k0aMfu8Bd4Vv7WWyDzK4uRO1MxBQ=3D@protonmail.ch
>=20
> Feedback-ID: 16963546:user:proton
> MIME-Version: 1.0
> Content-Type: multipart/alternative;
> boundary=3D"b1_rpimedjh5VlSV3mZEbGSRilfgkniEpjUvetTo"
>=20
> This is a multi-part message in MIME format.
>=20
> --b1_rpimedjh5VlSV3mZEbGSRilfgkniEpjUvetTo
> Content-Type: text/plain; charset=3Dutf-8
> Content-Transfer-Encoding: base64
>=20
> T24gcGFnZSBodHRwczovL3dpa2kubmZ0YWJsZXMub3JnL3dpa2ktbmZ0YWJsZXMvaW5kZXguc=
Ghw
> L0xvZ2dpbmdfdHJhZmZpYyB0aGUgVVJMIHRvIFt1bG9nZDJdKGh0dHA6Ly93d3cubmV0Zmlsd=
GVy
> Lm9yZy9wcm9qZWN0cy91bG9nZDIvKSByZXN1bHRzIGluIGEgNDA0LgoKV2l0aCBraW5kIHJlZ=
2Fy
> ZHMsClpvdW5w
>=20
> --b1_rpimedjh5VlSV3mZEbGSRilfgkniEpjUvetTo
> Content-Type: text/html; charset=3Dutf-8
> Content-Transfer-Encoding: base64
>=20
> PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6I=
DE0
> cHg7Ij5PbiBwYWdlIDxzcGFuPjxhIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIgb=
m9m
> b2xsb3cgbm9vcGVuZXIiIGhyZWY9Imh0dHBzOi8vd2lraS5uZnRhYmxlcy5vcmcvd2lraS1uZ=
nRh
> Ymxlcy9pbmRleC5waHAvTG9nZ2luZ190cmFmZmljIj5odHRwczovL3dpa2kubmZ0YWJsZXMub=
3Jn
> L3dpa2ktbmZ0YWJsZXMvaW5kZXgucGhwL0xvZ2dpbmdfdHJhZmZpYzwvYT48L3NwYW4+IHRoZ=
SBV
> UkwgdG8gPGEgcmVsPSJub2ZvbGxvdyIgaHJlZj0iaHR0cDovL3d3dy5uZXRmaWx0ZXIub3JnL=
3By
> b2plY3RzL3Vsb2dkMi8iPnVsb2dkMjwvYT4gcmVzdWx0cyBpbiBhIDQwNC4gPGJyPjwvZGl2P=
jxk
> aXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxN=
HB4
> OyI+PGJyPjwvZGl2Pg0KPGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2siI=
HN0
> eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsiP=
g0K
> ICAgIDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVzZXIiPg0KICAgI=
CAg
> ICA8ZGl2PldpdGgga2luZCByZWdhcmRzLCA8YnI+PC9kaXY+PGRpdj5ab3VucDwvZGl2PjwvZ=
Gl2
> PjwvZGl2Pg0K
>=20
>=20
> --b1_rpimedjh5VlSV3mZEbGSRilfgkniEpjUvetTo--
