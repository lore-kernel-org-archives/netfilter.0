From: "JR" <jdnromao@gmail.com>
Subject: Re: HTTP Access Blocked After iptables Update
Date: Tue, 3 Nov 2009 21:14:53 +0100
Message-ID: <00AB03D5F9DA4B3C841C115757375C35@RomoPC>
References: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC> <200911032206.18489.fakessh@fakessh.eu>
Reply-To: "JR" <jdnromao@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:reply-to:from:to
         :cc:references:in-reply-to:subject:date:organization:mime-version
         :content-type:content-transfer-encoding:x-priority:x-msmail-priority
         :importance:x-mailer:x-mimeole;
        bh=Hps6pcAs776DYMEg63+cEWLgyuxMsJ8rZQvVHILocHY=;
        b=KYM4bhQiwSOQJClfZoYEsUey+lgJJROw9RmZvImssO4MaE9yhNqBP1W3ZuCNjGlHBE
         mnhUKsH/k8E9uHfpZC4ecugwQlVmexsHnC8TuEqt+CBP2gkm5WgGjOw0P5T1Wfnu1vG8
         9wj0saSBmGIbgf50UW2wUt8HB7M3rBwqFNtDk=
In-Reply-To: <200911032206.18489.fakessh@fakessh.eu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: fakessh@fakessh.eu
Cc: netfilter@vger.kernel.org

I haven't save iptables before I restart it. May that be the problem?

Do you "service iptables save" before stop, restart or flush iptables?

Thanks in advance.

--------------------------------------------------
=46rom: <fakessh@fakessh.eu>
Sent: Tuesday, November 03, 2009 10:06 PM
To: "JR" <jdnromao@gmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: HTTP Access Blocked After iptables Update

> after upgrade iptables via yum on my box Centos 5.4
>
> I did not encounter such problems
> described in your post
>
> iptables work fine on my box
>
> Le mardi 3 novembre 2009 20:23, JR a =E9crit :
>> Hello!
>>
>> Today I updated various things in my production server, one of them =
was
>> iptables (via yum)
>>
>> I'm running CentOS 5.
>>
>> 1) After the update I was not able to access any site hosted on my=20
>> server.
>>
>> 2) I try to stop iptables and than I gain access again.
>>
>> 3) Than I've started iptables and no access again.
>>
>> 4) I rebooted my server.
>>
>> 5) After the reboot I verify if iptables was active, it was and all =
my
>> sites were accesible.
>>
>> 6) I've restarted iptables.
>>
>> 7) All sites went down again.
>>
>> 8) Rebooted my server and sites were accessible.
>>
>> 9) iptables was also running
>>
>> Basically the problem is, if I restart iptables, I have to reboot my=
=20
>> server
>> because my sites become offline.
>>
>> So, what can be the problem here? Any ideas?
>>
>> Help is highly appreciated!!!!
>>
>> Many thanks in advance.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html=20

