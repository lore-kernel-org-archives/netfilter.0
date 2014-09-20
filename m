From: Hossein Zabolzadeh <zabolzadeh@gmail.com>
Subject: Re: Iptables Unnown Error
Date: Sat, 20 Sep 2014 17:27:41 +0430
Message-ID: <CAMadfcxnaLoiPmEZoAjwA83SDiFU0wNBGT+E=hTv6WGjL=7vqw@mail.gmail.com>
References: <CAMadfcxmKqxOdTsSHbE_mopB2XECmx4DMfM4G8VJUe9eDYRkfA@mail.gmail.com>
	<CAFpD06Qfu+Lk+o9wjVZvCDZubEK0yrZAyLo8bsjm=WEhBrkdFQ@mail.gmail.com>
	<CAMadfcyMNVWOhpV1mgRoZ-0Vw_v3BYyi_9GOBjwSjFgJ1jCwuw@mail.gmail.com>
	<CAFpD06TAJ4fcFTw6t7u4j56_px167ntn01Z3xmiCyO6cF43-3w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=B+A02OnEzE+zCZN2SFBSyEfnADqxPabHm6T491y/9sg=;
        b=R/xegcjTtyDMigOv/4Q47FCZK2aF0P306X/A0Q8de1xiAjLlOIO7f7kr9LPO8AaBrw
         sMXiX20pky8RSyhvVKFzRohNS7nu2UUVFltHWBTMabturpMX03CO1g3kk4tz8hPtw9Ke
         3z6kvMHoiocbG3fI6JRKA+8OqpbL24pOIzy/jseuPWD/uOKU/r0C7z1rI1+nIMbXPPz5
         YUTGLIEZ3lfPp7AQLZxXaMi7IwYcfs1VBSDx6Du+Ugp3D1nA4f8k68Y5Yj3jgpJFa/mJ
         E/ZfjMZaKVeD7noIiKih30etCduCgct8tqsUjgKG5j55bAJUjWNeWEZyYqbGVJjto72o
         c2DA==
In-Reply-To: <CAFpD06TAJ4fcFTw6t7u4j56_px167ntn01Z3xmiCyO6cF43-3w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Longo <giuseppelng@gmail.com>, netfilter <netfilter@vger.kernel.org>

No, How can I do that?

On 9/20/14, Giuseppe Longo <giuseppelng@gmail.com> wrote:
> Have you enabled it in your kernel?
> Il 20/set/2014 14:50 "Hossein Zabolzadeh" <zabolzadeh@gmail.com> ha
> scritto:
>
>> Hi,
>> I tried it, but another error was occured:
>> Modprobe: FATAL: Module nf_nat not found
>>
>>
>> On 9/20/14, Giuseppe Longo <giuseppelng@gmail.com> wrote:
>> > Hi,
>> > Try this: modprobe nf_nat nf_nat_ipv4.
>> >
>> > Regards
>> > Il 20/set/2014 13:07 "Hossein Zabolzadeh" <zabolzadeh@gmail.com> ha
>> > scritto:
>> >
>> >> Hi there,
>> >> I googled my iptables error, but I couldn't find a way to fix it. The
>> >> following error was occured when I executed this command: iptables -t
>> >> nat -F
>> >>
>> >> Error:
>> >> iptables v1.4.21: cant' initialize iptables table 'nat' : Table does
>> >> not exist(do you need to insmod?)
>> >> Perhaps iptables or your kernel needs to be upgraded.
>> >>
>> >> My virtual machine is Debian Jessie.
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe netfilter"
>> >> in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >>
>> >
>>
>
