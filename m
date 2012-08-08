From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: Re: ulogd - hashtable_find function - question
Date: Wed, 8 Aug 2012 08:20:56 -0700
Message-ID: <CAAJpzgYBipLWYVN8ghkam-yUmK2u1udAO_ap3e1qgTw10-rNBQ@mail.gmail.com>
References: <CAAJpzgbEgy9WsLvCSkQbVpdUXWL-ivbnSEcY9zbm5M6m-kawRA@mail.gmail.com>
 <304595783255CB4682E86E67D63E6FEE1059A8@dc2008r2.sh-solutions.intern>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=C/R36UNo0zlrURZlI1Fa6pyDEmAT3caG/L4Js+YN1JI=;
        b=xDLxiySHiYL14vx16EAF20kVNbuPDcZxV0vqGXUB56f+OTqR9+QZNzrVSLR+GoNIMA
         k/F7qSLC6pX8v5LtPmygko9TCkrcVTkDgbbDpiYB1Hh6H/nkOTUtpI/SsLR3SnCGjws0
         4UTcSajdbQAXjnLZLjP/WP9ruIgB0XfcyzUjjx9DUv+vKvZHlSpyeI1mH5rBbf68nbZb
         MKgd7WZOPpAe/EauMbKzN53FaIc3wQt4VSUTKY+U852hZlVVld/veCdlwT00QlSZrkAi
         0f8R81jNYqgeeYr4t7T5p46zDkSYpnXzYfF/boQt6HGPhVrjKa5q2w9kQXKJ2R1BD1WB
         M+pw==
In-Reply-To: <304595783255CB4682E86E67D63E6FEE1059A8@dc2008r2.sh-solutions.intern>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steffen Heil (Mailinglisten)" <lists@steffen-heil.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thank you,

In this function jhash(const void *key, u32 length, u32 initval), what
is the purpose of initval?

Thanks & Regards,




On Wed, Aug 8, 2012 at 7:50 AM, Steffen Heil (Mailinglisten)
<lists@steffen-heil.de> wrote:
> Hi
>
> This is for hash collisions:
> What if 2 values have the same hash value?
>
> Regards,
>    Steffen
>
>
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
>> owner@vger.kernel.org] On Behalf Of Gomathivinayagam Muthuvinayagam
>> Sent: Wednesday, August 08, 2012 4:28 PM
>> To: netfilter@vger.kernel.org
>> Subject: ulogd - hashtable_find function - question
>>
>> I'm going through ulogd hash.c code. I have a question on hashtable_find
>> function.
>>
>> struct hashtable_node *
>> hashtable_find(const struct hashtable *table, const void *data, int id) {
>>       struct llist_head *e;
>>       struct hashtable_node *n;
>>
>>       llist_for_each(e, &table->members[id]) {
>>               n = llist_entry(e, struct hashtable_node, head);
>>               if (table->compare(n, data)) {
>>                       return n;
>>               }
>>       }
>>       errno = ENOENT;
>>       return NULL;
>> }
>>
>> In the above function, you are passing the id which is the hash value.
>> Basically it allows you to find the hashnode in the hashtable.
>> But why we are again calling  compare function and check the equivalence
> of
>> the values? Is the id itself not enough?
>>
>> Thanks & Regards,
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body
>> of a message to majordomo@vger.kernel.org More majordomo info at
>> http://vger.kernel.org/majordomo-info.html
