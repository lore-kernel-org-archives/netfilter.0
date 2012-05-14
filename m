From: carlopmart <carlopmart@gmail.com>
Subject: Re: Problems with a forward rule
Date: Mon, 14 May 2012 18:47:01 +0200
Message-ID: <4FB13705.1020503@gmail.com>
References: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com> <alpine.LNX.2.01.1205121746300.5922@frira.vanv.qr> <4FAECDBA.9030302@saasplaza.com> <CAEjQA5LAwmxTwAGWJH5A5Bs57h8=BSXWwiWegYmVKSM7ZtvtmA@mail.gmail.com> <4FB0A732.4070909@saasplaza.com> <CAEjQA5JZ55ku3DZuQ_Oe+Ne-85Lr_zMse7VudYAryO5aH8-JLQ@mail.gmail.com> <4FB0AE39.6040805@saasplaza.com> <CAEjQA5+kYHgcm3FGkz_AEhTa6ASv8w5sWQQxAOkszeDM3=ukZQ@mail.gmail.com> <4FB0B337.4030208@saasplaza.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=bjizKU/97CAgEeB3eEw/r6C7Q6nz0lFrpLzLiplNW7E=;
        b=yj2vIOvFemE94QQpS4hGm0jLbUpMQvnhzJ+SX9/i7eldgPxPSkWCieoqcUtTfl/XpV
         cHJj7O077Hq8tSfrCZUZ8Ih02Rpw9y5L1oZkVCVjITFexG12jERwxME10MHI6FHaQA7J
         5HWVQ43vyY0bHVM4gSS8twJkFYQuUdZRP/MCebC8/neXPI96PKBbfvwp2APUbxN5WvWk
         /QCza+dT/5v2QszMb2ahEAs1/uyHzKSbdkTN3oycYNbUdpMmJn/b2SvbkLohYhL9+Mmf
         FGg8sD+Fg1vvBCF03tywDYI7Ct9K43ey+GASy700XE8Mf1dR3vMEdfpi01r6IrR29Oaf
         Tufw==
In-Reply-To: <4FB0B337.4030208@saasplaza.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05/14/2012 09:24 AM, Tom van Leeuwen wrote:
> On 05/14/2012 09:06 AM, C. L. Martinez wrote:
>> On Mon, May 14, 2012 at 9:03 AM, Tom van Leeuwen
>> <tom.van.leeuwen@saasplaza.com> wrote:
>>> So, when you do a ping from your host 172.24.50.3 to 1.1.1.x you will
>>> probably see the counter increase for your rule (with restricted
>>> destination).
>>> Do "iptables -vnL FORWARD" to check.
>>>
>>> That rule is not the problem.
>>>
>>> What traffic are you sending that times out?
>>> source ip, source port, destination ip, dest port, protocol?
>>>
>>> Your forward and postrouting rules look fine and should work
>>>
>>> Regards,
>>> Tom
>> My principal problems are with http, https and ssh. For example with a
>> https connection:
>>
>> Chain FORWARD (policy DROP 48 packets, 2432 bytes)
>> pkts bytes target prot opt in out source
>> destination
>> 4628 1901K ACCEPT all -- * * 0.0.0.0/0
>> 0.0.0.0/0 state RELATED,ESTABLISHED
>> 12 746 ACCEPT all -- * * 172.24.50.3
>> 10.196.0.0/16 state NEW
>> 42 2184 ACCEPT tcp -- * * 172.24.50.3
>> 195.76.69.66 tcp multiport dports 80,443 state NEW
>> 1 52 ACCEPT tcp -- * * 172.24.50.3
>> 195.76.69.69 tcp dpt:443 state NEW
>> 48 2432 LOG all -- * * 0.0.0.0/0
>> 0.0.0.0/0 LOG flags 0 level 4 prefix `IPT FORWARD packet
>> died: '
>>
>> First packets goes well, but after few seconds all goes to "IPT
>> FORWARD .." chain ...
> So stuff is logged! Please show what is logged, cause that is the key!

Ok, I have found the problem. Exists an intermediate fw blocking this 
type of traffic ...

Sorry for the noise.

  .. and many thanks for your help.

-- 
CL Martinez
carlopmart {at} gmail {d0t} com
