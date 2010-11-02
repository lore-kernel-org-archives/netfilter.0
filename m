From: Alex <mysqlstudent@gmail.com>
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 2 Nov 2010 10:11:09 -0400
Message-ID: <AANLkTimxnKuwcv8Ejp+=zh4BNjkULWKYYd1VQe9=_T8P@mail.gmail.com>
References: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com>
	<4CCFDA1D.40907@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Afr8oFf5gRJpvnxbSXCMg9j3g1r1PBF8qHmwWzErC6g=;
        b=kOXsCTrzmoD9VXdlAYjcJV3xnWqgSsdGAqnnxyUhxbMpYmWGVi8uk8a1JtykzKjkht
         H1M2+GpKGOuLCGp8tgSz89i3MVozUDF4Qp7Pf6AJbXe9oUiRPBORkMnaVV9e1LaTo6HI
         eTwtDNiYJajC20b/U2f6DuOb7F360bL/7keQI=
In-Reply-To: <4CCFDA1D.40907@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

>> =A0My hope is to block hundreds of connections on my mail server fro=
m
>> =A0bulk mail senders like constantcontact, as well as the flood of
>> =A0connections from spam bots that are rejected by zen anyway.
>>
>> =A0How can I tell what rules are currently in place for a particular
>> =A0IP? In other words, I see log entries for the initial block, but =
it
>> =A0doesn't appear that an actual rule is added, correct?
>
> Why dont you do this at the application level. There many way to do t=
his.

I have an older version of postfix that I can't upgrade right now, and
I don't think it supports this. I do realize this is the more
effective way to do it. I'd like to just get something working for the
time being.

Thanks,
Alex
