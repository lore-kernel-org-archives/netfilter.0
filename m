From: Hossein Zabolzadeh <zabolzadeh@gmail.com>
Subject: Re: Iptables Unnown Error
Date: Sat, 20 Sep 2014 17:20:21 +0430
Message-ID: <CAMadfcyMNVWOhpV1mgRoZ-0Vw_v3BYyi_9GOBjwSjFgJ1jCwuw@mail.gmail.com>
References: <CAMadfcxmKqxOdTsSHbE_mopB2XECmx4DMfM4G8VJUe9eDYRkfA@mail.gmail.com>
	<CAFpD06Qfu+Lk+o9wjVZvCDZubEK0yrZAyLo8bsjm=WEhBrkdFQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=QZlGdoWoC/tMxFbTU5VbiMKypK2sauyRzZoWOsaAfyg=;
        b=l3nNkqmIprXUvXpqY63m24iTQZKrwxi6WN2adnq1yuvfF4yesd8KZdk4uRmsYHN5uJ
         NbAB4srg96/p8LYeqqTC25W6x+S79yQKl0E6pNiWnB3aaI1MFhW6YK4HRs1rqjn2GCBg
         Tvkq9BRbzRo0Z3MKNHtUxSDbR7/dajXLt7N0RrWjwtfqbUGjz8j/6xdvy87NUyssyqj8
         Saf6m4dU8GiGOFLlo9qVEKbviBhWkvblbIY5tfrPIpBqSx/CFb40Q2QDqjFkTrI7CINM
         h3cHEF0MNv8QTuFYyM45WLJXFAEB+nLYvB0duJtVdfyqt2fHir1OYgyl/AD9q+rN/uKO
         TM1A==
In-Reply-To: <CAFpD06Qfu+Lk+o9wjVZvCDZubEK0yrZAyLo8bsjm=WEhBrkdFQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Longo <giuseppelng@gmail.com>, netfilter <netfilter@vger.kernel.org>

Hi,
I tried it, but another error was occured:
Modprobe: FATAL: Module nf_nat not found


On 9/20/14, Giuseppe Longo <giuseppelng@gmail.com> wrote:
> Hi,
> Try this: modprobe nf_nat nf_nat_ipv4.
>
> Regards
> Il 20/set/2014 13:07 "Hossein Zabolzadeh" <zabolzadeh@gmail.com> ha
> scritto:
>
>> Hi there,
>> I googled my iptables error, but I couldn't find a way to fix it. The
>> following error was occured when I executed this command: iptables -t
>> nat -F
>>
>> Error:
>> iptables v1.4.21: cant' initialize iptables table 'nat' : Table does
>> not exist(do you need to insmod?)
>> Perhaps iptables or your kernel needs to be upgraded.
>>
>> My virtual machine is Debian Jessie.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
