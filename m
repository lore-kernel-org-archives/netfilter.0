From: "Jeremy Pullicino" <pullicino@gmail.com>
Subject: Re: routing all HTTP requests to my own web server
Date: Fri, 17 Oct 2008 20:29:43 +0200
Message-ID: <a0a0d59c0810171129h17c16603vf1d323b71d4a2a02@mail.gmail.com>
References: <a0a0d59c0810171040s3646c212g150d7691e6d92f4b@mail.gmail.com>
	 <48F8D21E.9050601@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=0wic2gpmqXD6c/OgbcGINLLXo0WZfP8ygbJ7s3hQJIc=;
        b=pHw0GZAYyhrs75oplzFkcWx3Ym2XzfqkWM9nxQdvnFaxeD0srWzTt87JdOWqU8jJyl
         qee40a/o3KnNCeE+fhsmBHcrirf8cVQpIyW7aFtQv6UlfjJ3kghyY7EHvwOtpkoba/oB
         72jp14AB2MkxWZxqnHvZJruQrb4LAw5FXOCq4=
In-Reply-To: <48F8D21E.9050601@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks Grant - I understand exactly what you mean.

To solve the TCP Triangle problem I should probably add this rule
(192.168.11.1 is the local machine):

iptables =96t nat =96A POSTROUTING -p tcp --sport 80 =96j SNAT =96-to 1=
92.168.11.1

Would that be correct?

Thanks for your advice.

Jeremy.

On Fri, Oct 17, 2008 at 7:57 PM, Grant Taylor <gtaylor@riverviewtech.ne=
t> wrote:
> On 10/17/08 12:40, Jeremy Pullicino wrote:
>>
>> After consulting with the docs and online tutorials I came up with t=
he
>> command below:
>>
>> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT 192.168.11.1=
00
>>
>> Is this the correct way to do it?
>
> That is the first part of it.  You will also need to SNAT the traffic=
=2E
>
>> Any advice will be really appreciated.
>
> Look through the archive for this mailing list, or better search it, =
for
> what I refer to as the "TCP Triangle".
>
> I think the most recent thread that this was discussed had a subject =
of
> "Different kind of transparent proxy".
>
> Also, you may find Jan Engelhardt's TCP Triangle image explains it we=
ll.
>
>   http://jengelh.hopto.org/images/dnat-mistake.png
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
