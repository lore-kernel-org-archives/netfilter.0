From: <paul.guijt@gmail.com>
Subject: Number of rules?
Date: Fri, 29 Apr 2022 17:02:40 +0200
Message-ID: <002301d85bda$2c265f20$84731d60$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=ORyKRFhFQjvpCik8b8fD2aaZF2ERK9o18SPXkVjZRXs=;
        b=finxl4uhuAgg0b86nZBN1h1aKdgdCgmxH7h7SKEnqZOef6VYKZdq3pc5ATe5S3rVzj
         8fz5/ZT7BUz5TjfirZKqJrvlxAwmCS+jjZ251SZxwDLKRkJ25nUL5yK1g3FjsL3X1DQ+
         bpRXsfjoiVQGfkJ1uK6H5ya3e46257o2i9wCmvGR1Ag2yUYfXRMfy9LzicczLnyO3d3d
         +teTRsNzLwmEGJ8dH7ynpykAV+zKzuREvf5SH9bK/XdxRZkBZ9q4g3tVqM+eF5v5GAYN
         BxqtkX8KefdaQfLAKFQPsEIYe8KztfPiTXK5g2Y7VtgSl/RPNvkv5jXO6FPU4CFj/fKO
         i3sw==
Content-Language: nl
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Is there a way to monitor the number of rules in nftables? I use a =
Raspberry Pi running Raspbian. I want to use that number in monitoring =
software.=20

Best wishes, stay safe,
Paul


