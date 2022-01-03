From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [RFC PATCH 0/1] Landlock network PoC
Date: Mon, 3 Jan 2022 12:23:20 +0100
Message-ID: <a1a17348-61f3-9524-c76a-513422ed0332@digikod.net>
References: <20211228115212.703084-1-konstantin.meskhidze@huawei.com>
 <d9aa57a7-9978-d0a4-3aa0-4512fd9459df@digikod.net>
 <02806c8e-e255-232b-1722-65ea1dba2948@huawei.com>
 <bdbae25f-5136-8905-ca64-03314b125a40@digikod.net>
 <174f2bef-f005-c29a-1ef7-7eea96516b10@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <174f2bef-f005-c29a-1ef7-7eea96516b10@huawei.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com


On 31/12/2021 10:50, Konstantin Meskhidze wrote:
> 12/31/2021 2:26 AM, Mickaël Salaün wrote:

[...]

>>>>> diff --git a/security/landlock/ruleset.c b/security/landlock/ruleset.c
>>>>> index ec72b9262bf3..a335c475965c 100644
>>>>> --- a/security/landlock/ruleset.c
>>>>> +++ b/security/landlock/ruleset.c
>>>>> @@ -27,9 +27,24 @@
>>>>>   static struct landlock_ruleset *create_ruleset(const u32 num_layers)
>>>>>   {
>>>>>       struct landlock_ruleset *new_ruleset;
>>>>> +    u16 row, col, rules_types_num;
>>>>> +
>>>>> +    new_ruleset = kzalloc(sizeof *new_ruleset +
>>>>> +                  sizeof *(new_ruleset->access_masks),
>>>>
>>>> sizeof(access_masks) is 0.
>>>
>>> Actually sizeof *(new_ruleset->access_masks) is 8.
>>> It's a 64 bit pointer to u16 array[]. I checked this
>>> 2D FAM array implementation in a standalone test.
>>
>> Yes, this gives the size of the pointed element, but I wanted to point 
>> out that access_masks doesn't have a size (actually a sizeof() call on 
>> it would failed). This kzalloc() only allocates one element in the 
>> array. What happen when there is more than one layer?
> 
> Here kzalloc() only allocates a pointer to the array;
> The whole array is allocated here:
> 
> rules_types_num = LANDLOCK_RULE_TYPE_NUM;
>      /* Initializes access_mask array for multiple rule types.
>       * Double array semantic is used convenience:
>       * access_mask[rule_type][num_layer].
>       */
>      for (row = 0; row < rules_types_num; row++) {
>          new_ruleset->access_masks[row] = kzalloc(sizeof
>                      *(new_ruleset->access_masks[row]),
>                      GFP_KERNEL_ACCOUNT);
>          for (col = 0; col < num_layers; col++)
>              new_ruleset->access_masks[row][col] = 0;
> 
> If it's needed more the one layer, the code above supports creating
> array of LANDLOCK_RULE_TYPE_NUM*num_layer size (see create_ruleset() 
> function)

Indeed, this should work, but using a 1D array is less complex and 
enables to easily allocate the whole struct+array on contiguous memory.

[...]

>>
>> BTW, you should test with the latest kernel (i.e. latest Linus's tag).
>>
> I thought it was not even important what kernel version to use.
> So I started with the first one with Landlock support. Anyway in future
> it would be easy to rebase landlock network branch or cherry-pick all 
> necessary commits to the latest Linus's tag.

For this patch it should be straightforward because the updated part 
didn't change, but it may not always be the case. Anyway, we always work 
on up-to-date code.
