Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE31217ADE8
	for <netfilter@vger.kernel.org>; Tue, 31 Dec 2024 10:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735642506; cv=none; b=RghOItKdz8V4Rjbe4RUxhjAy09fE2JbYDXZJShv/svFMsM++ym4jnZWbMJMLvQefbp3210QvHrIFt26+LVFRNwd2gaZZ3dq0+hmPb3Y/uENBJi7Z9j38ztxsZz1VM8y8B1CLBN2RnCDc2z5pqqUq8wD/l6b6Taqxao9xniZV6H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735642506; c=relaxed/simple;
	bh=l0cPzNIgdsj2NNFVKuQROl5DaA+Dje7G3rkow9fd6r0=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=Tm5WGnBxOmsRw8FJBSUwGanglmRDwZhKcaB4rZnWJezj2NoT6H/X69QhnDCQXXviSrOQCw/uNC/54sCn0EhXmvadq1OjIxtqhmwjtwOZOeithpaoI3oEP26hfvJ+B1xo4EGK2r2yn/YnZH2fX1jyQqqET0mMLOzynnVP0h9kIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEZnaabb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEZnaabb"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3022598e213so34143471fa.0
        for <netfilter@vger.kernel.org>; Tue, 31 Dec 2024 02:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735642503; x=1736247303; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vs8tqcBs6NvOlPeQgnzPEjPoviMHjf/LyY5Kk2QcPos=;
        b=iEZnaabbIvQydn15g79OwD1E5BZP5fztVcRjRsCnrgMgl8C8YJFF59lHqndvHP4/sb
         UzGv0+/sImtIrYopT8Ys0NTNneHU+wQC1O4H6tuYFAc8hmIM59DYca4Qld/2gcwzwCtO
         TX8HcKEp9V6eyjr5VtQKCwI+hIVd9YJ8r76Z8Bb1qgQwZbT+jSgfJNg4b6eOxtmnMRnM
         ekSX1UWvCYoo6UltYFTKoufVz6t7aSKaLxk8gs81NRjmTWMIk/s8xqJaZDNsBEz4E68w
         vEFauyfVoPMYB98kzyuw7Zu/zA2nRZIhUP1WsfPwM8FqxlvQOy1juOrn62dOock5vVAf
         rp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735642503; x=1736247303;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs8tqcBs6NvOlPeQgnzPEjPoviMHjf/LyY5Kk2QcPos=;
        b=p8eEL/TSxqT17Yc1kLT2RnJMICiCSZSxjRWYJ2nGoNPDjKyEMh+slfVsLZoYvUbHMe
         4fghxp8w404+tNML22N5qWeXop/6SWlF/RFKVfAYq+JFt/jO9rymjwb1bDpGXuWzmdNh
         bM+kl7p4sMiOQAWs7640m90ZYFCQkSC1V7GNisy7EKj1o+CtXQPL5FqcqFpsZUTI8vuH
         HtGBiDBS4krfpg+KdK59TxhHiT9/aDzMIVqtVP3oBZVBUsJkAmo6Xo9oQkz8PwpJuCWN
         aIFliAatrksgdELNXmMtVXHsfc2eT05NV6SrR3s0JfxVL9P5j3e71M1lzCHvpIoaTb4Z
         4acA==
X-Gm-Message-State: AOJu0YzV8gmF6BPjqiFMeTDE9tDCOYdYuYUWds+Eaks0sJzj+BODbDsX
	Wsicf3A0co0uImhpJfqQvy7gyrUWaMbBkeqZDrWp9kiKlD0Qhc46R7XQ0hSk
X-Gm-Gg: ASbGnctuyBY/189fdZHEy27b1fDvOv0zygig0cBd8FmL2SlqGJSxETRrQm7NxpQEPld
	dZSRi8Q1venPKQVSVjyxU1yjaFUR5k1/stTU6kL2cvu1OaBzsflZxClvKc47Q47yoZsTaXVc9MH
	JprRH+OvQB5/wKFm83YTbY+IfWL81lG8bGI9M2geD0r4glTYapkn722v6YtQ1M+YIg8XyyRWMMm
	kaB3jzNq/ECsDKp+RBWeShhU+v1FJ8KxUgjKpNISfyQgkvMlC6maV407qhWuoI8Uo91dV9RZCMD
X-Google-Smtp-Source: AGHT+IHp44mXm9Rq4eBF67CKmkddQZhY0oSl8mKrqLJvdKTaCkslwlWSnv4EYuJv8c0LGl0B52pV0w==
X-Received: by 2002:a05:6512:3a85:b0:540:3572:1864 with SMTP id 2adb3069b0e04-5422955fd11mr10878780e87.44.1735642502723;
        Tue, 31 Dec 2024 02:55:02 -0800 (PST)
Received: from smtpclient.apple ([37.99.45.32])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223602625sm3403579e87.112.2024.12.31.02.55.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Dec 2024 02:55:02 -0800 (PST)
From: Alexey Kashavkin <akashavkin@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Clarification of the procedure for filtering IP option fields
Message-Id: <8647C646-1BE2-4956-9598-27CCADD44315@gmail.com>
Date: Tue, 31 Dec 2024 15:54:50 +0500
Cc: pablo@netfilter.org,
 ssuryaextr@gmail.com
To: netfilter@vger.kernel.org
X-Mailer: Apple Mail (2.3776.700.51)

Hi,

I am investigating ip options filtering using the exthdr expression and =
exploring the code in the kernel and the following is not quite clear to =
me: =20

> On 19 Aug 2019, at 17:58, Pablo Neira Ayuso <pablo@netfilter.org> =
wrote:
>=20
> * Match on IPv4 options, e.g.
>=20
>        add rule x y ip option rr exists drop
>=20
>  You can also match on type, ptr, length and addr fields of routing
>  options, e.g.
>=20
>        add rule x y ip option rr type 1 drop
>=20
>  lsrr, rr, ssrr and ra IPv4 options are supported.

What is meant by type in this example? As you can read in RFC791[1], the =
Record Route (rr) designation in this example is the type of the ip =
option. The first octet defines the option type, which is a constant and =
cannot have any other value. For clarity:=20

> IPOPT_LSRR       (3 | IPOPT_CONTROL | IPOPT_COPY)  =3D type 131
> IPOPT_RR (7 | IPOPT_CONTROL)  =3D type 7
> IPOPT_SSRR       (9 | IPOPT_CONTROL | IPOPT_COPY)  =3D type 137
> IPOPT_RA         (20 | IPOPT_CONTROL | IPOPT_COPY)  =3D type 148


Based on the ipv4_find_option() function I can see that it only returns =
the value whether the option is present in the IP header or not and if =
it is present then its offset in the buffer is taken, but how is the =
addr field checked? For example, I want to filter traffic with LSRR =
option and certain addresses in the route data of this option, but I =
don't see in the kernel where it will be checked.

> static int ipv4_find_option(struct net *net, struct sk_buff *skb,
> 			    unsigned int *offset, int target)
> {
> 	unsigned char optbuf[sizeof(struct ip_options) + 40];
> 	struct ip_options *opt =3D (struct ip_options *)optbuf;
> 	struct iphdr *iph, _iph;
> 	unsigned int start;
> 	bool found =3D false;
> 	__be32 info;
> 	int optlen;
> 	iph =3D skb_header_pointer(skb, 0, sizeof(_iph), &_iph);
> 	if (!iph)
> 		return -EBADMSG;
> 	start =3D sizeof(struct iphdr);
> 	optlen =3D iph->ihl * 4 - (int)sizeof(struct iphdr);
> 	if (optlen <=3D 0)
> 		return -ENOENT;
> 	memset(opt, 0, sizeof(struct ip_options));
> 	/* Copy the options since __ip_options_compile() modifies
> 	 * the options.
> 	 */
> 	if (skb_copy_bits(skb, start, opt->__data, optlen))
> 		return -EBADMSG;
> 	opt->optlen =3D optlen;
> 	if (__ip_options_compile(net, opt, NULL, &info))
> 		return -EBADMSG;
> 	switch (target) {
> 	case IPOPT_SSRR:
> 	case IPOPT_LSRR:
> 		if (!opt->srr)
> 			break;
> 		found =3D target =3D=3D IPOPT_SSRR ? opt->is_strictroute =
:
> 					       !opt->is_strictroute;
> 		if (found)
> 			*offset =3D opt->srr + start;
> 		break;
> 	case IPOPT_RR:
> 		if (!opt->rr)
> 			break;
> 		*offset =3D opt->rr + start;
> 		found =3D true;
> 		break;
> 	case IPOPT_RA:
> 		if (!opt->router_alert)
> 			break;
> 		*offset =3D opt->router_alert + start;
> 		found =3D true;
> 		break;
> 	default:
> 		return -EOPNOTSUPP;
> 	}
> 	return found ? target : -ENOENT;
> }

I also don't see a check in the nft_exthdr_ipv4_eval() function.

If you can make this point more transparent with a code example, I would =
really appreciate it. I need this for further writing my module for =
nftables.

1. https://www.rfc-editor.org/rfc/rfc791.html

Regards,=20
Alexey.=
