From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sun, 28 Feb 2010 07:38:18 +0100
Message-ID: <4B8A0F5A.7060903@chello.at>
References: <4b8984a7.0ab6660a.24bd.1f7f@mx.google.com>	 <4B898B4B.5050301@gatworks.com> <cfeab66d1002272046o320823b3t49f90044da1253ce@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002272046o320823b3t49f90044da1253ce@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 28.02.2010 05:47, netfilter-owner@vger.kernel.org wrote:
> George ,
> 
>              for -p option , we can specify icmp ( layer 3 protocol )
> or other layer 4 protocol other than UDP and TCP .
> 
>              I could be wrong . I am also a beginner .
> 
> Thanks,
> Ratheesh.
> 
> 
> 
> On Sun, Feb 28, 2010 at 2:44 AM, U. George <netbeans@gatworks.com> wrote:
>> It makes no diff to either udp or tcp - port address are at the same header
>> offset. It does makes a difference if you want to test both in the rule. I
>> only want to test ports with this rule.
>>
>> On 02/27/2010 03:46 PM, richard.horton@solstans.co.uk wrote:
>>  And as each rule is distinct the line with multiport does not know you have
>> already determined the protocol...
>> Ahhh, *But I know*. I designed the filter that way. If u want to *warn* me,
>> then thats probably ok.
>> --


Could you guys please stop top posting.
