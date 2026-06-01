Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA6318EC1
	for <netfilter@vger.kernel.org>; Mon,  1 Jun 2026 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313602; cv=pass; b=u5ymQwPb3mzzWqe3FZ/Z5wxVxLSeEDobnWcoFWPtAAxqIhkRvPFqwZVtHWAgYZhPE+txcG9julwfHmV0uX89nnJ8Q2xTFWPXsU+QtmU23rRyWnjQPkKL9vGx4GojzKSz+CxYBcmN53XkQvHyFLVCndjRgnmV8qe/1ReUjWO1dpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313602; c=relaxed/simple;
	bh=uVMhWSI3M7PqFpwkfEATZt8vBsIE3hJ1C0QZF5LG9t0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dCmogWgQ3LvQ/pmR82lWTWHwWdc2FbikibjFVedUVYOMya6Uu28ZW4wxKjbgBAeXlucEjCHsqNbdFz5/wY3zaWxr3rrAkYxYCrSt0Nxx82hMvZEdo6n7aCmak2DnyDsHhx6U8a+x1/UuElNIMyzjKqmMGUcE+XGAyLCT87qPR0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=NxZq/K5P; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="NxZq/K5P"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so384290a12.1
        for <netfilter@vger.kernel.org>; Mon, 01 Jun 2026 04:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780313600; cv=none;
        d=google.com; s=arc-20240605;
        b=L77fSz3QdEiZ9VpWNG8xztzOn2bq+r0zm8xi3eGBbGa+pePelOhQwsdMKnDQCvSvIq
         XVytlu+5a4my9G5Zc/uurJ20RqS0+LjzQ526/eVqAiSCKJYeTgBoSXr1t/ACraG6+v2a
         vGMdPg1/gA7YHOkVY+oTYylZgnfKapj3o2LCq3pdylanNsNVWrlojLh3qFApFkDpabeq
         yiFpglV5fWuOEffp216SeWgrx/ALtBVhDdwzS6muQf0/KNZmHlzUzgpbw4V3Lbdi8Y9E
         kHs3aqiPSaKDq5Z022mjnqC+95rsoOU86bxJbOS/YhG7iJDL/gF55p6ehLIgcWimeVEv
         9Ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uVMhWSI3M7PqFpwkfEATZt8vBsIE3hJ1C0QZF5LG9t0=;
        fh=M0sBCZQihETN9vwPtjCqdni0wBqPuE8Z3kVSuTcowfw=;
        b=gQgtiG11T+IdNT69jdGrDF0MyUDDOuoT67bp0plZmtQFE6VN4Ik+AMicwy7g346v+f
         HUJHMdxvJSNsd+zhK7SRRZcGfeZUF8Rxre2eNYUkGCrHDWx8Ce6vEuYA94p2PxfAPLd1
         VP4ZhPWf83460FxTlqR/S6i4re5ofkQ1XCIPkZj9hGwGdWWoVHWjc2DetLBf52YdZMVx
         cL16Fv++fRSxwfJdOvYUcqrNMZ5VzFj+RBAOVywgIDcg2Fa0ndDexxVKdfONGFcLMZ2z
         cL5x1cuXJq8ZwsII1Tvy47FqeXsQFuSVuQ34iUC9XKAg6kj2CJkzIDBFEymSh4t/1JaE
         xLzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1780313600; x=1780918400; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uVMhWSI3M7PqFpwkfEATZt8vBsIE3hJ1C0QZF5LG9t0=;
        b=NxZq/K5PUE0h0E5mGzSrCcr06uEotsZJnn5qP20NrM5IJBFexugyZDJon0nmo7VDjK
         LAsOk5Kav4Jj2LBD7XkQV9KBDwQ0DJjBWBd2u5tdFg443tQC8c/v4YGU0fSgAeinMXtP
         UILenMZXPIcO414OeOhdT3GDiKYB3rE/cdROQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313600; x=1780918400;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVMhWSI3M7PqFpwkfEATZt8vBsIE3hJ1C0QZF5LG9t0=;
        b=GvApFd5Mx+nJT1jjDqDXS8WQe2zlgyg9Sofq2OdPtQ4VFjaH/I+K8LTvHbj9HUDsZD
         Bz7ic2S5OKnOcmXAfO5MLDjx9DGTh9xlqWMXBEGcWrV+mCAAu8rVqDUmOvNmFytlz3bG
         3aFJjXN2FTwIpHtpNxyZjw7ir95tbmbyvE8exNw9igMLH2BfvWfUfAIHrELFol54J1rI
         2hbJqTZRdMQOBkNmHQoDVXMpg4LYDiRL7l2ZxyhfHpbQ2EG+j6uxpsZ3aKow5vrUPlqJ
         XG36UntjBWbxdFIvfuLUIT9zotckVML72djf1XFq0a4BwXylpGv6p/AMXlyRqSy9MQcp
         kI0g==
X-Forwarded-Encrypted: i=1; AFNElJ/kdBshBAJm5eaO+qQIoJrvn9wp77MQZB0guxcHAbB0DklVBwKc2K/wIkz6ZQ7ZNW1NIkZ3f9Xadqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQRCtwEBavrovVk2OHQAELmVSimAbTkdl4vHD5C7oMtudd4Il
	/+ORAzvsvYdZ2LIyy3g10++0uZhhTkgsW9/aU4GVIwuE4vTiBf0KE/Lb0dSMSzU77FE8Saw21wB
	cuXmFEpYAwrpOg6PE/Q1f2wPyngWYLAdzNx0O9G2o
X-Gm-Gg: Acq92OGy+M5fUKzscpwqAt/LN5oyZ05R+Oc5cKMPrydJpgg8J098fZKKMRxa0IgIsIX
	RIjuwQHb5HIQpSCX/CWkFMxLRFjsmSfCeE4svjVtPUb3fiMBhSJw2QWAts6Ixf724r33HKbyqHI
	1KujOclSy7eQaj2oVI+ql9WwQEg2G38RHq9kTWRp2D3CQjserJU6lc4IuZfsQbOwToP2An4Ek/k
	9mVl0VwnsWGCvWrfjJoE9s/RPNouGZYvl56orW2siHYME4tIgP7zSGnJSf3quoynD0tL7y21/n6
	/WWrAWUmPWzYIQ0MynzaUgDf3A==
X-Received: by 2002:a05:6a21:7a96:b0:398:b433:87ed with SMTP id
 adf61e73a8af0-3b427f5dee5mr11677802637.44.1780313600132; Mon, 01 Jun 2026
 04:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 1 Jun 2026 07:33:09 -0400
X-Gm-Features: AVHnY4I4Oq7kfzkvATZfqv_I4dIxsQYBxFxWE5rf6WImcq-_O15EbAx7JO-P5HE
Message-ID: <CAM0EoMkbu0Y-qhtdQ03Zn93JKOUHd6yZy-DJ2mtYDC6aehsR6g@mail.gmail.com>
Subject: Call for participation: New Age Tooling BoF
To: Linux Kernel Network Developers <netdev@vger.kernel.org>
Cc: netfilter-devel@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, netfilter@vger.kernel.org, 
	lartc@vger.kernel.org, ovs-dev@openvswitch.org, bpf <bpf@vger.kernel.org>, 
	people <people@netdevconf.info>, PJ Waskiewicz <pjwaskiewicz@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Apologies for the shotgun - I wasnt sure how to best reach out given
the short notice.

The recent AI tool bug onslaught (on the victim side for me) has
highlighted the changing landscape on development tooling.
As an initial skeptic I have to say the quality and accuracy of the AI
analysis makes me feel like i have been in some deep slumber. I am
still very clueless.
And for these selfish reasons, I am helping organize a BoF at
netdevconf 0x1A (week of July 13 in Rome.it) to discuss this new age
of tooling.
This BoF is a catch all for folks engaging AI in security (you will be
in a friendly environment!), building tools, doing code reviews,
generating patches and general automation. The intended focus is
networking, but adjacent areas are also welcome.

Come and discuss your tricks of the trade. The contribution can be in
the form of a talk, tutorial or demo.

cheers,
jamal
