From: Sebastian Arcus <shop@open-t.co.uk>
Subject: Re: Iptables "-m time" option doesn't update when the clock changes
Date: Thu, 29 Mar 2012 10:30:21 +0100
Message-ID: <4F742BAD.20002@open-t.co.uk>
References: <4F7426FA.2060902@open-t.co.uk> <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1203291111080.27349@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Hi,

On 29/03/12 10:12, Jan Engelhardt wrote:
> On Thursday 2012-03-29 11:10, Sebastian Arcus wrote:
>
>> I'm using the following line in my iptables firewall to block internet access
>> for one of the machines on the network for one hour a day:
>>
>> Code:
>>
>> iptables -A FORWARD -p ALL -o $INET_IFACE -m mac --mac-source $BLOCKED_MAC1 -m
>> time --timestart $BLOCKED_TIMESTART1 --timestop $BLOCKED_TIMESTOP1 -j DROP
>>
>>
>> Everything works fine - except that when the clocks change from winter time to
>> summer time (in UK) - the rule keeps on working on the old time.
>
> This is documented behavior, see manpage (preferably that of a recent
> release).

Thank you for that. According to my manpage:

"--localtz
    Interpret the times given for --datestart, --datestop,  --timestart 
and --timestop to be local kernel time. (Default)"

It sounds like the rule above should be using the local time (default). 
It still doesn't explain why it is stuck on the time before the clock 
change though?
