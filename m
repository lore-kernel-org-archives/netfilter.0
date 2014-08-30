From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Problem using hashlimit for bandwidth limit
Date: Sat, 30 Aug 2014 11:56:07 +0530
Message-ID: <CAA5aLPgYg1pt6pAVc8Brbt+FOLr8UJOh23HcoOfTkp0dwCqqQA@mail.gmail.com>
References: <CAA5aLPhZo+qGMcFA=HOm-KgcczyJvf_27rxnG3_1h8hQpK+kHQ@mail.gmail.com>
	<08FA3185F32849E1AD18DB14C8A8248D@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=AtKSt9QbXJR+Yyk1XoIrlaIoAZjGxbHzJl74NrINTJc=;
        b=gixY1yZ/twqO9tqgnofzT7775OTlQ7irLaUmyHQq1jSfwAKS0aRQNU/W5kLSrDnEzL
         CyHdF0ketUeNsCAVEJymaeICpJoMVjgjq4OpcuiRk8g9A2uA+eFzMRU/cyWMWPNHz5kh
         WlWQj2GOFbnC0G7eCUljk3hX3Wnik38f93Pkd9Dtd+QrojKumIfg6wk3Vsw9lgD9adWK
         PWsqQZXMOTQK53q2Wt1FdOd1lN4SUb1/pbzI7WR8NOr4r9zbqSMpgxxpIa37Z6tia5Ct
         PDOdtw17kHFQmUom1hnCIQGFVm60VsZeqISKsL+lJ1irzqKq33/tb7KEa40fKI0KxI8t
         aWEQ==
In-Reply-To: <08FA3185F32849E1AD18DB14C8A8248D@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: netfilter@vger.kernel.org

I might be bothering too muchbut I am not able to find any info on
this on google. Looks like everyone is happy using hashlimit for
bandwidth control and I am the only one in the desert trying to
survive. Please help.

On 28/08/2014 6:42 pm, "Payam Chychi" <pchychi@gmail.com> wrote:
>
> This is an old and well covered item, google can be of help
>
> You wont get the required results hashlimit takes your clockspeed into account... Amongs a few others.
>
> Kindly google
>
> --
> Payam Chychi
> Network Engineer / Security Specialist
>
> On Thursday, August 28, 2014 at 1:33 AM, Akshat Kakkar wrote:
>>
>> Hi!
>>
>>
>> I want to use hashlimit for giving all my users a fix set of bandwidth
>> of 512kbps for accessing internet.
>>
>>
>> I am using following command.
>>
>>
>> # allowing return packets so that rate limiting is done only on forward packets.
>>
>> iptables -A FORWARD -s 192.168.192.168 -j ACCEPT
>>
>> # If limit is upto 512 then allow
>>
>> iptables -A FORWARD -m hashlimit --hashlimit-name test512
>> --hashlimit-mode srcip --hashlimit-htable-size 1000
>> --hashlimit-htable-max 1000 --hashlimit-upto 64kb/s --hashlimit-burst
>> 128kb -j ACCEPT
>>
>> # else drop
>>
>> iptables -A FORWARD -j DROP
>>
>>
>> I am not observing the expected behaviour.
>>
>> I am sending ping of 100 bytes continously at 10 msec interval.
>>
>> What I observed is , I got back reply of only first 2 pings and for
>> remaining there is no reply. Nest reply came only after 103 Seconds
>> !!! and that too only a single reply.
>>
>>
>> output of iptables -L -n -v also shows only 2 packets matching this rule.
>>
>>
>> output of command cat /proc/net/ipt_hashlimit/test512 come like
>>
>>
>> 59 10.10.10.10:0->192.168.192.168:0 764416 6688000 3328000
>>
>> the number 764416 keeps on increasing but not observed any reply till
>> it reaches the value of 3328000. But it takes huge time (~103 Seconds)
>> to reach that value.
>>
>>
>> Can anyone please explain all this behaviour ?
>>
>>
>> Thank you .
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
