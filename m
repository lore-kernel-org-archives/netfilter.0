From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Ho to use rateest module?
Date: Fri, 20 Mar 2015 17:49:36 +0200
Message-ID: <CA+4D1se=aA8T-0je4rznSi7gA1cXky0mdwTfr2MezE86nac1Eg@mail.gmail.com>
References: <CAJx5YvGdOSwb9qpdxs5vemChzqzu78mgk57tsAcVGqSjCMNRdw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=nAbdrqnQ3T40Op+VZufUwu4dxHu2jw7hRS5UY02tSzo=;
        b=BVDWNSLahs49y2n52ig2rtaJc46id0/im8BgPtw6nZ271nKR2vosUHfSP36uweDz3i
         7/vhoMg3joh4UVaIA1R83Aw7Nr5EL+7PMJOrS0iJGRZz9bNk6VlVUkGqVDe51E50bh8V
         duI8x//k5k48GD/Nr5bg2rcngsFJV5NRLMvO2V8C65hqr3x4KEQVzECidIGz6M3UiiYO
         rXj72Mftz3RaZQ1xDDw6qQNYDb4oUl5jm21dd/+5IhoXdR/75F6nB9SBe/X1EcpdCMom
         kN/mtkc8jj3WQLaOrXG0FpPDE5yR+lX+ET2hwGtwP216fzJmAtqFbsYTs5oRhaYBN+f1
         H2hw==
In-Reply-To: <CAJx5YvGdOSwb9qpdxs5vemChzqzu78mgk57tsAcVGqSjCMNRdw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin T <m4rtntns@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Martin,

-j RATEEST measures the speed and -m rateest references to it.

2015-03-19 19:00 GMT+02:00, Martin T <m4rtntns@gmail.com>:
> Hi,
>
> I need to log a log message if ingress bandwidth on interface is
> higher than 3Mbps. I tried to use rateest module with command
> "iptables -A INPUT -m rateest --rateest RE1 --rateest-gt --rateest-bps
> 3Mbps -j LOG --log-prefix "Bandwidth was >3Mbps"", but this returned
> "iptables: No chain/target/match by that name.". However, if I first
> pass all the traffic to RATEEST target with "iptables -A INPUT -j
> RATEEST --rateest-name RE1 --rateest-interval 250.0ms
> --rateest-ewmalog 500.0ms" and then execute "iptables -A INPUT -m
> rateest --rateest RE1 --rateest-gt --rateest-bps 3Mbps -j LOG
> --log-prefix "Bandwidth was >3Mbps"", then the command is accepted.
> Why is the RATEEST target needed in the first place?
>
>
> thanks,
> Martin
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
Best regards
Anatoly Muliarski
