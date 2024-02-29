Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2F60EEA
	for <netfilter@vger.kernel.org>; Thu, 29 Feb 2024 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202582; cv=none; b=ZwMrNraXCIKI9LoTZjqCNiGr9bm6dfLGpFshlYMIU4QcZMUF9Dt0ftfOzBfIZXDWWlvw0RI37a9X7c4bD3Kx/Rk3NhUusizgk+utXMP0X4hnP2ufheWHMhBAoDf8fSD6YFvEq0Ol5825vQ4TtnyKvTTYRDPfvKhBMAlSPbsFA68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202582; c=relaxed/simple;
	bh=O2yeokjXPsQ/r3jv0AE8S5lqpje+o3nCe8CccEI47gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VmBWTQ6WMRBYL04JRRSbi1yfBzmVB58dQ6ghCi4GDUGAtQKLGJioqJ3I5soLjFB1bUbhRSzml1hX6I3r01xcEtdkjP4TPlhFTZaUQDpooBk18ofWzkDNeHLEQznGIB/9fyaI3q7eWCuCOw30XxXmZuhbblX4jNwftz9I/iMsf+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=RISxIlGY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="RISxIlGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
	s=s31663417; t=1709202578; x=1709807378; i=lars.nooden@gmx.com;
	bh=O2yeokjXPsQ/r3jv0AE8S5lqpje+o3nCe8CccEI47gs=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=RISxIlGYwQVjRRukufT47HJfC5NJwTbGRA/3prEkQLNnbZvEjgM9znBu0HgTyJHP
	 NjkEI6Pqej7Nb9jWhv/BPE1UMpr57ThN/6OaRO3eSHLbBTI8kkz8OZF1SeTVaGuDz
	 tfZH02cmSeukZ4Vgc3pPIpYd5eTpgAvG4xwdKY0V0IOhNpwvEd8WnxRkEWMlPVG2d
	 tkkUWhFk+B9ofk+xOdpWm2A48AE1pYvQSBWus/Tt4AMZaxFR+8Ndzh0dS5t/kYErX
	 N9x8u9cBoHz5Tt8BsELYmOgavsUkSE2zuH7PocciGLmPaaAjOszb1l15yYrhjgF0N
	 ye5b91692cZViUIGgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.3.168] ([80.220.96.92]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MirjS-1rC3Xh3CZ2-00ewXS for
 <netfilter@vger.kernel.org>; Thu, 29 Feb 2024 11:29:37 +0100
Message-ID: <876fa728-85e6-4793-a66b-15bea255c659@gmx.com>
Date: Thu, 29 Feb 2024 12:29:29 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: snat with dynamic ip address
Content-Language: en-US
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
References: <8adb4670-f8c0-498f-a06f-8564ec846e37@gmx.com>
 <d819f6e1-6c09-41f1-aac4-542a39f45c75@at.encryp.ch>
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 fQ==
In-Reply-To: <d819f6e1-6c09-41f1-aac4-542a39f45c75@at.encryp.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lrT1taineBnX13I+gp07mocqUX8NH6JxDd9dMTr9UkwItsSLAQ/
 2pJg6yngMIlWAmTANomJ0AByrLha7g7woJKs4DGYjqgxVR+pnhbDK2n/HeGQ7srbs33QnP9
 QDDmZOi+EN479YGEQqOPM2UduMxOLsgaif7vwYXHsvyRpNynDN9Mo/q2CUrJkRBRFDp7Em1
 TsV6jS57ChQMhJf0Bakgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s4pV7M9jfUM=;z15C3EOxOxzCbk1XkJBjPHQxE+I
 1MGo5V+nAiDZ4f5GCuE/AcvHUKaSyhH+YvBDVbdXRj5CxhokrhtVkfrzKRd5apPEDrVgopiqi
 U8o+EPBhr+BEvNyzxDenf9nmCR+6K43JihmyZyzm/m5Q8HNuH/mad/U9xZcCEZZuGlfDTJjA4
 nY/AnDcvS1O9CsA1gEwSPz5kprR1vdfH+g25wqt33MQPK0fePNm0yhME8e9c8aSvebbQ3HH+a
 o1/ODgLsRdyxivD0DjAgEWIq5mIMWYMXQuf2ZpKtdmQb/aeA7mTwuUE/kSCN3G8IcWVMKF07L
 bhdREIIqyYaopqiTB1BMkGY3BC38iP0SWHkTTNK8g0RC85QMy7GMFwrJ96kQnIDmks9sLtkhA
 qlzYBczhATdDbjMrClqDY97Cwlm+T5dTCC7H1NrSMDB86Qr0SA9dhSgRunj6D/EEwHYtB3tI7
 FySzQZq/fVyqkMB3h1lEbtX1O/udgPRZ7hm9ZbDi1vapOo0KXKdfsEFVhNhbiduCnQiWBoF21
 qQcJ+1so0nntHpiIWvhdDtQHpcpmIGmTDbqT1wUKjQp1nXUDSWIalvT50uVb/bMEhYva5a6Zj
 ozNRdu2L+IwYvZCWM7OK8pErDR7BTEjAbH3iPRvO3Fe/4o0s3oyEl3qGK+C8n9kMzX+COSnv+
 IIt5QMa2PC8lRLmWjUSR8oRs2h7/wnm7smkWsjeh6Bqrn6H/PUC3ZQqCaRRQYwoBApDW1NZyX
 Y1GuuekhWlwZYHmljeU+156EAqh2Zw5UEAyGJ18Mrzjl/y7RJT5TXlO05+8uZV3pat9lkwg4F
 E8q+BClnTlFcBTUGfo/EelIJ5k0ggLfj1AvKqS2l4eg+Y=

On 2/29/24 12:19, seentr@at.encryp.ch wrote:
> Have you tried masquerade? Seems like it is what you are looking for.

Thanks.  Masquerade was it.

/Lars

table ip nat {
         chain postrouting {
                 type nat hook postrouting priority srcnat; policy accept;
                 ip saddr 172.16.3.0/24 oifname "wlan0" masquerade;
         }
}

