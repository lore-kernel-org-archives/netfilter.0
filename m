From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Sat, 29 Apr 2023 09:57:14 +0100
Message-ID: <20230429095714.c7bb680249a95c1ace3707e2@plushkava.net>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
        <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
        <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
        <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
        <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
        <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
        <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
        <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
        <459668A7-0536-41CE-990C-2B3E535A5595@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1682758636; x=1682845036; bh=HkTbLQZ4fG/KsYNXir3ZLE0ip
        nV6c8srEQzmgP9Cju0=; b=zVHWLzW9+nHwKLAQRFo5+UUd6oYZqGqPWnRTF7Sw7
        3AABFsDGnVmVpwKBqiu4YpbIovKTeTVpRIRyV6Qzjty91yan6q2g508YpQDOJ3ny
        66jepZCIf2KEVfoGbzwnXlVPcLef6DuNtXTIXk0Ts0bVNTgpEvZ1Wkd0PF2FL+K+
        MNTnN3Kvm9kU5AQZRNsquSP88vTSzr1ES9jBVGSrrkW68Z1xs2zb1pQpjMkZVAb7
        BHN4lq7YOaQQDdRFboJRhl42leQTX575X+pCd+1CN8YtMfCiVtSq1M+r1V+lTPZ4
        X5nuRNcAUujAXGNCtYK+ylA04LbOj+UvjYRKUzuyUkL/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682758636; x=1682845036; bh=HkTbLQZ4fG/KsYNXir3ZLE0ipnV6c8srEQz
        mgP9Cju0=; b=K52nGTB/va59LtI2qzzyMghC+Srq9uF7cIrQ5hTceavShQKVZuC
        IMV+GbO4np+B9cjKLQN6ZrNr/eOzqeU0nkCHy2H6lJ3dEY0k+KeL6TGzeTwzSw7k
        9Duv5H8blfnXStueyAxxtPRXglmZj6dT9wuloUU/lv6vbTEqZEgc7KK6lywgT6ZK
        Z3jiAwsO/u+eHv7iJkiXJf3odgV/R72jGbm1fq5WKx9KcTiOV9/JAMtE303jM7hT
        vMCYSPPTpE2dXOApaphKgrcmq/K9N6xivzGebmzoTsvjP2OuFNIJkYfO8euhzgge
        xPK+z55vb/SRSQbV8Z6pHeDxo8suYBbVj9Q==
In-Reply-To: <459668A7-0536-41CE-990C-2B3E535A5595@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glen Huang <heyhgl@gmail.com>
Cc: Serg <seentr@at.encryp.ch>, netfilter@vger.kernel.org

On Sat, 29 Apr 2023 16:49:48 +0800
Glen Huang <heyhgl@gmail.com> wrote:

> > that are also assigned to the interface at which any given packet arrives.
> 
> This solved my issue. Thank you so much Kerin!
> 
> I actually never understood the meaning of daddr . iif, but thanks to your detailed explanation, it now clicked.
> 
> (Previous mail somehow got rejected, resending it)

It seems that they both arrived. In any case, I'm glad that it helped.

-- 
Kerin Millar
