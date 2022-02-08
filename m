From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Subject: Re: [RFC PATCH 2/2] landlock: selftests for bind and connect hooks
Date: Tue, 8 Feb 2022 06:01:34 +0300
Message-ID: <9a77fc40-4463-4344-34d0-184d427d32cf@huawei.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <20220124080215.265538-3-konstantin.meskhidze@huawei.com>
 <4d54e3a9-8a26-d393-3c81-b01389f76f09@digikod.net>
 <ae5ca74d-ce5f-51e8-31c1-d02744ec92f8@huawei.com>
 <ae0fcafa-3e8d-d6f2-26a8-ae74dda8371c@digikod.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Language: ru
In-Reply-To: <ae0fcafa-3e8d-d6f2-26a8-ae74dda8371c@digikod.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com



2/7/2022 3:49 PM, Mickaël Salaün пишет:
> 
> On 07/02/2022 08:11, Konstantin Meskhidze wrote:
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
> 
> [...]
> 
>>>> + */
>>>> +
>>>> +#define _GNU_SOURCE
>>>> +#include <errno.h>
>>>> +#include <fcntl.h>
>>>> +#include <linux/landlock.h>
>>>> +#include <string.h>
>>>> +#include <sys/prctl.h>
>>>> +#include <sys/socket.h>
>>>> +#include <sys/types.h>
>>>> +#include <netinet/in.h>
>>>> +#include <arpa/inet.h>
>>>
>>> To make it determinisitic (and ease patching/diff/merging), you 
>>> should sort all the included files (in tests and in the kernel code).
>>
>>    Sorry. Did not get your point here. Could you explain in a bit more
>>    details please.
> 
> It will be easier to sort all the #include lines with the "sort -u" 
> command.

   Ok. I got it. Thanks.
> 
> [...]
> 
>>>> +    /* Create a socket 3 */
>>>> +    sockfd_3 = socket(AF_INET, SOCK_STREAM, 0);
>>>> +    ASSERT_LE(0, sockfd_3);
>>>> +    /* Allow reuse of local addresses */
>>>> +    ASSERT_EQ(0, setsockopt(sockfd_3, SOL_SOCKET, SO_REUSEADDR, 
>>>> &one, sizeof(one)));
>>>> +
>>>> +    /* Set socket 3 address parameters */
>>>> +    addr_3.sin_family = AF_INET;
>>>> +    addr_3.sin_port = htons(SOCK_PORT_3);
>>>> +    addr_3.sin_addr.s_addr = inet_addr(IP_ADDRESS);
>>>> +    memset(&(addr_3.sin_zero), '\0', 8);
>>>> +    /* Bind the socket 3 to IP address */
>>>> +    ASSERT_EQ(0, bind(sockfd_3, (struct sockaddr *)&addr_3, 
>>>> sizeof(addr_3)));
>>>
>>> Why is it allowed to bind to SOCK_PORT_3 whereas net_service_3 
>>> forbids it?
>>
>>    It's allowed cause net_service_3 has empty access field.
>>
>>     /* Empty allowed_access (i.e. deny rules) are ignored in network
>>      *  actions for SOCK_PORT_3 socket "object"
>>      */
>>      ASSERT_EQ(-1, landlock_add_rule(ruleset_fd,
>>                                      LANDLOCK_RULE_NET_SERVICE,
>>                                      &net_service_3, 0));
>>      ASSERT_EQ(ENOMSG, errno);
>>
>>    Applying this rule returns ENOMSG errno:
>>
>>    /* Informs about useless rule: empty allowed_access (i.e. deny rules)
>>     * are ignored in network actions
>>     */
>>          if (!net_service_attr.allowed_access) {
>>              err = -ENOMSG;
>>              goto out_put_ruleset;
>>          }
>>    This means binding socket 3 is not restricted.
>>    For path_beneath_attr.allowed_access = 0 there is the same logic.
> 
> I missed the ENOMSG check; the third rule has nothing to do with it. 
> However, because the ruleset handles bind and connect actions, they must 
> be denied by default. There is no rule allowing binding to SOCK_PORT_3. 
> Why is it allowed?
> 
> You can test with another SOCK_PORT_4, not covered by any rule. As for 
> SOCK_PORT_3, it must be forbidden to bind on it.

   Apllying the third rule (net_service_3.access is empty) returns ENOMSG
   error. That means a process hasn't been restricted by the third rule,
   cause during search  process in network rb_tree the process won't find
   the third rule, so binding to SOCK_PORT_3 is allowed.

   Maybe there is a misunderstanding here. You mean that if there is just
   only one network rule for a particular port has been applied to a
   process, other ports' networks actions are automatically restricted
   until they will be added into landlock newtwork rb_tree?
> .
