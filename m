From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: unable to start nftables
Date: Sat, 12 Aug 2023 18:41:45 +0200
Message-ID: <72f1558f-2c2d-4bc2-5138-de31c9ae8f40@thelounge.net>
References: <7953ed4a-eaaf-feb6-bc09-e1179b754253@gmx.fr>
 <4193c7c1-6fb7-769d-a2f4-d02819a6ea38@thelounge.net>
 <f1ee7ea5-9790-6fb7-8f77-f8e8ac637abb@gmx.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <f1ee7ea5-9790-6fb7-8f77-f8e8ac637abb@gmx.fr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Fran=c3=a7ois_Patte?= <francois.patte@gmx.fr>, netfilter@vger.kernel.org



Am 12.08.23 um 18:36 schrieb François Patte:
> Le 12/08/2023 à 18:29, Reindl Harald a écrit :
>>
>>
>> Am 12.08.23 um 17:18 schrieb François Patte:
>>> Bonjour,
>>>
>>> I am currently unable to start nftables service, the answer is:
>>>
>>> internal:0:0-0: Error: Could not open file
>>> "/etc/sysconfig/nftables.conf": Permission denied
>>>
>>> file /etc/sysconfig/nftables.conf exists and have 755 permissions.
>>>
>>> What can I do?
>>
>> sounds like SELinux / AppAmor problem - that's why you should provide
>> informations about your system - we don't even know your distribution
>> nor do you provide your service unit or even the init-system
> 
> system is fedora 36

EOL since 2023‑05‑16 which is *3 months ago*
F37 was released 2022-11-16
it's time to plan upgrade to F38 currently

don't run a bleeding edge distro when you can't cope with updates!

> selinux policy is enforced
> nftables is enabled
> 
> And yes, it is a selinux problem: if I setenforce to 0, I can start
> nftables (but I found this solution after posting....)
> 
> I can go back to setenforce 1 without annoying nftables but, the problem
> remains if I reboot the machine.

Google: "fedora restore selinux context of a specific file"

https://www.thegeekstuff.com/2017/05/restorecon-examples/
