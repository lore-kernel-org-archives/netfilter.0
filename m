From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Feature suggestion ...
Date: Thu, 10 Sep 2015 13:21:11 +0300
Message-ID: <CAEzD07LM3U9V2ZQLyk5P6n=W7pB0aL25Q+AnsFOXWq+UWA5JZA@mail.gmail.com>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
	<alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
	<CAA5aLPjhXREe9W6fT1oNj=mKV3Yb6CBSLP44do-sgBrhKHa2mA@mail.gmail.com>
	<alpine.DEB.2.10.1509062215520.13557@blackhole.kfki.hu>
	<CAA5aLPi2of6Z4UGmD9pqvcq3hr2HCgVMrK46MxRKDbYL-jwK5w@mail.gmail.com>
	<CAEzD07JL13Pv00-b1B_y2UUK327O91kMMMc157yX6J93M2VPng@mail.gmail.com>
	<CAA5aLPg3hZOctA8VMRtg85L7i7VZ1NCG4yTA2E7HRTk_VcU+6A@mail.gmail.com>
	<CAEzD07JQYbtrjBr18=zS0vGMKhFXL52YVcaf3FJqa1Z3TaYZsw@mail.gmail.com>
	<CAA5aLPi3AuC3m0cZgU1wZ3_U=wQoL29tUjVjX9DYO1gU_bjMAw@mail.gmail.com>
	<CAA5aLPjLFNhsAwP8uLVq=v-gNYaa6uU17Yqh8ikYwfPXEuQUww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=4IUxoRJyY9pA6zjBpagXhlOYnQeKV0iz4uGJuJ4FxiQ=;
        b=rd/GatpEJl1gJAT/RsjuH3WmbxItYO+lU/8Yz1wcyFmP/U1SdJ41mGTJhjKvlV7lFh
         tk2Tc0ebJKnBtS2iYjqPyxZ2xOU8qrZxEiGaqvMQNwdgpthrshcUEp/T2m4vshWfO06s
         sJYX9CmnKpfEjKML4u3QQhQm/YN0/6+ULaLxj9NXcKJmKaQHAp3Z+sj3O58REvn3Ej71
         4pAfJrG9M+JBjMhGKzEIelgYDnvgsMU9mivghB8Eg2qDJXPpn6yPA+FbURVqirBiNRAm
         WGNclbkfdd/luM0UnBcM89SrmElxrblJ7FGo0m2jlKuS6aZ3iuqr1CdeGAUj2nsthfhH
         A1eQ==
In-Reply-To: <CAA5aLPjLFNhsAwP8uLVq=v-gNYaa6uU17Yqh8ikYwfPXEuQUww@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Classid will be overwritten by fw classifier.

2015-09-10 13:20 GMT+03:00 Akshat Kakkar <akshat.1984@gmail.com>:
>>> Without any options fw classifier maps fwmark to classid.
>>>
>>> tc filter add dev <iface> parent <qhandle> protocol ip prio 1 fw
>
> What if the packet has fwmark and skbprio set?



-- 
Anton.
