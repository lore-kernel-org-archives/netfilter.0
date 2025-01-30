Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AD1BEF85
	for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738245164; cv=none; b=qikCfbXyhmXWjtHbtgf/Cnfb6Jhbm9syQwujexDGNS72bvy/DNsOqG1/9+DZtxEnQR20+jEAzxgDzHhmYXciEdfAY9FVlqYLUa4oXmHcgAIedcoPPfLhNX+Vz4KIcGhw2sCkAKQi2lg+b+BvFAAzrwE/30pKEHa4uhk/6MIg/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738245164; c=relaxed/simple;
	bh=Ux1+0dyhpyH7QB182T/tlNUAcJIo33obSTTN4h+30kU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C7subNaIHRgucVFG3FFwfqSfIun37BCe4BJdGddHWQiXgmJzXLE2/DAC0WwFQp5PMRHaNEZUFIHH5f4xZmgQjmtuDxCKP3OU0theJjdroX6gsXTInH8b9HzDplFh6EgPZPYcbUG3y9EFVVZ5Im0QDEWx/Yyq79tdJbXS7KtGZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rcj8u+hV; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rcj8u+hV"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30761be8fa8so7810051fa.2
        for <netfilter@vger.kernel.org>; Thu, 30 Jan 2025 05:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738245161; x=1738849961; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N46+UGBc5okiLam/pULWtBgwkUVMTbCf2BbV4iqpto=;
        b=Rcj8u+hVlLvYZPuYqf63xTsUYWQfng74q1H1uapUjMfQNAHUbzHLDUgLPCArYn2/nm
         NjuZ4ZQCv679BagS+LuJ1xRTmH1m3uCy4G4lAAaIogoXtZ2oq66DHnVp2Ciru9Qld+3u
         2laMV/jXWusSmxDLyLQRfCsk6I0+sgcxSJBF6S/fxQQGjz07goa5p8VHovO1pzB/fhMZ
         X+FhQoh+drCqt5sPaPTN7fJ/irJpSl+93kcOeeJYF7c5gedhKVmUWFvT2ZuaRCRCNpSd
         p/1bRcLK4/+MHeaqgP/PWtqBr/vcD5OI5WS6D06PCcgLXoIqbbV3Ntpsl0Qobrqks668
         HkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738245161; x=1738849961;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8N46+UGBc5okiLam/pULWtBgwkUVMTbCf2BbV4iqpto=;
        b=lkpKajw7118C10m2SN0vXhIeRA9M5dF3vzZ9DxYpAZOmv3/A/vh2rHd91bKmGlvYU/
         +ZCOmXijgoyDL8vuBpfh5Z6TOYwqUUhWFPlz2NV8y5tM36hQIRL6oU8wlADQ8kGbObPv
         wERZaZWZLcmUxqhaOi1Xf1ClaQ2/ZrHFOUHKFToJW8utvfA1ODfdC9B+k9YzPmbBPDw/
         D7mT8No6iU/uokULnK/G5N9aVFw6E7qOGTroaG59ond220DmwfnhskfKlnliPVYAmd26
         r+XI+5nuU2y6JKAHySdo+ImEtkknUVYarLEglizvp9dgK5LjAZOkaj3bAhsmLXjgTdCi
         ix+A==
X-Gm-Message-State: AOJu0Yx2Oe1LFkCBa990RvcjbPiGIiGhmJ0MrcKDSBH8BW7K9mZC2fzI
	PLtr+RlOWUTYSBAtLXDk/t4Qc61CIjRKcGTxfbMyxNXHKqivj/ENuEMkplXP
X-Gm-Gg: ASbGnctOi95vgnLQGSFG3O33hSbx9oIqVZt4E85r+DEHVV55UyQhREkF7BWy0/VruJ0
	ovHeF3ixOpVmy+GXQvRPyOMW5bQrUQqDIDg7bt9PyOxyknUwqr/VneMtYksxo3KULhiZmGmEH4U
	ct9Td0oy1zmHtZbC6oL78VSLdCO6yjygoPe6SxYA76a2NVWS9vMgvligTyhQ18vtmbxxaESu93W
	1VP7CbOZHew2UCfiSH5Xtp3HelGNf06ucVVW3mKXms/etHICkLRABnkwW1/1zH4X9XZc8etxlOU
	CcCrZEk8MGeTtReLjuacQGCQPJmQRuPO
X-Google-Smtp-Source: AGHT+IF370UO3V4T6T64YsMWX5ZTzZr79UX4PmpDYYRLKMJuisvFXMKZkqx7h8fwUqvunh5wRmSg7Q==
X-Received: by 2002:a05:651c:24b:b0:302:336a:898f with SMTP id 38308e7fff4ca-3079684e27emr29779171fa.9.1738245160261;
        Thu, 30 Jan 2025 05:52:40 -0800 (PST)
Received: from smtpclient.apple ([195.16.41.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a343c474sm1915801fa.110.2025.01.30.05.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 05:52:40 -0800 (PST)
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
In-Reply-To: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
Date: Thu, 30 Jan 2025 16:52:29 +0300
Cc: pablo@netfilter.org,
 ssuryaextr@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <123C96BD-BF4E-4EE5-8330-35B35E5A37CE@gmail.com>
References: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
To: netfilter@vger.kernel.org
X-Mailer: Apple Mail (2.3776.700.51)

Hello,=20

I am still figuring out the syntax for adding rules to filter IP =
options. Please, if anyone has an understanding of how this works give =
at least a short reply.=20

I understand how the exthdr expression works in the kernel code. But so =
far there is still a question about specifying the type field, what is =
the purpose of this field here? There is also a question about other =
fields, let's take for example the IP option LSRR, it has an addr field. =
I assume, knowing this option from RFC791 it specifies IP addresses, but =
in the case of nft it is not so, this field has datatype intereger. With =
length and ptr fields it is clear, but with addr it is not. Please write =
how it works, what value is substituted in the addr field.

Thanks in advance.

> On 31 Dec 2024, at 13:54, Alexey Kashavkin <akashavkin@gmail.com> =
wrote:
>=20
> Hi,
>=20
> I am investigating ip options filtering using the exthdr expression =
and exploring the code in the kernel and the following is not quite =
clear to me: =20
>=20
>> On 19 Aug 2019, at 17:58, Pablo Neira Ayuso <pablo@netfilter.org> =
wrote:
>>=20
>> * Match on IPv4 options, e.g.
>>=20
>>       add rule x y ip option rr exists drop
>>=20
>> You can also match on type, ptr, length and addr fields of routing
>> options, e.g.
>>=20
>>       add rule x y ip option rr type 1 drop
>>=20
>> lsrr, rr, ssrr and ra IPv4 options are supported.
>=20
> What is meant by type in this example? As you can read in RFC791[1], =
the Record Route (rr) designation in this example is the type of the ip =
option. The first octet defines the option type, which is a constant and =
cannot have any other value. For clarity:=20
>=20
>> IPOPT_LSRR       (3 | IPOPT_CONTROL | IPOPT_COPY)  =3D type 131
>> IPOPT_RR (7 | IPOPT_CONTROL)  =3D type 7
>> IPOPT_SSRR       (9 | IPOPT_CONTROL | IPOPT_COPY)  =3D type 137
>> IPOPT_RA         (20 | IPOPT_CONTROL | IPOPT_COPY)  =3D type 148
>=20
>=20
> Based on the ipv4_find_option() function I can see that it only =
returns the value whether the option is present in the IP header or not =
and if it is present then its offset in the buffer is taken, but how is =
the addr field checked? For example, I want to filter traffic with LSRR =
option and certain addresses in the route data of this option, but I =
don't see in the kernel where it will be checked.
>=20
>> static int ipv4_find_option(struct net *net, struct sk_buff *skb,
>>    unsigned int *offset, int target)
>> {
>> unsigned char optbuf[sizeof(struct ip_options) + 40];
>> struct ip_options *opt =3D (struct ip_options *)optbuf;
>> struct iphdr *iph, _iph;
>> unsigned int start;
>> bool found =3D false;
>> __be32 info;
>> int optlen;
>> iph =3D skb_header_pointer(skb, 0, sizeof(_iph), &_iph);
>> if (!iph)
>> return -EBADMSG;
>> start =3D sizeof(struct iphdr);
>> optlen =3D iph->ihl * 4 - (int)sizeof(struct iphdr);
>> if (optlen <=3D 0)
>> return -ENOENT;
>> memset(opt, 0, sizeof(struct ip_options));
>> /* Copy the options since __ip_options_compile() modifies
>> * the options.
>> */
>> if (skb_copy_bits(skb, start, opt->__data, optlen))
>> return -EBADMSG;
>> opt->optlen =3D optlen;
>> if (__ip_options_compile(net, opt, NULL, &info))
>> return -EBADMSG;
>> switch (target) {
>> case IPOPT_SSRR:
>> case IPOPT_LSRR:
>> if (!opt->srr)
>> break;
>> found =3D target =3D=3D IPOPT_SSRR ? opt->is_strictroute :
>>       !opt->is_strictroute;
>> if (found)
>> *offset =3D opt->srr + start;
>> break;
>> case IPOPT_RR:
>> if (!opt->rr)
>> break;
>> *offset =3D opt->rr + start;
>> found =3D true;
>> break;
>> case IPOPT_RA:
>> if (!opt->router_alert)
>> break;
>> *offset =3D opt->router_alert + start;
>> found =3D true;
>> break;
>> default:
>> return -EOPNOTSUPP;
>> }
>> return found ? target : -ENOENT;
>> }
>=20
> I also don't see a check in the nft_exthdr_ipv4_eval() function.
>=20
> If you can make this point more transparent with a code example, I =
would really appreciate it. I need this for further writing my module =
for nftables.
>=20
> 1. https://www.rfc-editor.org/rfc/rfc791.html
>=20
> Regards,=20
> Alexey.


