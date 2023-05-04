From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Thu, 4 May 2023 10:55:55 +0800
Message-ID: <AF79CB30-4C30-4876-967C-B817104EAECB@gmail.com>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
 <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
 <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
 <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
 <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
 <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
 <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
 <459668A7-0536-41CE-990C-2B3E535A5595@gmail.com>
 <20230429095714.c7bb680249a95c1ace3707e2@plushkava.net>
 <259EB616-F421-469C-89E1-12496603999F@gmail.com>
 <20230430200934.91ef05c51eb2e053a51a00d4@plushkava.net>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683168959; x=1685760959;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LELqvZ7cZJ+cQ/ijeL5DWI1yObLD9y8vXN1JwUGes+s=;
        b=qfUovCqBLel/oKR3/9wDClz37NJ35mWE23QrszWz1kjtHDHrWjc30H2iDaqPrfLm8q
         1XmDrfO3s8OAPxR5o2BaDRYsb4Hy37ic+eD1+RK5AcelKxREQxEtZ80n/s9pjt2zC+bC
         dFdgi4sCNNztRHWf1aJb3H0YLvBuqLCt7tXkNNEHIat6c6qkluzn44FXLQ0xIAWNEd6G
         56cswn/dO/V2SgNI8xqLZ1yEoN9CIf2AelW/pLGWTe8uinH1yu/NpAJOpww7xfPIydlA
         rJoKmJctZHQX+H6M38JSDe0LLYdor9wQcCEOUnHzYOckyx/U9tj0C3IyljAz6QUC4SSX
         HudQ==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <20230430200934.91ef05c51eb2e053a51a00d4@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org

Crystal clear.

Thank you very much Kerin.
