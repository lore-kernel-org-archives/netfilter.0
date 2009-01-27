From: =?ISO-8859-2?Q?Bla=BE_Ba=E8nik?= <bacnik@gmail.com>
Subject: Re: DNAT on another interfaces' IP
Date: Wed, 28 Jan 2009 00:51:50 +0100
Message-ID: <57b62e7d0901271551uf4d9d18y3f4f97a0f6b9f2f1@mail.gmail.com>
References: <57b62e7d0901270638u75e23a92gf5f0e0c40cf61343@mail.gmail.com>
	 <20090127214554.51d68578@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=SPZvLQ8THptB8SvJJZVTy4Q67R19/XuNfJYNpI5BMNo=;
        b=WlpqloP4a6tub0YlQGSRVS9TpJxokFPlKtSuZVKFVKalH608yzl90o0NUPnxl00RQN
         T0hiBYJkjZdI6AvyV+OIr0RFL1Intwc0ma6QL0yJ3HxJFiyGtDhSwoRj+2+v0yytXqhE
         rDvDmg7lXUQAv8w0+Xly+Ro9uvvLK7WOCtq5Q=
In-Reply-To: <20090127214554.51d68578@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Thanks for your reply, I managed to fix the problem.

Router runs some other configuration software and I totally forgot
about raw table as I never personally use it. It was a rather stupid
mistake on my part and I apologize for wasting your time.

Regards, Blaz


On Tue, Jan 27, 2009 at 9:45 PM, Marek Kierdelewicz <marek@piasta.pl> wrote:
>>Hello,
>
> Hi,
>
>>iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 22 -j DNAT
>>--to-destination 192.168.2.2
>>..
>>If I ssh through eth0 (from 192.168.0.3) this gets me to 192.168.2.2
>>as expected. But if I ssh through eth1 (from 192.168.1.3) to IP
>>192.168.0.1,
>>I connect to router, meaning there is no DNAT in effect. Is this the
>>intended behaviour? If so, please explain why.
>
> It's not intended behaviour. It should work the way you want unless
> some other rules in nat/raw table prevent it. Please send the output of
> following commands:
> iptables -nvL -t raw
> iptables -nvL -t nat
>
> regards,
> Marek Kierdelewicz
>
