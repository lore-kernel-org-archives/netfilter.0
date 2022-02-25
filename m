From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Subject: Re: [RFC PATCH 2/2] landlock: selftests for bind and connect hooks
Date: Fri, 25 Feb 2022 05:44:06 +0300
Message-ID: <99c767ce-9725-6675-ca8b-a303aa939e42@huawei.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <20220124080215.265538-3-konstantin.meskhidze@huawei.com>
 <4d54e3a9-8a26-d393-3c81-b01389f76f09@digikod.net>
 <a95b208c-5377-cf5c-0b4d-ce6b4e4b1b05@huawei.com>
 <b29b2049-a61b-31a0-c4b5-fc0e55ad7bf1@digikod.net>
 <7a538eb0-00e6-7b15-8409-a09165f72049@huawei.com>
 <ffedc3d8-a193-b8d1-ddf2-9bd4824f4942@digikod.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: ru
In-Reply-To: <ffedc3d8-a193-b8d1-ddf2-9bd4824f4942@digikod.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com



2/24/2022 5:15 PM, Mickaël Salaün пишет:
> 
> On 24/02/2022 13:03, Konstantin Meskhidze wrote:
>>
>>
>> 2/24/2022 12:55 PM, Mickaël Salaün пишет:
>>>
>>> On 24/02/2022 04:18, Konstantin Meskhidze wrote:
>>>>
>>>>
>>>> 2/1/2022 9:31 PM, Mickaël Salaün пишет:
>>>>>
>>>>> On 24/01/2022 09:02, Konstantin Meskhidze wrote:
>>>>>> Support 4 tests for bind and connect networks actions:
>>>>>
>>>>> Good to see such tests!
>>>>>
>>>>>
>>>>>> 1. bind() a socket with no landlock restrictions.
>>>>>> 2. bind() sockets with landllock restrictions.
>>>>>
>>>>> You can leverage the FIXTURE_VARIANT helpers to factor out this 
>>>>> kind of tests (see ptrace_test.c).
>>>>>
>>>>>
>>>>>> 3. connect() a socket to listening one with no landlock restricitons.
>>>>>> 4. connect() sockets with landlock restrictions.
>>>>>
>>>>> Same here, you can factor out code. I guess you could create 
>>>>> helpers for client and server parts.
>>>>>
>>>>> We also need to test with IPv4, IPv6 and the AF_UNSPEC tricks.
>>>>>
>>>>> Please provide the kernel test coverage and explain why the 
>>>>> uncovered code cannot be covered: 
>>>>> https://www.kernel.org/doc/html/latest/dev-tools/gcov.html
>>>>
>>>>   Hi Mickaёl!
>>>>   Could you please provide the example of your test coverage build
>>>>   process? Cause as I undersatand there is no need to get coverage data
>>>>   for the entire kernel, just for landlock files.
>>>
>>> You just need to follow the documentation:
>>> - start the VM with the kernel appropriately configured for coverage;
>>> - run all the Landlock tests;
>>> - gather the coverage and shutdown the VM;
>>> - use lcov and genhtml to create the web pages;
>>> - look at the coverage for security/landlock/
> 
> It would be interesting to know the coverage for security/landlock/ 
> before and after your changes, and also specifically for 
> security/landlock.net.c
> 
   I agree! I'm working on it!
>>>
>>     Thank you so much!
>>
>>     One more questuoin - Is it possible to run Landlock tests in QEMU and
>>     and gather coverage info or I need to change kernel for the whole VM?
> 
> You need to gather the coverage info on the same system that ran the 
> tests, so with the same kernel supporting both Landlock and gcov. You 
> can then generate the web pages elsewhere.

   Thanks again.
> .
