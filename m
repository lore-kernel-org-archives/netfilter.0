From: =?UTF-8?Q?Fran=c3=a7ois_Patte?= <francois.patte@gmx.fr>
Subject: Re: unable to start nftables
Date: Sat, 12 Aug 2023 18:53:03 +0200
Message-ID: <2d987f2b-a910-05d3-c69f-809697cce2f0@gmx.fr>
References: <7953ed4a-eaaf-feb6-bc09-e1179b754253@gmx.fr>
 <4193c7c1-6fb7-769d-a2f4-d02819a6ea38@thelounge.net>
 <f1ee7ea5-9790-6fb7-8f77-f8e8ac637abb@gmx.fr>
 <72f1558f-2c2d-4bc2-5138-de31c9ae8f40@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.fr;
 s=s31663417; t=1691859183; x=1692463983; i=francois.patte@gmx.fr;
 bh=IBGYd6Wp/BfC9+tS+v5d086kGK88zCLyYwIsNCFIdfc=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=cwUvhEovjP9nK9uW7Sqrzdtt88QBf/Pxa8HIB+blTQDb9PGZ3P7YMJ5WTZCe2n8c58zLA1Q
 3mog4BXLGdNX8Kd9IrQGymIwYMS/eTM/D8YLcuBGwvuDt+20Q2GBQQkQQ4ki0vuqrUDiw9maY
 qW7D+BcFB+c78ahmhSDlF8ShGO7QOucdh8uMo5ztAK/e4HU/oh1mQudVhMIdnDnYuNgPX8ipx
 wbUlpsCgTVZh8i8qQ3qokduQAHBv1LBvfOZULg1M0V5NH5YOMRf9ND7Aibuz3ogTb96dY3yon
 INmHi+e1nwpYSkB3OyJH7enlIg/7p5f2EzosWW+jsU41aZlwUrZA==
Content-Language: fr-FR
In-Reply-To: <72f1558f-2c2d-4bc2-5138-de31c9ae8f40@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

Le 12/08/2023 =C3=A0 18:41, Reindl Harald a =C3=A9crit=C2=A0:
>
>
> Am 12.08.23 um 18:36 schrieb Fran=C3=A7ois Patte:
>> Le 12/08/2023 =C3=A0 18:29, Reindl Harald a =C3=A9crit=C2=A0:
>>>
>>>
>>> Am 12.08.23 um 17:18 schrieb Fran=C3=A7ois Patte:
>>>> Bonjour,
>>>>
>>>> I am currently unable to start nftables service, the answer is:
>>>>
>>>> internal:0:0-0: Error: Could not open file
>>>> "/etc/sysconfig/nftables.conf": Permission denied
>>>>
>>>> file /etc/sysconfig/nftables.conf exists and have 755 permissions.
>>>>
>>>> What can I do?
>>>
>>> sounds like SELinux / AppAmor problem - that's why you should provide
>>> informations about your system - we don't even know your distribution
>>> nor do you provide your service unit or even the init-system
>>
>> system is fedora 36
>
> EOL since 2023=E2=80=9105=E2=80=9116 which is *3 months ago*
> F37 was released 2022-11-16
> it's time to plan upgrade to F38 currently
>
> don't run a bleeding edge distro when you can't cope with updates!

It is a server at ovh and they installed this version... Now they
propose f38, I'll upgrade.

>
>> selinux policy is enforced
>> nftables is enabled
>>
>> And yes, it is a selinux problem: if I setenforce to 0, I can start
>> nftables (but I found this solution after posting....)
>>
>> I can go back to setenforce 1 without annoying nftables but, the proble=
m
>> remains if I reboot the machine.
>
> Google: "fedora restore selinux context of a specific file"
>
> https://www.thegeekstuff.com/2017/05/restorecon-examples/

Thank you, this solved the problem.

F.P.

