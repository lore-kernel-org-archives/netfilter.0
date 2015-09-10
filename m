From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Feature suggestion ...
Date: Thu, 10 Sep 2015 10:38:35 +0530
Message-ID: <CAA5aLPi3AuC3m0cZgU1wZ3_U=wQoL29tUjVjX9DYO1gU_bjMAw@mail.gmail.com>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
	<alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
	<CAA5aLPjhXREe9W6fT1oNj=mKV3Yb6CBSLP44do-sgBrhKHa2mA@mail.gmail.com>
	<alpine.DEB.2.10.1509062215520.13557@blackhole.kfki.hu>
	<CAA5aLPi2of6Z4UGmD9pqvcq3hr2HCgVMrK46MxRKDbYL-jwK5w@mail.gmail.com>
	<CAEzD07JL13Pv00-b1B_y2UUK327O91kMMMc157yX6J93M2VPng@mail.gmail.com>
	<CAA5aLPg3hZOctA8VMRtg85L7i7VZ1NCG4yTA2E7HRTk_VcU+6A@mail.gmail.com>
	<CAEzD07JQYbtrjBr18=zS0vGMKhFXL52YVcaf3FJqa1Z3TaYZsw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=kjRfhOk0mD/P0K4eWdZETX6P1LeF3IGD5bXzJ7u5dnw=;
        b=KhLauyxp4afX73W3/phGsxRi/fs+b1YLtgDnl0nNUpSM5Msa7yLsDM8hxzNssydibb
         nCKsYeZz7F56FdOWITZmVTA1CKMvxK/6NhgmuywfwRQyd8KfTPhLRf4LBl1eDdFD5PEd
         5lWpUa8DtUwYDTRUlgbYOy84lk5o2pfqhlfvllgdra57aIhwFGnR8BKxRb53hj6PldMX
         oagR7LsjKuU7PDRX9XVaW9B5zdP0HMbt5OQGfAlh/MKp8Wf/61CIL460/VovN4JVM72a
         YEzEAAblGxCMzu1qfexDHiY4ojpkaUg1KebKlNqzhAFmjNlSxa03wAh2WhHFLo9r5qou
         yufw==
In-Reply-To: <CAEzD07JQYbtrjBr18=zS0vGMKhFXL52YVcaf3FJqa1Z3TaYZsw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Danilov <littlesmilingcloud@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

That's gr8.

I think we should document this behaviour. It is very useful.

On Wed, Sep 9, 2015 at 9:35 PM, Anton Danilov
<littlesmilingcloud@gmail.com> wrote:
> Without any options fw classifier maps fwmark to classid.
>
> tc filter add dev <iface> parent <qhandle> protocol ip prio 1 fw
>
> 2015-09-09 9:35 GMT+03:00 Akshat Kakkar <akshat.1984@gmail.com>:
>> On Mon, Sep 7, 2015 at 6:22 PM, Anton Danilov
>> <littlesmilingcloud@gmail.com> wrote:
>>> Hello.
>>> You can use the firewall mark as tc classid with fwmark filter.
>>> It can interpret fwmark as tc classid. So, you can use this feature
>>> inside your ipset/iptables/tc rules.
>>>
>>
>> Can you provide an example as how fwmark is intrepreted as classid ?
>
>
>
> --
> Anton.
