From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Sat, 29 Apr 2023 16:49:48 +0800
Message-ID: <459668A7-0536-41CE-990C-2B3E535A5595@gmail.com>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
 <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
 <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
 <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
 <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
 <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
 <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682758191; x=1685350191;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iw3C3LHYfAohMjy6BI2lb2UrdSNRh0JMKnXC06wFqmA=;
        b=mYo4K7e8dBRlEFGEbn33P7gNIVVsE7RgvGPlzlZ0KClwjPUCHGM3LbYjZRtNaujssG
         RW18VLyMsAi2WrZxvucTvGaDGs73P2/kaSIsviKkeBGT3p9KR1RDxlXcYsXi/Wdzkaua
         PmWSQi96Q1X26cyBovyJPjjDAdMRNPdNT2ylrSx8zNh8bfda1dGdU+orol6ojpgmoNeR
         SXOFrY2zifi5OOazXT/uVsHL58W9uCAe0QZE/NJDyaEd6F9NBXdSc+vW/Pth5c3X1V/O
         ixYdje3fO7UaAngWyKusynuEmANnlkBgoibdCwPddtX9tnK9iQU2jyKPyKa6yGG43u1n
         k+5g==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: Serg <seentr@at.encryp.ch>, netfilter@vger.kernel.org

> that are also assigned to the interface at which any given packet =
arrives.

This solved my issue. Thank you so much Kerin!

I actually never understood the meaning of daddr . iif, but thanks to =
your detailed explanation, it now clicked.

(Previous mail somehow got rejected, resending it)=
