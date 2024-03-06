Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C73E48E
	for <netfilter@vger.kernel.org>; Wed,  6 Mar 2024 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709729923; cv=none; b=kZzX1XJTEcimAypyquHna66b0O/0d3pOr1kWcXcBLBI34qYuaZxuTSBjP+EOj+UgUm9DUn8UuTJVaQnKee9Z2ttCu5b1vW/7hYeS/1Z1H3vB2bdzWQcUm1Rj1CKzHSpYrKjNj6H+Fy8HeT89MxULUXjw7uzZUtzhPiYBf//N0VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709729923; c=relaxed/simple;
	bh=bAzPX4Is0jo1+xGFp2bx5MDYfknvTg3G101C7anW0IY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MYF0OL5AxOIu3XCh+QQYGIT9LH3OkHPZu5loApi6CCzE+5v79T3ONNrRAgod2p6U1jJmLLNVXIsTheh3WUOA/9Bu/FnoyHoCqekLwyn/ZzpQAnmN5Qt5qFUXaYqwUrthRvvuKM/hG1qiVpfvH3Hzgl/K6AGoFjMC3lxQE8K1Hg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFe6TJRM; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFe6TJRM"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-565d1656c12so1510469a12.1
        for <netfilter@vger.kernel.org>; Wed, 06 Mar 2024 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709729921; x=1710334721; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Rs1OVmyYkvoDWLSToIEfbFCrjq3ojueRGsM7t6p2ns=;
        b=jFe6TJRMt4dV43TNJa27Y+bQGuVJI3GS++kNS+Xy35bsWsIXL8L3lGMDbmU1Fi19DK
         s5jd6fE9WxHSaWRppDSttsIvCgwP/L6ZhhbUMFzfPNiJrwVhwjdpOtJswLSwc4mj3ilR
         A8VlJeheyZkQxOHbc07Y1lzkHvjK6NEnZWXidy9iFm1JLRvA4yRV7hMiTzSB475fJ7bq
         CciiFvO+Iezb3RA5r9adeea7piyZ1B9bGW268FUKz4fBxPmsgfziQQT1KPwxfEfvgbuF
         p4pr2D8tfUF8dHkKVAOfkW7R2F86xQwPOylPZIGvLJ2Y8qbgPuK+LYieZ+wkeQo/7B8e
         c2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709729921; x=1710334721;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Rs1OVmyYkvoDWLSToIEfbFCrjq3ojueRGsM7t6p2ns=;
        b=ZDpXHbBi6o7LqgxZnrq4rSO7qCTlxejfNwf92zxd2GZJXfel5mYTFqTIuvNRuIONxu
         TDLkagNvH+NB0fh1wUfsWgwMDii9bIj6Vdbf9yQNcy8r5KHMIEDwTsqXku4txzVlz0xz
         KK6rtmNkB+wmoBNP63ApUkz9rVe7EiRz5+bO+bfkiMRjnhoOaYwV0j+PF6mfPTZtlqh7
         8TlWIR+J52Ae/Q0jplgEfGgGnA5Nu8NaLq3ilsrmW+pF86+ywbdEs19Kn8RjBHx7QPTZ
         pFJEknJPtYw5zUhg8VZQbTgUkSsNCt8Uy6kBBy1HRO+KJdVERitXRE/CaJZM4P5bYFVp
         Y2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCX034mQT/AYxDxudyW9yDxSWs2K7Nzw9ACvKfQR3Z6AffPN0LF5fc1o431jouIB9fwV/I+gIamRkpSgHj1IEg8bd//sZu7Ty7Kd
X-Gm-Message-State: AOJu0YwYAcmJC0Hr2dGSZmlcrhEXPQup8C/O4qPleT7X1hm+BQhfjFX8
	f23zFi5fxXK9YJEEYrQkV1d2Y3Zg8c0AKT7qdDop9t6wepWQ35SzRilqWK8PEExf6afFScVHEdN
	jyxnjQ27U5Gk2BkU4b2RRhHOOOQAvl8f1EBEvHA==
X-Google-Smtp-Source: AGHT+IFhoox/ui2hijtbVR+ZYYH9a5aCV0RqadCzzCsaelBrYYqGdBDRayyhzPjeehe9CyAXI2tLLckfJJgGYJzAVkg=
X-Received: by 2002:a50:cd87:0:b0:567:a17f:a703 with SMTP id
 p7-20020a50cd87000000b00567a17fa703mr4006427edi.10.1709729920496; Wed, 06 Mar
 2024 04:58:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2AsqNG7zXsZyw2ONxTH65WDCfEMAEDSt4mJGSuZXmZOZQ@mail.gmail.com>
 <20240306094042.GB4420@breakpoint.cc> <CANvpR2AXG1by20jtuvNAkaHJ=QBnx0z+CHVM1__c2rskgX49_w@mail.gmail.com>
In-Reply-To: <CANvpR2AXG1by20jtuvNAkaHJ=QBnx0z+CHVM1__c2rskgX49_w@mail.gmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Wed, 6 Mar 2024 12:58:04 +0000
Message-ID: <CANvpR2AH5coOMmHM6zhGrGVt6XuRvga70y8oOEVv56PvGvYRJg@mail.gmail.com>
Subject: Re: nft socket module
To: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Florian , I see some of the rules are missing

Another translation missing - iptables-translate -t mangle -A rms0-pre
-p tcp -j TPROXY --on-port 7881 --on-ip 0.0.0.0 --tproxy-mark 0x1/0x1
iptables-translate  is not translating , please the below o/p
nft # -t mangle -A rms0-pre -p tcp -j TPROXY --on-port 7881 --on-ip
0.0.0.0 --tproxy-mark 0x1/0x1
I have translated this to below : do you see any wrong in my translation pl=
ease
=3D=3D> nft add rule  ip mangle  rms0-pre  meta l4proto tcp tproxy to
:7881 mark set 0x1

Thanks
Sree


On Wed, Mar 6, 2024 at 12:52=E2=80=AFPM Sreedhar M <sreemtech@gmail.com> wr=
ote:
>
> Thanks Florian , I see some of the rules are missing
>
> Another translation missing - iptables-translate -t mangle -A rms0-pre -p=
 tcp -j TPROXY --on-port 7881 --on-ip 0.0.0.0 --tproxy-mark 0x1/0x1
> iptables-translate  is not translating , please the below o/p
> nft # -t mangle -A rms0-pre -p tcp -j TPROXY --on-port 7881 --on-ip 0.0.0=
.0 --tproxy-mark 0x1/0x1
> I have translated this to below : do you see any wrong in my translation =
please
> =3D=3D> nft add rule  ip mangle  rms0-pre  meta l4proto tcp tproxy to :78=
81 mark set 0x1
>
> Thanks
> Sree
>
>
> On Wed, Mar 6, 2024 at 9:40=E2=80=AFAM Florian Westphal <fw@strlen.de> wr=
ote:
>>
>> Sreedhar M <sreemtech@gmail.com> wrote:
>> > Hello
>> > I have some issues with nft socket module , please find this  , I cant
>> > get the socket functionality on nft that I was using iptables, could
>> > you please advise
>> >
>> > iptables-translate -t mangle -A qrms0-pre -p tcp -m socket -j MARK --o=
r-mark 0x1
>> > nft # -t mangle -A qrms0-pre -p tcp -m socket -j MARK --or-mark 0x1
>>
>> Translation was missing.
>>
>> Try:
>> nft 'add rule ip mangle qrms0-pre ip protocol tcp socket wildcard 0 coun=
ter meta mark set mark or 0x1'
>
>
>
> --
> Best Regards
> Sreedhar



--=20
Best Regards
Sreedhar
