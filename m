From: Anil kumar <anilkumar508@gmail.com>
Subject: Re: Connection tracking notification events
Date: Tue, 8 Mar 2016 22:11:02 +0530
Message-ID: <CAD54ZaWhNWvNnTBfhmfk05aDoNRgg_T8RCU+iFAOqkqfiSENew@mail.gmail.com>
References: <CAD54ZaUgBnhPObX7PkJ6+pJin5ynZQwuKvVyRWSY7TdC1z9KyA@mail.gmail.com>
 <CAKJ7aR7obCuFwMW9BDq3ytcpFw5BpUrwJa+apgvVaHfaq1U0wg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=UA+16VgcUD9AGO2DwmTI91+JT8Rsqfu0ISuZ/JGWGsk=;
        b=f+ALj4WIDY7Nc3728hGxctOlT7OScRHlX0g5mYqRjvQEHFWxoy4zQRnPMsZoFSoV+V
         w/c3YKBFoX+kftnjvwlaG9fSesX9CV4DGtQodGLH6UILL22ghvxEiCtbsUNtTY4RDpAR
         V1BlLii7lioP8Nyu+G0n0NLvV4uNPvMU0V6PMP1FMq6QZtJYNs4bzdAgrjUb2NoUBsqv
         UHqrfvoyEBVMsNZWqeG5NmtqMm0a+OLEjZdmW7nBe44Yy77a23N0y4c2zTpY6zuaRz0N
         TzeMXQNZX4JtNPJECrB/wyGNplnT354o79AjDBcnwPncyyshBVdoqqVJKT+6ZeJQnXXS
         211g==
In-Reply-To: <CAKJ7aR7obCuFwMW9BDq3ytcpFw5BpUrwJa+apgvVaHfaq1U0wg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gadre Nayan <gadrenayan@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Nayan,

The function 'nf_conntrack_register_notifier' and the related
functions are declared in nf_conntrack_ecache.h within the macro
CONFIG_NF_CONNTRACK_EVENTS. If this macro is disabled, we may not be
able to use these functions.

And also the help text for this macro says that the connection
tracking code will provide notifier chain if the macro is enabled. I
guess i am missing something else.


Thanks,
Anil

On Tue, Mar 8, 2016 at 8:59 PM, Gadre Nayan <gadrenayan@gmail.com> wrote:
> Hi Anil,
>
> When you enable "CONFIG_NF_CONNTRACK_EVENTS" there is a notifier that
> gets registered automatically.
>
> I think you should disable this Configuration and then register your
> module with your own event notifier structure.
>
> Regards
>
> On Tue, Mar 8, 2016 at 5:58 PM, Anil kumar <anilkumar508@gmail.com> wrote:
>> Hi All,
>>
>> I am trying to test the connection tracking notification events.  For
>> this i have enabled the config "CONFIG_NF_CONNTRACK_EVENTS" and trying
>> to register for the notifications using nf_conntrack_register_notifier
>> function.
>>
>> static struct nf_ct_event_notifier fp_conntrack_event_nb = {
>>         .fcn = fp_conntrack_event,
>> };
>>
>> ret = nf_conntrack_register_notifier(&init_net, &fp_conntrack_event_nb);
>>
>>
>> This registration function is failing (return value is less than 0).
>> Also tried in older kernel (in 3.1 kernel, the function takes single
>> argument) the function is failing.
>> Do we need enable any other configs ?
>>
>>
>> Thanks,
>> Anil
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
