Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B07081F
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738279432; cv=none; b=fW3bDYREXQrX4K2w2I3USMLnL1H1ZP3lH8CGVwNyNfgixC6TxJrOVrgozNTqAj11Wo/zmG/VPoMnXnbVfNC5umAvyDhPCamVV2NYWDFkAbiuGrq6vDSQ/fKGP+XeD9HxhqzGkK4eVM16FrWklydiz31Yvg11jWg5yVNxwa7/ohU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738279432; c=relaxed/simple;
	bh=ceBkOPJBlpwFlAkrF0Y7gLIeSIWnQiPDNyJY9jjR10Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OgtYAozZfy//aQzk99YnoCIDnWkDA694guoZI1C2Uhj4yAhbQMaRVFXKYp7Ut9Y4P5aCHQEIxFYQQcI10x9RqT+ljGJ99YMM5HfmzRCcM6dc9SL8xqssSCasCIYH5hZqk2VM/oQjlvdaLxRW1DuxWoiGQcbs2LiM/9/vLNsLUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhzObwn6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhzObwn6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso1165337f8f.1
        for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 15:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738279429; x=1738884229; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APSaop3/7Op+YgiLcsHFmditeHri2Zsvb5hDmJhZXHk=;
        b=OhzObwn6iCW3TO8NvPBsmMlrJNSpsO3M6wCT0me9Bm2lsULT/R7PY1TlyXdwW+JRSy
         YXLosMGQ9KhaavMiErhVZ/LFnGqospAhDsgurD16B29I0cad1OHuVBfO+FfilmgviQTe
         b0sy9nDGKEMPrebUaguDeIZp0nN0eSyX5KvXE9KUzY/aGhkGMhuz01LTHRfltuxU+H6q
         v+wuiNQUgyc4s9PMuq59QvFfK2WLpfpEwWpLo/rbeij0odfRFlBNF3B7rGMMTxL/BJss
         tEQ+9Rb+2HcQjHeOvav/SryElCiR3uo8p2SBgBVyq2aPAmlT7+EiaTLWIzx1uuyUCf50
         LjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738279429; x=1738884229;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APSaop3/7Op+YgiLcsHFmditeHri2Zsvb5hDmJhZXHk=;
        b=JRAEn4ecNyc11Ga55X/NLJQV2aDUIFammCZrYPdvihMXwHmgmV4Q3y9LFTZmUw3t8f
         hj20Lhnm0eKYCuJ9FRin5cGj6+WM3LJyCl4Vcuv1Eqq1/FLRElrgA8Svp3wgYB5HAv+F
         IB4NMh7VdpBkhXGoReSv4tbDtg0KBd5JWmKeJlaBArANWySco5Je55gz1nhGtTwz58/6
         1aoWsF4W2Xlxd6RlNRE9XK9jQ/4xFLzv1w+q1LRj46B1HAjwwfO6riV5PorAwJ07Iapy
         jjyX+e6kxLIwZHwOoMTNGehAzpn88py64DbJJfsnCMAqvAgXWyFT4IGWaB6dx7xZXjvj
         mwuA==
X-Gm-Message-State: AOJu0YxOa5Qbf3TdbYLwAEdpCtgUHnZ/kB5amw/LSQZNsO+e9TLxQRtd
	GHvjRmtJn//LCSu22yPsLa74sG3eCGT5XdSPU6vDL+Qquk+RNH4l
X-Gm-Gg: ASbGncu3IwXQmfbIuQnCklXBPSowpR1a+B0h/j4ooFhH/kHN6M9lelueuRJY75Npr5+
	FFuC8tRNv2TRpv8jixwtITSA4HrcnD2lDKKZN4uwT9ANJDFU7+fJUHjPVe0FQ3kC1EabezIOK4b
	pL1c9526/9Eb2gVwIhpW3hhzUMEgBhfXazWlSbLEkOs1TeCxL6hoNO2SwF5SAGvJvGZoUAh/CCl
	dNUrrFULqK9FTpg0byc6lD+POqemXPhhXW/SNFN0XKH4c5iL49TEYcnVwWbvTVZEWsow3Txs0Pa
	Zd+fakar+YDvsk9opzBx6Xb+n17Ff7l3Gpj4JoGXalKEsH21Y050vedSG3P5dAR3ULbZa8DODFR
	7JUNqsw==
X-Google-Smtp-Source: AGHT+IFjk5mCRB5yO62hW+6VJhPeXWEFCQrW70w4MHtV2hsKcn4cRWV4d5X0OnTA/qgL0OkHp2WB+g==
X-Received: by 2002:adf:f685:0:b0:385:fb34:d5a0 with SMTP id ffacd0b85a97d-38c5196a442mr6703920f8f.29.1738279429038;
        Thu, 30 Jan 2025 15:23:49 -0800 (PST)
Received: from smtpclient.apple (ec2-18-184-164-91.eu-central-1.compute.amazonaws.com. [18.184.164.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b574fsm3183498f8f.70.2025.01.30.15.23.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 15:23:48 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: Clarification of the procedure for filtering IP option fields
From: Alexey Kashavkin <akashavkin@gmail.com>
In-Reply-To: <Z5u_wv3bfDkRKLXE@calendula>
Date: Fri, 31 Jan 2025 02:23:36 +0300
Cc: netfilter@vger.kernel.org,
 ssuryaextr@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <BCA1A218-C8C5-4CB4-91A8-8237EF440CE5@gmail.com>
References: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
 <123C96BD-BF4E-4EE5-8330-35B35E5A37CE@gmail.com> <Z5u7sji0GX4Hfjci@calendula>
 <Z5u8cNsrlEn5JH5g@calendula> <Z5u_wv3bfDkRKLXE@calendula>
To: Pablo Neira Ayuso <pablo@netfilter.org>
X-Mailer: Apple Mail (2.3776.700.51)

> On 30 Jan 2025, at 21:06, Pablo Neira Ayuso <pablo@netfilter.org> =
wrote:
> This is what you mean:
>=20
> # nft describe ip option lsrr addr
> exthdr expression, datatype ipv4_addr (IPv4 address) (basetype =
integer), 32 bits
> <ip-option-use-ipv4-type.patch>

Yes, changing the data type for the addr field in the templates with =
this macro makes it more user friendly and allows the user to specify =
the first IP address in the IP option in the network packet as the value =
of the addr field.

# nft list table ip ipopt
table ip ipopt {
        chain ipopt {
                ip option lsrr addr 192.168.0.11 drop
                ip option lsrr addr 10.0.0.1 drop
                ip option lsrr length 11 counter packets 0 bytes 0 drop
        }
}

I assume that Stefan converted the IP to a decimal number and then =
already specified the resulting value in the addr field.=20
For example like this:

# echo '192*2^24 + 168*2^16 + 0 + 11' | bc
3232235531
# echo '10*2^24 + 0 + 0 + 1' | bc
167772161

# nft add rule ip ipopt_t test_ipopt_c ip option lsrr addr 3232235531 =
drop
# nft add rule ip ipopt_t test_ipopt_c ip option lsrr addr 167772161 =
drop

table ip ipopt_t {
        chain ipopt_c {
                ip option lsrr addr 3232235531 drop
                ip option lsrr addr 167772161 drop
                ip option lsrr length 11 counter packets 0 bytes 0 drop
        }
}



Without the type field in the templates as a token for bison and =
ipaddr_type as the data type, this functionality in nft becomes more =
correct according to RFC791.

Thank you for the clarification.=
