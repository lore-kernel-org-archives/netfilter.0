From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: intermittent nat issue
Date: Thu, 26 Jan 2017 21:55:29 +0100
Message-ID: <92b70da4-3725-71f1-42b1-396bc2671caa@conversis.de>
References: <6a6cc500-9c8a-4075-f856-fb5d90f0571b@pkfnet.co.za>
 <1e5b43088d9a493faee12f3027ce8aa5@aalto.fi>
 <64c68c3a-9397-a93b-4cc4-8e6db25e02c6@pkfnet.co.za>
 <14ec9b85-d18b-db28-b0a1-3459835da78e@conversis.de>
 <04c2569a9abf471b98c6b759271a4431@aalto.fi>
 <2cb772b8-476f-3136-910e-dea552c6d80c@conversis.de>
 <CAGOYNM8h-+Zpg-qp6TJ9JwiSTvQwYFMyMCGM0UDLvFxd2-Y4_w@mail.gmail.com>
 <159c1a5e968.27c2.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <159c1a5e968.27c2.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mark Coetser <mark@pkfnet.co.za>, Andre Cunha <anovaescunha@gmail.com>
Cc: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>, netfilter@vger.kernel.org

I filed a bug for this:
https://bugzilla.netfilter.org/show_bug.cgi?id=1115

On 21.01.2017 16:29, Mark Coetser wrote:
> I am seeing this across multiple firewalls that have vlan setups for the
> external links.
> 
> Thank you,
> 
> Mark Adrian Coetser
> mark@pkfnet.co.za
> 
> 
> 
> On 21 January 2017 14:52:41 Andre Cunha <anovaescunha@gmail.com> wrote:
> 
>> I had a similar issue, and in my case I found out that for some reason
>> the
>> external bridge interface had the MAC address as the internal bridge, and
>> this of course was messing with the NAT process.
>>
>> Regards
>> Andre
>>
>>
>> On Sat, Jan 21, 2017 at 1:33 AM, Dennis Jacobfeuerborn <
>> dennisml@conversis.de> wrote:
>>
>>> Hi,
>>> when I do a tcpdump of these packets and then immediately look into the
>>> conntrack table I can find no associated entries there suggesting that
>>> the entries have indeed been removed right away without any sort of
>>> timeout.
>>>
>>> Regards,
>>>   Dennis
>>>
>>> On 20.01.2017 16:23, Llorente Santos Jesus wrote:
>>> > Hi,
>>> > I wouldn't think that is the problem...as far as I know conntrack sets
>>> specific timeouts on the connections to match with the actual conntrack
>>> state.
>>> > You can see these via
>>> > sysctl -a |  grep net.netfilter.nf_conntrack_
>>> >
>>> > Best,
>>> > Jesus
>>> >
>>> > -----Original Message-----
>>> > From: Dennis Jacobfeuerborn [mailto:dennisml@conversis.de]
>>> > Sent: 20 January 2017 12:37
>>> > To: Mark Coetser <mark@pkfnet.co.za>; Llorente Santos Jesus <
>>> jesus.llorente.santos@aalto.fi>; netfilter@vger.kernel.org
>>> > Subject: Re: intermittent nat issue
>>> >
>>> > On 20.01.2017 10:47, Mark Coetser wrote:
>>> >> Hi Llorente
>>> >>
>>> >> I did run conntrack -F to check that but still had the unnatted
>>> >> packets traversing the interface.
>>> >>
>>> >
>>> > Hi, I'm seeing this as well on our systems. One thing I notice is that
>>> all packets either the RST of FIN flag set. Could this be some sort
>>> of race
>>> condition where Conntrack removes the connection from the table
>>> because of
>>> the flags and as a result the final packet will not get
>>> masqueraded/nat'ed?
>>> >
>>> > Regards,
>>> >   Dennis
>>> >
>>> > N?????r??y???b?X??ǧv?^?)޺{.n?+???z??׫?{ay? ʇڙ?,j ??f???h???z? ?w???
>>> ???j:+v???w?j?m???? ????zZ+?????ݢj"??!tml=
>>> >
>>>
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
> 

