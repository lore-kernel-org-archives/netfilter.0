From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Subject: Re: [RFC PATCH 2/2] landlock: selftests for bind and connect hooks
Date: Thu, 24 Feb 2022 15:03:40 +0300
Message-ID: <7a538eb0-00e6-7b15-8409-a09165f72049@huawei.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <20220124080215.265538-3-konstantin.meskhidze@huawei.com>
 <4d54e3a9-8a26-d393-3c81-b01389f76f09@digikod.net>
 <a95b208c-5377-cf5c-0b4d-ce6b4e4b1b05@huawei.com>
 <b29b2049-a61b-31a0-c4b5-fc0e55ad7bf1@digikod.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: ru
In-Reply-To: <b29b2049-a61b-31a0-c4b5-fc0e55ad7bf1@digikod.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com



2/24/2022 12:55 PM, Mickaël Salaün пишет:
> 
> On 24/02/2022 04:18, Konstantin Meskhidze wrote:
>>
>>
>> 2/1/2022 9:31 PM, Mickaël Salaün пишет:
>>>
>>> On 24/01/2022 09:02, Konstantin Meskhidze wrote:
>>>> Support 4 tests for bind and connect networks actions:
>>>
>>> Good to see such tests!
>>>
>>>
>>>> 1. bind() a socket with no landlock restrictions.
>>>> 2. bind() sockets with landllock restrictions.
>>>
>>> You can leverage the FIXTURE_VARIANT helpers to factor out this kind 
>>> of tests (see ptrace_test.c).
>>>
>>>
>>>> 3. connect() a socket to listening one with no landlock restricitons.
>>>> 4. connect() sockets with landlock restrictions.
>>>
>>> Same here, you can factor out code. I guess you could create helpers 
>>> for client and server parts.
>>>
>>> We also need to test with IPv4, IPv6 and the AF_UNSPEC tricks.
>>>
>>> Please provide the kernel test coverage and explain why the uncovered 
>>> code cannot be covered: 
>>> https://www.kernel.org/doc/html/latest/dev-tools/gcov.html
>>
>>   Hi Mickaёl!
>>   Could you please provide the example of your test coverage build
>>   process? Cause as I undersatand there is no need to get coverage data
>>   for the entire kernel, just for landlock files.
> 
> You just need to follow the documentation:
> - start the VM with the kernel appropriately configured for coverage;
> - run all the Landlock tests;
> - gather the coverage and shutdown the VM;
> - use lcov and genhtml to create the web pages;
> - look at the coverage for security/landlock/
> 
    Thank you so much!

    One more questuoin - Is it possible to run Landlock tests in QEMU and
    and gather coverage info or I need to change kernel for the whole VM?
>>>
>>> You'll probably see that there are a multiple parts of the kernel 
>>> that are not covered. For instance, it is important to test different 
>>> combinations of layered network rules (see layout1/ruleset_overlap, 
>>> layer_rule_unions, non_overlapping_accesses, 
>>> interleaved_masked_accesses… in fs_test.c). Tests in fs_test.c are 
>>> more complex because handling file system rules is more complex, but 
>>> you can get some inspiration in it, especially the edge cases.
>>>
>>> We also need to test invalid user space supplied data (see 
>>> layout1/inval test in fs_test.c).
> .
