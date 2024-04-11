Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B361EA7D
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839193; cv=none; b=EkUjnrWNN2ew/tReGziJP6cq7Z5Tl9Md6iEMmRvlvQCWDYo0uFI+yRkvYEtqdjubt+vgm4YCHt4JGM1y6rRNDke/X8iflk1ed0fEkFQHTJ+Dp4lmnf8dVWy4Vr2DRQetA68zyoFAdlXchOuErIMhWL7Xe7HH6ZoOREEcwP6RAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839193; c=relaxed/simple;
	bh=G5nPTg1+Z7ziz7ZVQXJvu0O31FbyfEO0Sua7tPxc9vU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=W81JJC7FS8R4/uwAWAPkUk/3cnI46SpTTo8kbAFdSV9VoPZnbzc9WEzD9yBbPh46swEjQQUGlzs14ejQ6ex6s5KN6OoRhiOSmEI/LTATAdGKNWSJamL6P3ofGR+V2zP+GEpylsdlEwY72EatMhKHUG/u9uiJX3J5DbQQG6NQxv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layeredsolutionsinc.com; spf=pass smtp.mailfrom=layeredsolutionsinc.com; dkim=pass (2048-bit key) header.d=layeredsolutionsinc-com.20230601.gappssmtp.com header.i=@layeredsolutionsinc-com.20230601.gappssmtp.com header.b=XBdoIvlQ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layeredsolutionsinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layeredsolutionsinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layeredsolutionsinc-com.20230601.gappssmtp.com header.i=@layeredsolutionsinc-com.20230601.gappssmtp.com header.b="XBdoIvlQ"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7d6812b37a6so5500139f.0
        for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layeredsolutionsinc-com.20230601.gappssmtp.com; s=20230601; t=1712839191; x=1713443991; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G5nPTg1+Z7ziz7ZVQXJvu0O31FbyfEO0Sua7tPxc9vU=;
        b=XBdoIvlQMz2qaTxodpL/T0adFAptf659oZxUoYJf/5m/mDG/Y4PEoh1H1pvWG3vIgF
         kydw7ncHnER76fM+ciDXYQ1/wuC0XJnKsVbfA+BOFoB03YlxoYBahys4sgxWxeEFzeTY
         xCvkSt9pnpoIr/U5vgyHwMl2tzMfGAuEmsxhYe+rUxxALMXaXn1rV7EPTMQXS2Pwl9sl
         pUqv/gPNzRgWn4vkKsfjcHPAsN92oQ2wbXAEZwpWnezXt+NQMBhq+Mfv/FeL/xXBBit4
         yjmNWVGqmMPbQu51f6Rr2msM7WIeDQwJVC0sjuPxlp2VeC/BpkaYRe8noPXJ836P642Z
         B7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712839191; x=1713443991;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5nPTg1+Z7ziz7ZVQXJvu0O31FbyfEO0Sua7tPxc9vU=;
        b=c6NtcauDyulQPqnVuDsvMLGHtJneNjJwI7HEGIxAf1kJb3yPvq8F9uiESl9W66IVma
         vJ1RQqH7IrQ6y87K3KCA6w2QEnNK7KFJ2172Rz7q9oy9EsnUfxnTuRZVzcDTP/UUaEMe
         aiCLCobLUMCBF1I2UgzI0XGUajURQXsCrC0bq8qYIVrBahSi2nY+58oiDwUDoZBQCyOP
         c4xerVpUZlnsjlrBCRyP8FcgB/dhZN2lVdMcazajKMOncP8sAhmPbFre6B7PIzQEiikV
         PROsCEJRGhNpIC9JgVNyZbI8gPSK/7bQEdhG4Lav3XfjUbA7pV2MoqB3cBTU2r5dcFWO
         Xl5Q==
X-Gm-Message-State: AOJu0Yxl0ctL9WsFbwcO460tkbc9JB6PUt+FDh1L5e2M+EYQJV9yHecL
	046Wqq9dVlN1r78G52ecXRdL0HCzjnzyBYBDXeqvBZoRWMa1VEZk2FNyF2QfKK3YKyfMIyHoCfj
	Nb8uJCiqTLiUr2NrY5LPkvSdr3TeP6JpO90yFsGh0u126LMGlVA==
X-Google-Smtp-Source: AGHT+IEaNED47Iat7Bea1r9g7hOn6Md8pDdqFJUtroxZEaGPDqmCoRzaPA0RQGQZPfBOvbU+6L0TvnXXbs0BA1Mq29I=
X-Received: by 2002:a05:6e02:b26:b0:368:974b:f7c7 with SMTP id
 e6-20020a056e020b2600b00368974bf7c7mr6993863ilu.0.1712839190764; Thu, 11 Apr
 2024 05:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mason Kaufer <mason.kaufer@layeredsolutionsinc.com>
Date: Thu, 11 Apr 2024 08:39:40 -0400
Message-ID: <CAEphJuhKcfOoMvATjubj7T31g32tMqpEKi=yE2OAnNf9768XyA@mail.gmail.com>
Subject: Using iptables and ipset to DROP a list of 2 million addresses
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I am currently trying to set up a firewall on an Ubuntu 22.04 machine
that will block a list of 2 million plus ip addresses without slowing
the network speed down tremendously. I have tried using ipset but I
get an error that the hash size isn't large enough. I have tried
manually setting the hash size but it only allows that option to be so
large. Is there something I am doing wrong or is there a better way to
achieve this? Any help with this would be much appreciated.
--
Mason Kaufer
