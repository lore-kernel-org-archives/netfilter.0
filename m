From: =?UTF-8?Q?Fran=c3=a7ois_Patte?= <francois.patte@gmx.fr>
Subject: Re: unable to start nftables
Date: Sat, 12 Aug 2023 18:36:48 +0200
Message-ID: <f1ee7ea5-9790-6fb7-8f77-f8e8ac637abb@gmx.fr>
References: <7953ed4a-eaaf-feb6-bc09-e1179b754253@gmx.fr>
 <4193c7c1-6fb7-769d-a2f4-d02819a6ea38@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.fr;
 s=s31663417; t=1691858209; x=1692463009; i=francois.patte@gmx.fr;
 bh=HuFbflGnKyjHwEf9Q6Y2JEjK4idKoF+MGpbISeyHBow=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=HQfKzD8OhSv1aB6sVr7pNzy3xz99hkCAK0yXvTrHx3fHnFl4AAg8PauZueLv+Fdtgkbbrg7
 Gts889o01Sp2hVGptmBm7/MnzijdGnQ3j1rxWwbH0EYmVbgdOZ78e+pypCYxvTdcXqQsihGdW
 6HZIpcZYHwDiCmouzMDvA1n3UJe8Jfv03Mjlk22y4I+qNOiNS5X8PgVN9pXAOHE0MkQ9aJJiu
 VPnWfhSCxsAeI29xNVRzwRCNApwaegGIuYYLZX1Azy0uc/jop5u/RYci8D0avwS4rF8DdZvn3
 5I9tdj3hYwxYGvoiAqAuG2vsyS/m7rJ2wqsHOhAhVaxZ3Vlm6+6w==
Content-Language: fr-FR
In-Reply-To: <4193c7c1-6fb7-769d-a2f4-d02819a6ea38@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

Le 12/08/2023 =C3=A0 18:29, Reindl Harald a =C3=A9crit=C2=A0:
>
>
> Am 12.08.23 um 17:18 schrieb Fran=C3=A7ois Patte:
>> Bonjour,
>>
>> I am currently unable to start nftables service, the answer is:
>>
>> internal:0:0-0: Error: Could not open file
>> "/etc/sysconfig/nftables.conf": Permission denied
>>
>> file /etc/sysconfig/nftables.conf exists and have 755 permissions.
>>
>> What can I do?
>
> sounds like SELinux / AppAmor problem - that's why you should provide
> informations about your system - we don't even know your distribution
> nor do you provide your service unit or even the init-system

system is fedora 36
selinux policy is enforced
nftables is enabled

And yes, it is a selinux problem: if I setenforce to 0, I can start
nftables (but I found this solution after posting....)

I can go back to setenforce 1 without annoying nftables but, the problem
remains if I reboot the machine.

Thank you for answering.

F.P.

