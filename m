From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 10 Jul 2009 17:00:29 +0200
Message-ID: <9948385e0907100800j7ea04888h46663f94ff0dfc54@mail.gmail.com>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
	 <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com>
	 <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com>
	 <5b933efdfd09476e4b00a15fe5dc3ac0@localhost>
	 <4A560E0D.40806@plouf.fr.eu.org>
	 <23412bf8079dabef19ddd9fbe9022f66@localhost>
	 <4A5744DB.4070303@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=66bn4QTeIp7oU2EqguvgTgea+W4/YA/IoTqfiNVdTaE=;
        b=pxir2nS2khTW/UGyIiTllEd8WiFPjMgY5YmcpXoCAiaN7m9TjuOPRpmHc28JOTNAwB
         mnsM4dDqwDkaCMkB2Zi5VIUz2d8Vn3n7N7V24MU4djw1WvalAI+NBo2EKhoZxWXxGHEr
         U1YOmntuyhtG6PR/PX4FZlrf2jCWM66wxA/Xk=
In-Reply-To: <4A5744DB.4070303@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Just for info, I report that after I "opened" protocol 41 for input
(and removed the nat table changes) my IPv6 tunnel is working fine for
more than 24 hours.

David

2009/7/10 Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> Benedikt Gollatz a =E9crit :
>>
>>>> You need to accept proto-41
>>>> packets in the PREROUTING chain to stop the connection tracker fro=
m
>>>> looking at them.
>>>
>>> Wrong. Connection tracking happens anyway.
>>
>> You'll have to tell that to the authors of the SixXS FAQ.
>
> Maybe. I just read the FAQ entry about connection tracking, and I did=
n't
> think it was so clueless about Linux conntrack. But I'm so lazy, and =
SixXS
> puts so many requirements about how to contact them.
>
>>> Anyway what David need is to allow 6in4 traffic from the tunnel end=
point.
>>> This has nothing to do with connection tracking.
>>
>> Traffic passing through at first and after a certain time not being =
able
>> to
>> pass anymore is a classic symptom of problems with connection tracki=
ng.
>
> It less about connection tracking than about how connection tracking =
states
> are used in filtering rules. Connection tracking does not matter if y=
ou
> accept all traffic. So it is a mostly a filtering issue.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
