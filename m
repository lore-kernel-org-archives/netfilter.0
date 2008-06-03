From: Mark Perry <rita.co.ltd@googlemail.com>
Subject: Re: load balance [OT?]
Date: Wed, 04 Jun 2008 00:40:58 +0700
Message-ID: <4845822A.2060801@googlemail.com>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>	 <1212510920.2539.16738.camel@kr0sty.1.com.ar>	 <4845768C.5020506@googlemail.com>	 <1212512790.2539.16755.camel@kr0sty.1.com.ar>	 <48457ACE.7020707@googlemail.com> <1212513911.2539.16766.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:organization:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=/RSvg3GCl6FSMxtVDVg8zlLdFBBvefQFxraYSJlliO4=;
        b=nIpCuK7b70uKm0oyG4SD8F5EfDljzz9KAHgDn+kRNUyCS820J13E7+oDR8vwiF510cHOzRkNkO2oYske/mT/wc/iVzPYC77SozBEFu8auYYkCTrG1bMr/HGPdr3+QCbn3UToMJFKaqFGFNufpHpRDXaKBTufyJnm8WF9GkznBEA=
In-Reply-To: <1212513911.2539.16766.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Martin wrote:
> On Wed, 2008-06-04 at 00:09 +0700, Mark Perry wrote:
>> Martin wrote:
>>> On Tue, 2008-06-03 at 23:51 +0700, Mark Perry wrote:
>>>> Martin wrote:
>>>>
>>>>>> #Rules for ISPs
>>>>>> ip rule add $ISP1_IP table 1
>>>>>> ip rule add $ISP2_IP table 2
>>>>>>
>>>> Are these rules working?
>>>> shouldn't they be:
>>>>
>>>> ip rule add from $ISP1_IP table 1
>>>> ip rule add from $ISP2_IP table 2
>>>>
>>>>
>>>> mark
> 
>>> Actually the do work. Why they shouldn't?
>>>
>>>
> 
>> I tried then on a system at hand (OK 2.6.16 with iproute2 2.6.15) and I 
>> got a parse error without the "from".
>>
>> I'm no expert (an enthusiast maybe) - just another pair of eyes ;-)
>>
>> mark
> 
> 
> Mmmm...don't know...could it be a different iproute package?
> 
> I've installed a Debian "apt-get" one.
> 
> #dpkg -l | grep iproute
> 
> ii   iproute			20061002-3
> 
> 
> May be I can try downloading source and compiling
> 
> Thanks for the extra eyes :)

Well the important thing is do (after a reboot and rerun of your shell 
script):

ip route show
ip route show table 1
ip route show table 2
and
ip rule show

Produce the expected results?

mark
