From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Ipset kernel panic
Date: Mon, 15 Oct 2012 09:41:31 -0300
Message-ID: <CADuigkW5n0vxVm3eKykw-pV7WH6xe7YP0cAEQcS5EF5BnNaTkw@mail.gmail.com>
References: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
	<alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=JM2NNWp0w2bB0lI7+S4LTUUzANd1Xl65AfckKWMhYIs=;
        b=QJTdm2hVWG17B6Hdtwz19lXQxJrSPc4bLtoWpDGlJk7U27UVihahZJXtZ6XWl6UVz8
         Vp+qwCwvBZYQUnJ8pyuOeepD3WXLm2vzQScZnz9gv+L3iD34+zy7WnFbPM0ws5GKVDR5
         7/TY+5hD/yhjJJU51LmK75el+avGZ9tvLQh4VpsmJw++Avr9yTgFeMpIze2G3tSCF+y0
         p6cgk62Xzc9GgerdEv4PoYFyG65ZW6WVeQPekcu8HGocgu/JbcqyWZyD5B44pBXhxY/s
         l1Sxr9zK7j1/mO5yFabpw2oYCxJpjz8uiuwDn5HHbSdW2quGlKmrSCwRs/gl6JR6OXVd
         M4cg==
In-Reply-To: <alpine.DEB.2.00.1210150927390.4945@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

ouch, sorry, I didnt saw nothing about in the changelogs.
Thanks for the advice.

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Mon, Oct 15, 2012 at 4:28 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 15 Oct 2012, Ricardo Klein wrote:
>
>> When I create a set like this "ipset create test bitmap:ip,mac range
>> 0.0.0.0/0" and try to list with "ipset list" I got a kernel panic.
>> ipset v 6.11 CentOS 6.3
>
> That's a bug which is fixed in ipset 6.14.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
