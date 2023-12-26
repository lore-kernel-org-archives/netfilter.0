Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ACD4E1D0
	for <netfilter@vger.kernel.org>; Tue, 26 Dec 2023 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk+TJDBn"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e7467eb93aso26150017b3.1
        for <netfilter@vger.kernel.org>; Tue, 26 Dec 2023 03:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703591535; x=1704196335; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6vix120f0Q45To2wDLQMpNzWlKpdUj0Gjzw7QtI/vUU=;
        b=Pk+TJDBnGIncJutb8S1Jk1CizqiPMtpGpaBU0CoBlkOnLgcSfagODtY2LpGdlVfazW
         YT4nT65E6i3o1OieHD32v+gQzo6fdXYI0VAnLt0OPcvu/bvRJAL556GvkaGDpHip+0fx
         yFONq1TFqO8P+UUflTjmeb1a00QgujWqXvb1TBl10xU0JifOx4b8uidJ0+5YEKfYY7ag
         g/QDfMrcbiU+DZ9a0Ur3dxIRa7dW0VbbHENpgL3qzF3ZPcKNuYtAX1YbzCwwz1wfZ44s
         L5BMSqFAlttH5zGzJ4iyrK7092ycg8vgKlc8MO3mcYdMA2Gki3raVy5YEAKIlPInM1t+
         ALvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703591535; x=1704196335;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vix120f0Q45To2wDLQMpNzWlKpdUj0Gjzw7QtI/vUU=;
        b=wstgmFcXiZgowqSTFd6yRTKOBsjWChYuBukKaEshWyhNAuVt8UQJBB18DN6iTj5c2p
         aCIn5tw+uy+ejw4nFHkEs3yS2FomSpvZBvPHItnMVyjVMtXuL2Xa6Q+A0+p0u5STXma4
         2ixr4gGzfMGU9mmHDa/ACp054dkbr8BpL/IVuJse3fRsNKSq8mTc6zHNzyrWR0Y4vXR0
         FAe7wfql1oqOGHuWzxPwel9zKi7WmKNiX2Kl20Zjg9srQy8x0T0lujk8PIz1eLBla++u
         g8Qvfnzu++OeL6aKJL2oYA2xt55u9ktvDzuNhJCQAKjo013SLFSp6eRQQED2sSczgt8T
         3RHw==
X-Gm-Message-State: AOJu0YxtcCHXtY413I8BCj5YDb8YDH+nUyurimlURlj2sR6COe+o0vm4
	fsIBWntgN7qkUXds4nA7RQajCv0XFU1FyD1IgrpQKgu26LU=
X-Google-Smtp-Source: AGHT+IGeFQMsRJHravL9OTJRaa3euyQlTEsqcDxjX1Y8RUJwIFYkfwj9lgKMPj4mnkyKSBbdNhgZDloQsC9te6wVTps=
X-Received: by 2002:a25:b82:0:b0:db7:dacf:4d5c with SMTP id
 124-20020a250b82000000b00db7dacf4d5cmr2121889ybl.88.1703591535083; Tue, 26
 Dec 2023 03:52:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aparna Annapragada <aparnaannapragada@gmail.com>
Date: Tue, 26 Dec 2023 17:22:04 +0530
Message-ID: <CANk2oYkL4yhan7cbOdYFAdyR2YK2uGu2m0Lrpysxq-8x7T29cg@mail.gmail.com>
Subject: Neighbour events for V6 deprecated addresses
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Is there a way to differentiate the neighbour events for IPV6
deprecated and non-deprecated addresses from any RTM events?

The question is because RTM_NEWNEIGH is being sent out for both the
deprecated and non-deprecated IPV6 addresses (observed on Windows). I
am looking for a way to distinguish these.

Any pointers regarding this would be greatly appreciated.

Aparna
