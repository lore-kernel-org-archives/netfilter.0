From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: Mysterious string "<4>"  in LOG
Date: Sat, 15 Sep 2012 12:54:06 +0200
Message-ID: <50545E4E.60300@mutluit.com>
References: <k31kov$5me$1@ger.gmane.org> <505459B3.8020400@evcz.tk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <505459B3.8020400@evcz.tk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thanks, but it's still confusing.
What steps are needed to disable this at user level?
Is a kernel recompilation necessary?


Marco Padovan wrote, On 09/15/2012 12:34 PM:
> http://www.spinics.net/lists/netfilter/msg53327.html
>
> Il 15/09/2012 12:20, U.Mutlu ha scritto:
>> Hello,
>>
>> A mysterious string "<4>" gets prepended in LOG:
>> Rule:
>>   iptables -A INPUT  -m state --state INVALID -m limit --limit 7200/h
>> -j LOG --log-prefix "INPUT INVALID "
>>
>> Result (sanitized):
>> Sep 15 11:46:17 s7 kernel: [227009.792828] <4>INPUT INVALID IN=eth0
>> OUT= MAC=00:1b:21:ad:7b:d3:00:0c:db:4e:e8:00:08:00 SRC=**.210.155.237
>> DST=**.114.132.147 LEN=40 TOS=0x00 PREC=0x00 TTL=52 ID=49676 PROTO=TCP
>> SPT=6667 DPT=46271 WINDOW=0 RES=0x00 ACK SYN URGP=0
>>
>> Happens with all LOG entries.
>> Is the string "<4>" in front of "INPUT INVALID" a new feature, or is
>> it garbage due to a bug?
<snip>


