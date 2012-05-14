From: "C. L. Martinez" <carlopmart@gmail.com>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 08:40:56 +0200
Message-ID: <CAEjQA5JZ55ku3DZuQ_Oe+Ne-85Lr_zMse7VudYAryO5aH8-JLQ@mail.gmail.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com>
	<alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr>
	<4FAECDBA.9030302@saasplaza.com>
	<CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com>
	<4FB0A732.4070909@saasplaza.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=UM71sR2pq2nAxBmxxVZYNaX7LnI4pqvVHnUj1i35zCA=;
        b=dvrBIO2HuCEqcBiYBkyALxHo2O9tHkT9lqopKJdyAQYI7YnyI7mMkisS9ryC1Subrt
         twujmqixI2VKl29ihVGRd2zXfIQbPdDAgOPAs5tcbiwezAoz/4hpJTWjSy106ndkE4Lf
         p9hOZYpPP1w7Ax+5l96+QN4zXtW75qW5KUUDLs6Rt2poWShjEyHMVGBhHWGbxGQ797fO
         ZfEkoXyTp9YaDmDJsp91l2peH4gNdcJTEKsaWDnLSNZJq9OxsQxiDMF05PAvZnGJ3uPC
         u8HCIYkSHbeEsZ18TVkVfkbEzhbfpZ8TGB1vNJRqhwmsfDCPtR/mu0pjYgm95MsX0MHO
         D6CA==
In-Reply-To: <4FB0A732.4070909@saasplaza.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, May 14, 2012 at 8:33 AM, Tom van Leeuwen
<tom.van.leeuwen@saasplaza.com> wrote:
> Alright,
> Judging your ruleset the only relevant lines for your host 172.24.50.3 would
> be:
>
> :FORWARD DROP [2:80]
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -s 172.24.50.3/32 -m state --state NEW -j ACCEPT
> -A FORWARD -j LOG --log-prefix "IPT FORWARD packet died: "
>
> And you said that restricting destination does not work. Your rule:
>
> iptables -A FORWARD -s 172.24.50.3 -d 1.1.1.0/24 -m state --state NEW -j
> ACCEPT
>
> You say it does not work. If that is the case, your packets are logged and
> dropped.
> Could you paste the log entries for your host 172.24.50.3?
>
>

Nothing, no drops ... But connections died by timeout ...
