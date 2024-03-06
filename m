Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DBF1B7EB
	for <netfilter@vger.kernel.org>; Wed,  6 Mar 2024 22:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709763149; cv=none; b=g/ZUoteCS2DwoMNBEQaLIZnnkKVy9UxROrg2XX45m7PEdfRDrafDcQjobXlc/M08eIsANRahd5arsCFEF0JdqcDvfKSLJRFVQ11mVjVSBervVqWEj7MZ/++p8sunjWkcaqqFIyNr7L9tjGWJT9t4XIqfnoN5gFEYRMaMSqSvsVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709763149; c=relaxed/simple;
	bh=S5O3u45DYhWMFVAqOE25wdPATRCt+vFH9BiebbfMj2o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=A+7fElvH9l7L0avQ//Kga3a584fAu4NoIEL+LvX8V7rYg+K+cy8oSGx2af7maB/AkbHLXiboGwse1/k+V91YCLd2Akk4BK46xT7ckSteTFjPBebtClfKYqlI0LByq//NBQ/lU0leeVODMhVztyVwqniUaP8FhcX0SIDr8PqnY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k71zGXZR; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k71zGXZR"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d094bc2244so2129091fa.1
        for <netfilter@vger.kernel.org>; Wed, 06 Mar 2024 14:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709763146; x=1710367946; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S5O3u45DYhWMFVAqOE25wdPATRCt+vFH9BiebbfMj2o=;
        b=k71zGXZR8/nA0XTXhD67xdpRUJEXfGs/r9HyEZUbDIICKIKXtmesBSNan9nl/PPC3X
         6ArXF8dN+jqtdhqV8pVYk3XDsQDAPLKHTSu3uXajITT7T9qNcdmB1KH6fMg/z5o3m8FA
         hUO4E1nXf+wvRp7c3yB67nVoPmbIae8h+JhIexrUhKRUOBCdxp635ofAGqPR682PZ44Z
         EUO2k+u7iWXtN2dbXiLejbPxMpIWgcYJgM9pxaFO/4IKqd/+YOqDfrzyppCJEUCv8yei
         xHtVO0g2cUsXRvzfU4fZ8IsgIpfCaH4wZps5SR7hC/6I1sd6X+xpdd2P7rHhe/t+Aqms
         BKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709763146; x=1710367946;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5O3u45DYhWMFVAqOE25wdPATRCt+vFH9BiebbfMj2o=;
        b=aNZIYDwPHB1HHwtm2yP4HZZTI2gxDMVhuzrAwrPkzLyTdUTNkITiWQOTRBhzW5Tas1
         uGHNjmmVUEkj1JtuyTFrrtpcWo27h7z92khmpp+xymszXZC+F+DqpkbQdNxPT7yJQs4V
         hD+fscGEHQ3o13E0fFbaUxjZDlltUGJ6Xn/w+XSE40AzO9PnuVVra8ZsS/Qhgf9Wt1/j
         7V1gkA6T2f+0PCSXt1xwzQhuWp8lP63VwkNneM3Sm0miNeWkvq1taAv93iXwhy/P8459
         /CtLky9c0jqd3hDscAuEzmx5UKAeyJ4QfifVP6wTdkc2WbGZQ2dBevJCbd1ta1D5GEJ5
         Opxg==
X-Gm-Message-State: AOJu0YywE+NcbjnVffQmbkHZLHoKWm9t7RJbF4YzwdO+cKaqAoYtWvO3
	7qYJKW/d9aD8AC0l3kw7r0Q9kAcJsFjgLw5pgc85yYId/gUelda8F9qbhuq9NvZ4bkiTcHD0ob7
	F0OLeZiBvWQc05pwWqzNDFIUN6ZfEvfbFKB177g==
X-Google-Smtp-Source: AGHT+IFdmQ+MzJNibm1pxALR48IKFcXaj5VoCrOZbIlFxHaPl3jxHiXXR71b+JgdGSQ1h59+vaU5ltq7xAt/o+qn3lc=
X-Received: by 2002:a2e:a229:0:b0:2d3:93dd:a192 with SMTP id
 i9-20020a2ea229000000b002d393dda192mr192904ljm.45.1709763145520; Wed, 06 Mar
 2024 14:12:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sreedhar M <sreemtech@gmail.com>
Date: Wed, 6 Mar 2024 22:11:49 +0000
Message-ID: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
Subject: nftables rate limiting per multiple seconds
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Team

I am currently working on configuring rate limiting rules with nft and
have encountered a challenge. ex: I would appreciate your guidance in
achieving a rate limit of 10 ICMP echo-request packets within a
10-second interval.

Here is an example rule
example : nft add rule filter input icmp type echo-request limit rate
over 10/second drop

I understand that nft doesn't directly support specifying rates in the
format "10/10 seconds," and I'm seeking advice on how to adjust the
parameters to achieve the desired rate limiting behaviour.

Your assistance on this matter would be greatly appreciated.

Thank you for your time and support.

Best Regards
Sreedhar
