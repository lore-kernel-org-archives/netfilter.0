From: Pavel Kasparek <pavel.kasparek@frafos.com>
Subject: number of elements in nftables set
Date: Mon, 2 Oct 2023 09:50:27 +0200
Message-ID: <ffd50ddc-6543-93ef-a0ef-55f6a9924926@frafos.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frafos-com.20230601.gappssmtp.com; s=20230601; t=1696233028; x=1696837828; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEToN/OeiQDpa93/nRO8ueluM/gXpnT+rr2x5MyPIy0=;
        b=vIiqij/dgG131La/lccOWhZz5hMieqZ8aM4LxpKwtruF3A1t8XuYLoqIBgTLfrbeKd
         ADpIkm1jn7FTcfbr7Ef4s6ggAxydE1h9IUMtmbLiVl67zyM2WmXAufj9NarKVxQM+Yqb
         kKOQy1GCNTk0+9o8MJf6v9pWgTzfS0/h615BhKsg6QSV3XJy7JudOBivQZ9MuV7fTGX7
         +uUMVaPdHJIRx7AHq1W6PRorQ6JfOJKVPg4gBgWgMr6OwbZYSqtja4eF3j5dOvuvp1vH
         JOEENIA1r3UsZyv8IFkh/tfeQsiNy0b0tHWAJPmbO1QHHeameVdRya2h9BYgJqx0fQ/Q
         AhUw==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

please is there any easy way how to get number of all elements in a 
named nftables set ? (I mean smth else than getting all the elements and 
counting those.)

Pavel Kasparek

