Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B636182D2
	for <netfilter@vger.kernel.org>; Tue, 14 May 2024 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715690063; cv=none; b=DQPW+YKOFDHRwu5AP0ka48s7Zl4Iogwzf4O5p6e+u4qJPBKGwYnMTXVng/e9fnJ+9oS/t/Z/VRQCaOzgEn7oF8681lfS728EtwWsMv64SyUA2U3uhhj5szqIMUfrPFjnMxorePRztkAnBIUOBH8IM6YYrFED2von0paL0JZk564=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715690063; c=relaxed/simple;
	bh=6M7ldYk2BG4T1KUzMDKmU5raYygMpSsc4iWTweNaL5I=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=usOg3NynH3wGM+DSvi1XC5TN/MGpp/u+EvcRpHCQtzZEddS+e/HL+OBRp1Sva45NTQmBx8mWOWSDZ9PPwQDhbwf4YejNmt/FcO7OpOOuKd5/u+baE88c1T5Ny8oJ2k3MJ5/pRI8Nd9vpFhV20cAuJ3y/fgk9QFUf9Xjf/lIRQic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEd/Rxq1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEd/Rxq1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-572e8028e0cso23547a12.3
        for <netfilter@vger.kernel.org>; Tue, 14 May 2024 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715690060; x=1716294860; darn=vger.kernel.org;
        h=content-transfer-encoding:disposition-notification-to:autocrypt
         :subject:from:content-language:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fdLDfCUkMQha0MliagHAfPLsEwBrr9KTxs57mjKc7oQ=;
        b=nEd/Rxq1iwPodxbeRbfgt5hCEszOJdlzCSu8RoCFEE3jKtgnhInVxUk7pTE+IqpapL
         Aplc3kZuLKsN29m+c9CaA764WGN3bAztgXGMv21EZTZsVpdcUsGUIh80+ArCUbD6DCLz
         emflSiuqJPV8j2CiR3lKFQNfAez4TlWscbCgKlCDXGQbuSj/qPh3zLwyqiD2h0iVamVl
         c2onbhnks8/GVBMbZVBrzMN0ZpAd9Z0xKuamrtTo96a8Kc5tC8mM+QXghbuCCiYlcYGR
         hRAXdZXFxzWLXsnVYqExlFE053csX6GryzE0qvZKXmXgac+eBfUT/NQdweHRr8k+6Jr3
         LdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715690060; x=1716294860;
        h=content-transfer-encoding:disposition-notification-to:autocrypt
         :subject:from:content-language:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdLDfCUkMQha0MliagHAfPLsEwBrr9KTxs57mjKc7oQ=;
        b=fNP/EkK2TGiB6T5JRngywiygOWC9tOxOT8ItYHCWykCVa+PLPxc6he/QnoHxvpdK65
         VnDPSDvKnmr5w3WQ/G2A9uYAGR1Ye1TrOoVOPPVecmAo11BsGY+Vj4ai7N0WmploNutB
         k5yNultP1o9PeGMqxlAXuxvcgWy9J9qQ5UtCyAPYft6Uqy0oTBWjL3TCmI5ENTuKpDiH
         bSwgpaYmUaiklMdT+top4lPItMSxjKraL9ibhRkYWhRwDx2m068zOKmHCFGkZ/jdUBVR
         S4D4dbsW4t5z4SkF7kfBlw+PskJJrCVjFLBA3K0uXLeeVELG2DNpOrW8ZVn7bvegz4Sy
         RygA==
X-Gm-Message-State: AOJu0YyPoeKYXhKGz18CnZRMOcwT+jn5zXD+P2n7geyM8JsrlQey5MmV
	mrjgBw+GiaOW1IKUJgPYJPzMN88KS/gYtOSnCiERxIyP9Sy3zepYScXSHw==
X-Google-Smtp-Source: AGHT+IFWg5Ydlyhidc4KQM6mx75Nojy+6T+K5hzaLCIJRhAgscnwO0qYktUBottixsOyYyFEPf9m7Q==
X-Received: by 2002:a50:d793:0:b0:572:3fe4:18b5 with SMTP id 4fb4d7f45d1cf-5734d67aa8fmr7800370a12.32.1715690060419;
        Tue, 14 May 2024 05:34:20 -0700 (PDT)
Received: from localhost (user-5-173-112-203.play-internet.pl. [5.173.112.203])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c322be7sm7597030a12.80.2024.05.14.05.34.19
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 05:34:19 -0700 (PDT)
Message-ID: <b85d894d-6ef7-46ac-b703-3c8284ffc646@gmail.com>
Date: Tue, 14 May 2024 14:34:18 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, pl-PL
From: Mikhail Morfikov <mmorfikov@gmail.com>
Subject: Nftables rules for kernel threads (cifsd)
Autocrypt: addr=mmorfikov@gmail.com; keydata=
 xjMEXRaE+hYJKwYBBAHaRw8BAQdADVtvGNnC7y4y14i2IuxupgValXBb5YBbzeymUVfQEQvN
 L01pa2hhaWwgTW9yZmlrb3YgKE1vcmZpaykgPG1tb3JmaWtvdkBnbWFpbC5jb20+wpYEExYK
 AD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUC
 Y2+BTgUJChtjVAAKCRAy2ctjR5bMocamAP9IDZfiCI48rykaKOsSWTn5WLKb+Fok6YK+s8xN
 v9sBJAEA/y9e22B2q9vkY5o37G/hpbz7UhvrXA1JxKpiSpjzRgLOOARdFoT6EgorBgEEAZdV
 AQUBAQdA1vPaWR/g6H2DzFqi6zjEBCqEv6bOg+N6lahCEuhLc24DAQgHwn4EGBYKACYCGwwW
 IQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCY2+BXwUJChtjZQAKCRAy2ctjR5bMobgPAP9pJvfy
 NkYiTStwBu26LeHT35XZJaYAOmcYWCwItr40iQEA5LlzxZn4r/d70X6pCQuH1FWmuxtMIxEb
 ROnRLyiuVgQ=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In the to mount.cifs(8) we can read the following:

    mount.cifs causes the cifs vfs to launch a thread named cifsd. After mounting
    it keeps running until the mounted resource is unmounted (usually via the
    umount utility).

This cifsd tries to connect to the 445/tcp port. For people who don't filter
OUTPUT there's no big deal, but for people who do filter OUTPUT there's a little
problem with handling such kernel threads.

Basically I'm using cgrulesengd to add processes to the net_cls cgroup and mark
them using different net_cls.classid for different user processes. Then I add
rules similar to *meta cgroup { n }...* and all the filtering works well. But
I was unable to catch this cifsd process. So the question is: how to do it? Is
it even possible?
