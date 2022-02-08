From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Subject: Re: [RFC PATCH 0/2] landlock network implementation cover letter
Date: Tue, 8 Feb 2022 06:53:46 +0300
Message-ID: <8356b0fe-5665-96c1-c09b-bb74f97cc7ca@huawei.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <85450679-51fd-e5ae-b994-74bda3041739@digikod.net>
 <51967ba5-519a-8af2-76ce-eafa8c1dea33@huawei.com>
 <26cae763-3540-8e1b-f25b-68ac3df481a6@digikod.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Language: ru
In-Reply-To: <26cae763-3540-8e1b-f25b-68ac3df481a6@digikod.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com



2/7/2022 4:35 PM, Mickaël Salaün пишет:
> 
> On 07/02/2022 14:18, Konstantin Meskhidze wrote:
>>
>>
>> 2/1/2022 8:53 PM, Mickaël Salaün пишет:
>>>
>>> On 24/01/2022 09:02, Konstantin Meskhidze wrote:
>>>> Hi, all!
>>>>
>>>> This is a new bunch of RFC patches related to Landlock LSM network 
>>>> confinement.
>>>> Here are previous discussions:
>>>> 1. 
>>>> https://lore.kernel.org/linux-security-module/20211210072123.386713-1-konstantin.meskhidze@huawei.com/ 
>>>>
>>>> 2. 
>>>> https://lore.kernel.org/linux-security-module/20211228115212.703084-1-konstantin.meskhidze@huawei.com/ 
>>>>
>>>>
>>>> As in previous RFCs, 2 hooks are supported:
>>>>    - hook_socket_bind()
>>>>    - hook_socket_connect()
>>>>
>>>> Selftest are provided in 
>>>> tools/testing/selftests/landlock/network_test.c;
>>>> Implementation was tested in QEMU invironment with 5.13 kernel version:
>>>
>>> Again, you need to base your work on the latest kernel version.
>>>
>>    Is it because there are new Landlock features in a latest kernel
>>    version?
>>    I thought 5.13 kernel version and the latest one have the same
>>    Landlock functionality and there will not be rebasing problems in
>>    future. But anyway I will base the work on the latest kernel.
>>    Which kernel version do you work on now?
> 
> 
> For now, the security/landlock/ files didn't changed yet, but that will 
> come. All other kernel APIs (and semantic) may change over time (e.g. 
> LSM API, network types…). I'm working on Linus's master branch (when it 
> becomes stable enough) or the linux-rolling-stable branch (from the 
> stable repository). When it will be ready for a merge, we need to base 
> our work on linux-next.

   Ok. I got it. I will rebase to the latest version.
   Thanks.
> .

