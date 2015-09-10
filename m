From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Feature suggestion ...
Date: Thu, 10 Sep 2015 15:56:29 +0530
Message-ID: <CAA5aLPhLup=uyoxLcd=7Rk6AY7PQ+P6N6=aiHf=qkzG6gLE5TQ@mail.gmail.com>
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
	<CAEzD07LM3U9V2ZQLyk5P6n=W7pB0aL25Q+AnsFOXWq+UWA5JZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=/9knatL/ZwAN7bRSr84uGkzZ7WPTLLbefgjW7eKrhGo=;
        b=krKSS5fuSzeryDG6lqvjZAVgbatPKyuQADhwGGrtV4JIm1VoYBYsuTJkXEPUf/cE3V
         ggmcgs7wrsFbIW/nJAZxst6ZGvU3BGSlqy5Wp3mAzBOSreya8mZKYtT8rvCXuyirORC3
         yyJYaIKB+NIEl8C1R5mVI8hLgh34bn3cAauZ6o+TX/lIDMt52E2fExTAc+2qNWnJD/wV
         XyMytuOFasrP5D9Z1VjhThOvBGVr6S3RhSO1pUL2LfxQUCMpV2I2uZKB1CembxaIc27x
         RvkRO/VE6WPwum5rHPUWNG1TnaSa8Wt1GMYqm2lgdcTyzkSkKxuk21w2ZSss689XxLAN
         GSUQ==
In-Reply-To: <CAEzD07LM3U9V2ZQLyk5P6n=W7pB0aL25Q+AnsFOXWq+UWA5JZA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> Classid will be overwritten by fw classifier.
>
For sake of completeness,

So if I use tc filter add dev <iface> parent <qhandle> protocol ip prio 1 fw

and my packet has mark(640001) and classid(1:10) both set,
then because of above tc filter, the exisiting classid will be set to
64:1 i.e. equal to the mark.

Is my understanding correct?

If my understanding is correct,
shouldn't it be like that if class is set, then it should not overwrite?



> 2015-09-10 13:20 GMT+03:00 Akshat Kakkar <akshat.1984@gmail.com>:
>>>> Without any options fw classifier maps fwmark to classid.
>>>>
>>>> tc filter add dev <iface> parent <qhandle> protocol ip prio 1 fw
>>
>> What if the packet has fwmark and skbprio set?
