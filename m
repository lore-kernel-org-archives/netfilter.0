Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D91DED5B
	for <netfilter@vger.kernel.org>; Sun,  5 Oct 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759667172; cv=none; b=rbIk9baq9d7Gt8Gthawm/1lrmZfzrus2Ulnq83YDOS92UUQHckGdL9avJhTDPrawQ39dp1iL6K2ZzLjKi8jjKyANbSaeNo1MBfSdgKl30af8+fDRC7LzQAyEi0dAQ92cjXKw/Ur9bIDKlfWga3bzkd5JTf726Ym+krhHvrlbVSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759667172; c=relaxed/simple;
	bh=1zUECZarAIPNxd4eo9BpFu1dEUKi8aJ5to4cmfT3vDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erEtC43yDLPTDVx7unS3G/4A+PGhP5tBD6rab2O3uXsKCaZ0PrSIJd3dsyNp5uaYdd1/kmaVHmlDoCbjA4TVhvHA7ILHqE+LSH5vdpFqmEKSrpy+U5TAtVy6zpn5UDOXi29HRE9xS0+ACk0alX0T5nh1mYbjvSNkcVQkpYTCBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJnqFQdc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJnqFQdc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2e0513433bso602872766b.1
        for <netfilter@vger.kernel.org>; Sun, 05 Oct 2025 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759667169; x=1760271969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np30XWO6tH/677EIpp7W0Rmcneg3pAdpFsA80ejl1m4=;
        b=DJnqFQdcd7LQ4YUfErbi/G+WFpl+V2bfJk/OpEDyXbmBvAnpbhnNKjciNojAO9dtK8
         55KdXSrde+ynH5Vwom/g2//78/Xrqils3b/6ctZJmRyTQPyesB0MoJfeC2T7JIJ60ylc
         ZMyKyoSeMHef/454Hlz2sNIQv+ZpFaM/PvlBGkT1nCQRYbeeheUguLIh4uQQk18rcE1m
         qf0sBq4zeSPkftNZQ4A2EoBEfxuM7aiHc10IR4JsKQxjSiapTLZ/KxpXGXbyi3tGE7rL
         wWofjLZHSSYbtUHjoKeudNK4u7fyWOFI27VfFRtRJ+rMTPi81ftrw4RYfzOcDkP4o/Ei
         Wzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759667169; x=1760271969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Np30XWO6tH/677EIpp7W0Rmcneg3pAdpFsA80ejl1m4=;
        b=ZUpHQ7y7fwY7alagOHeQP9JzESTiQyo9QLuCkrb5tNF7hwQb3G1j9rrK+WqPOeHACx
         qonkwbuYF49rQd2hT78trKgT2sOvMnpapk3d+yXXYwEsMELJpYIhAvTUx6bdbBzDGQ3O
         5BNDaPmbh9Y4LOVpxC853DFHnn5JzU+ZMPVM9CbcaKeu6y7e1YuAhwAIh+IZC3kjDYKa
         kNoKic9CdUF/xXNyD5yPTXRdYRLi1abI0PTXedJnRXdTgN1Bs6PtlGcRMTFgBhkBfjT4
         6vEE19KB/mSOqb660xqDt8AIYf+mEZ8YEZDHvFShpIYnoT4ugTKPnqiS9oETAAIvDHdt
         xAYA==
X-Gm-Message-State: AOJu0YxbWR3iodf+iJ+3Yihe+TP4QJEFL2WZ1WcQxFSNfoGcIFOnuYhq
	CnU2CNMW9tFbJfgbSOWmNsTyWWIKs/gxucvgbanDUpUuVsaKMTsU9decXOt8dwSKGt/aTBDKZyT
	i3Thy7GwRq1ZkbnAzgOWYOPVOBCeyURc=
X-Gm-Gg: ASbGncvmwx3RI2zXhsKZFhrKh6FXhiavuePXWEd2zPAxAN96LKfKKud8ndb8DadhVNz
	RX0s+1uig81iAfqCtz8eNEaCXB+fRHRxpoIbj2/fstTIEtvSyV6SUEDiGx9CpOGdlcUswe2HST/
	vNoTmmiEyqv//G89To+UFV7p/glBx/jafSAMphfFntN/ri5gBxnkv9BiCXOHRfHLqOiuTQ64CW5
	JrgjJOB26uvEWnZtvUGvbz71iOLXFKzeP9pqNonV3HFqzG1nt/I/jc4D9taZA==
X-Google-Smtp-Source: AGHT+IEizsPJo5M1Ix0yjNQOA4O7Sk2q4GMOPIfL2OBHmMdEp8IkaOy1IK/usk74Gd+jTG99/DYq2NGvW9XOoPb/mw8=
X-Received: by 2002:a17:906:6a1f:b0:b46:31be:e8fd with SMTP id
 a640c23a62f3a-b49c1f5aa4amr1215827466b.26.1759667169177; Sun, 05 Oct 2025
 05:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGZFCEGKWfnuXdXvSBQEJFfHeKsDKLx0E+SLorBs6HWRUs1kFg@mail.gmail.com>
 <aKM2sOMlivuUJHOJ@calendula> <CAGZFCEHxw0VkH0JJYjxNHevJ69BMZQ9zbhT=YbYS6ti2j8DAwg@mail.gmail.com>
 <aOJaY6oQnYPTcVAn@strlen.de>
In-Reply-To: <aOJaY6oQnYPTcVAn@strlen.de>
From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Date: Sun, 5 Oct 2025 17:56:06 +0530
X-Gm-Features: AS18NWB805sglHYMWNEDvZLh1llGJbNqh1t3lLf7ssLjYbLzsI9zsjST5LqxKgQ
Message-ID: <CAGZFCEEdS7wjCs7S5_pESdMqsMqVezcMS_qmr=mVoKs_PQfNNg@mail.gmail.com>
Subject: Re: nft for bridge.
To: Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 5, 2025 at 5:15=E2=80=AFPM Florian Westphal <fw@strlen.de> wrot=
e:
> You will need to figure that out yourself.  Most of us a volunteers.
Ok.

>
> > MY nft version : nftables v1.1.5 (Commodore Bullmoose #6)
> > My kernel :   kernel 6.6
> >
> > ADD cookie=3D18446462603462596360 (00:00:00:00:00:00,
> > 192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
> > TCP
> > ADD cookie=3D18446462603462596360 (00:00:00:00:00:00,
> > 192.168.11.200:30443) to (00:00:00:00:00:00, 192.168.9.100:35091) IPv4
> > TCP
>
> I don't even know where these messages come from.
Sorry.  THis is a debug print added  in my function  xxxx() to print
flow tuple information.
.ndo_setup_tc()
     |
     |
case TC_SETUP_FT:
   return flow_block_cb_setup_simple(type_data,
                                                  &my_cb_list,
                                                  my_setup_ft_block_ingress=
_cb,
                                                  priv, priv, true);
              |
              |
              |
 my_setup_ft_block_ingress_cb()  {
    struct flow_cls_offload *cls =3D type_data;
    switch (cls->command) {
           case FLOW_CLS_REPLACE:
                return xxxx(nic, cls);
}
     |
     |
     |
xxxx() {
  // parsing flow here
 if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_ETH_ADDRS)) {
                struct flow_match_eth_addrs match;
                    /// debug prints are here to print MAC address
                flow_rule_match_eth_addrs(rule, &match);
   }
     if (flow_rule_match_key(rule, FLOW_DISSECTOR_KEY_IPV4_ADDRS)) {
                struct flow_match_ipv4_addrs match;
                  // debug prints are here to print IP address.
                flow_rule_match_ipv4_addrs(rule, &match);
    }

}
