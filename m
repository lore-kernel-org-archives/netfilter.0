From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: try to change os fingerprint
Date: Fri, 21 Aug 2009 17:30:06 +0530
Message-ID: <4A8E8C46.7080702@infoservices.in>
References: <4A8E5BD6.5040904@infoservices.in> <1250855388.6489.21.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1250855388.6489.21.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

John A. Sullivan III wrote:
> On Fri, 2009-08-21 at 14:03 +0530, J. Bakshi wrote:
>   
>> Hello,
>>
>> I am trying to change the OS fingerprint with iptables. Here are two
>> rule set which I have constructed to do the same
>>
>> ````````
>> iptables -t mangle -A PREROUTING - -j PERS --tweak dst --local --conf
>> example/win9x.conf
>> iptables -t mangle -A OUTPUT -j PERS --tweak src --local --conf
>> example/win9x.conf
>> ````````````
>>
>> But it throws an error like
>>
>> ``````````
>> iptables v1.4.2-rc1: Unknown arg `--tweak'
>> Try `iptables -h' or 'iptables --help' for more information.
>> ```````````````
>>
>> What might be the problem here ?
>> Thanks
>>     
> <snip>
> I'm not familiar with the PERS target.  It does not show up in my
> iptables.  Is it available in your kernel or do you need to load and
> perhaps compile a module for it? - John
>   

I am not very sure but maybe we need to patch the kernel. Any clue from
anyone ?

Thanks
